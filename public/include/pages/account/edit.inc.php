<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
  die('Hacking attempt');

if ($user->isAuthenticated()) {
  if ( ! $user->checkPin($_SESSION['USERDATA']['id'], @$_POST['authPin']) && @$_POST['do']) {
    $_SESSION['POPUP'][] = array('CONTENT' => '无效的 PIN 码','TYPE' => 'errormsg');
  } else {
    switch (@$_POST['do']) {
    case 'cashOut':
      if ($setting->getValue('manual_payout_active') == 1) {
        $_SESSION['POPUP'][] = array('CONTENT' => '正在进行手动付款，请稍后再试。', 'TYPE' => 'errormsg');
      } else {
        $setting->setValue('manual_payout_active', 1);
        $continue = true;
        $aBalance = $transaction->getBalance($_SESSION['USERDATA']['id']);
        $dBalance = $aBalance['confirmed'];
        $sCoinAddress = $user->getCoinAddress($_SESSION['USERDATA']['id']);
        // Ensure we can cover the potential transaction fee
        if ($dBalance > $config['txfee']) {
          if ($bitcoin->can_connect() === true) {
            try {
              $bitcoin->validateaddress($sCoinAddress);
            } catch (BitcoinClientException $e) {
              $_SESSION['POPUP'][] = array('CONTENT' => '无效的付款地址： ' . $sUserSendAddress, 'TYPE' => 'errormsg');
              $continue = false;
            }
            if ($continue == true) {
              // Send balance to address, mind fee for transaction!
              try {
                if ($setting->getValue('auto_payout_active') == 0) {
                  $bitcoin->sendtoaddress($sCoinAddress, $dBalance - $config['txfee']);
                } else {
                  $_SESSION['POPUP'][] = array('CONTENT' => 'Auto-payout active, please contact site support immidiately to revoke invalid transactions.', 'TYPE' => 'errormsg');
                  $continue = false;
                }
              } catch (BitcoinClientException $e) {
                $_SESSION['POPUP'][] = array('CONTENT' => '发送失败 ' . $config['currency'] . ', 请联系网站的技术支持', 'TYPE' => 'errormsg');
                $continue = false;
              }
            }
            // Set balance to 0, add to paid out, insert to ledger
            if ($continue == true && $transaction->addTransaction($_SESSION['USERDATA']['id'], $dBalance - $config['txfee'], 'Debit_MP', NULL, $sCoinAddress) && $transaction->addTransaction($_SESSION['USERDATA']['id'], $config['txfee'], 'TXFee', NULL, $sCoinAddress) ) {
              $_SESSION['POPUP'][] = array('CONTENT' => 'Transaction completed', 'TYPE' => 'success');
              $aMailData['email'] = $user->getUserEmail($user->getUserName($_SESSION['USERDATA']['id']));
              $aMailData['amount'] = $dBalance;
              $aMailData['subject'] = 'Manual Payout Completed';
              $notification->sendNotification($_SESSION['USERDATA']['id'], 'manual_payout', $aMailData);
            }
          } else {
            $_SESSION['POPUP'][] = array('CONTENT' => '无法连接到 wallet RPC 服务', 'TYPE' => 'errormsg');
          }
        } else {
          $_SESSION['POPUP'][] = array('CONTENT' => '资金不足，您需要支付不少于 ' . $config['txfee'] . ' ' . $conifg['currency'] . ' 的交易费。', 'TYPE' => 'errormsg');
        }
        $setting->setValue('manual_payout_active', 0);
      }
      break;

    case 'updateAccount':
      if ($user->updateAccount($_SESSION['USERDATA']['id'], $_POST['paymentAddress'], $_POST['payoutThreshold'], $_POST['donatePercent'], $_POST['email'])) {
        $_SESSION['POPUP'][] = array('CONTENT' => '已更新帐户的详细信息', 'TYPE' => 'success');
      } else {
        $_SESSION['POPUP'][] = array('CONTENT' => '账户信息更新失败: ' . $user->getError(), 'TYPE' => 'errormsg');
      }
      break;

    case 'updatePassword':
      if ($user->updatePassword($_SESSION['USERDATA']['id'], $_POST['currentPassword'], $_POST['newPassword'], $_POST['newPassword2'])) {
        $_SESSION['POPUP'][] = array('CONTENT' => '密码更新', 'TYPE' => 'success');
      } else {
        $_SESSION['POPUP'][] = array('CONTENT' => $user->getError(), 'TYPE' => 'errormsg');
      }
      break;
    }
  }
}

// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>

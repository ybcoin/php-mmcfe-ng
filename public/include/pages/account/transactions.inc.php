<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');
if ($user->isAuthenticated()) {
  $aTransactions = $transaction->getTransactions($_SESSION['USERDATA']['id']);
  if (!$aTransactions) $_SESSION['POPUP'][] = array('CONTENT' => '无交易记录', 'TYPE' => 'errormsg');
  $smarty->assign('TRANSACTIONS', $aTransactions);
  $smarty->assign('CONTENT', 'default.tpl');
}
?>

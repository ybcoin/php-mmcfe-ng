<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');
if ($user->isAuthenticated()) {
  if (@$_REQUEST['do'] == 'save') {
    if ($notification->updateSettings($_SESSION['USERDATA']['id'], $_REQUEST['data'])) {
      $_SESSION['POPUP'][] = array('CONTENT' => 'Updated notification settings');
    } else {
      $_SESSION['POPUP'][] = array('CONTENT' => 'Failed to update settings', 'TYPE' => 'errormsg');
    }
  }

  // Fetch notifications
  $aNotifications = $notification->getNofifications($_SESSION['USERDATA']['id']);
  if (!$aNotifications) $_SESSION['POPUP'][] = array('CONTENT' => '没有新通知', 'TYPE' => 'errormsg');

  // Fetch user notification settings
  $aSettings = $notification->getNotificationSettings($_SESSION['USERDATA']['id']);

  $smarty->assign('NOTIFICATIONS', $aNotifications);
  $smarty->assign('SETTINGS', $aSettings);
  $smarty->assign('CONTENT', 'default.tpl');
}
?>

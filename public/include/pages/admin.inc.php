<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

// Check user to ensure they are admin
if (!$user->isAuthenticated() || !$user->isAdmin($_SESSION['USERDATA']['id'])) {
  header("HTTP/1.1 404 Page not found");
  die("404 Page not found, isAdmin:"  + $user->isAdmin($_SESSION['USERDATA']['id']));
}

// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>

<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

// Check user to ensure they are admin
if (!$user->isAuthenticated() || !$user->isAdmin($_SESSION['USERDATA']['id'])) {
  header("HTTP/1.1 404 Page not found");
  die("404 Page not found");
}

// Include markdown library
use \Michelf\Markdown;

if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
  if (@$_REQUEST['do'] == 'save') {
    if ($whatsnew->updateNews($_REQUEST['id'], $_REQUEST['header'], $_REQUEST['content'], $_REQUEST['active'])) {
      $_SESSION['POPUP'][] = array('CONTENT' => "What's New updated", 'TYPE' => 'alert alert-success');
    } else {
      $_SESSION['POPUP'][] = array('CONTENT' => "What's New update failed: " . $whatsnew->getError(), 'TYPE' => 'alert alert-danger');
    }
  }
}

// Fetch what's new entry
$aWhatsnew = $whatsnew->getEntry($_REQUEST['id']);
$smarty->assign("WHATSNEW", $aWhatsnew);
$smarty->assign("CONTENT", "default.tpl");

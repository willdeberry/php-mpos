<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

// Check user to ensure they are admin
if (!$user->isAuthenticated() || !$user->isAdmin($_SESSION['USERDATA']['id'])) {
  header("HTTP/1.1 404 Page not found");
  die("404 Page not found");
}

// Include markdown library
use \Michelf\Markdown;

if (@$_REQUEST['do'] == 'toggle_active') {
  if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
    if ($whatsnew->toggleActive($_REQUEST['id'])) {
      $_SESSION['POPUP'][] = array('CONTENT' => "What's New entry changed", 'TYPE' => 'alert alert-success');
    }
  }
}

if (@$_REQUEST['do'] == 'add') {
  if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
    if ($whatsnew->addNews($_SESSION['USERDATA']['id'], $_POST['data'])) {
      $_SESSION['POPUP'][] = array('CONTENT' => "What's New entry added", 'TYPE' => 'alert alert-success');
    } else {
      $_SESSION['POPUP'][] = array('CONTENT' => 'Failed to add new entry: ' . $whatsnew->getError(), 'TYPE' => 'alert alert-danger');
    }
  }
}

if (@$_REQUEST['do'] == 'delete') {
  if (!$config['csrf']['enabled'] || $config['csrf']['enabled'] && $csrftoken->valid) {
    if ($whatsnew->deleteNews((int)$_REQUEST['id'])) {
      $_SESSION['POPUP'][] = array('CONTENT' => "Succesfully removed what's new entry", 'TYPE' => 'alert alert-success');
    } else {
      $_SESSION['POPUP'][] = array('CONTENT' => 'Failed to delete entry: ' . $whatsnew->getError(), 'TYPE' => 'alert alert-danger');
    }
  }
}

// Fetch all what's new
$aWhatsnew = $whatsnew->getAll();
foreach ($aWhatsnew as $key => $aData) {
  // Transform Markdown content to HTML
  $aWhatsnew[$key]['content'] = Markdown::defaultTransform($aData['content']);
}
$smarty->assign("WHATSNEW", $aWhatsnew);
$smarty->assign("CONTENT", "default.tpl");

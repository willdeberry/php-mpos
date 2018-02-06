<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

// Include markdown library
use \Michelf\Markdown;

if (!$smarty->isCached('master.tpl', $smarty_cache_key)) {
  $debug->append('No cached version available, fetching from backend', 3);
  // Fetch what's new to display
  $aWhatsnew = $whatsnew->getAllActive();
  if (is_array($aWhatsnew)) {
    foreach ($aWhatsnew as $key => $aData) {
      // Transform Markdown content to HTML
      $aWhatsnew[$key]['content'] = Markdown::defaultTransform($aData['content']);
    }
  }

  $smarty->assign("HIDEAUTHOR", $setting->getValue('acl_hide_news_author'));
  $smarty->assign("WHATSNEW", $aWhatsnew);
} else {
  $debug->append('Using cached page', 3);
}
// Load news entries for Desktop site and unauthenticated users
$smarty->assign("CONTENT", "default.tpl");

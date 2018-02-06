{if $GLOBAL.website.newsstyle|default:"0" == 0}
  {include file="whatsnew/news_all.tpl"}
{else}
  {include file="whatsnew/news_accordion.tpl"}
{/if}

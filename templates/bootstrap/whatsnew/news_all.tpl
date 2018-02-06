{section name=whatsnew loop=$WHATSNEW}
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-bookmark"></i> {$WHATSNEW[whatsnew].header}
        <br />
        <font size="1px">posted {$WHATSNEW[whatsnew].time|date_format:$GLOBAL.config.date}{if $HIDEAUTHOR|default:"0" == 0} by <b>{$WHATSNEW[whatsnew].author}</b>{/if}</font>
      </div>
      <div class="panel-body">
        {$WHATSNEW[whatsnew].content nofilter}
      </div>
    </div>
  </div>
</div>
{/section}

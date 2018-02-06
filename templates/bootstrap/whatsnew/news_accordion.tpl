    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-info">
          <div class="panel-heading">
            <h5><i class="fa fa-info-circle fa-fw"></i> what's new</h5>
          </div>
          <div class="panel-body">
            <div class="panel-group" id="accordion">
{section name=whatsnew loop=$WHATSNEW}
              <div class="panel panel-default">
                <div class="panel-heading">
                  <i class="fa fa-info fa-fw"></i> <a data-toggle="collapse" data-parent="#accordion" href="#collapse{$smarty.section.news.index}">{$WHATSNEW[whatsnew].header}</a>
                  <br />
                  <font size="1px">posted {$WHATSNEW[whatsnew].time|date_format:$GLOBAL.config.date}{if $HIDEAUTHOR|default:"0" == 0} by <b>{$WHATSNEW[whatsnew].author}</b>{/if}</font>
                </div>
                <div id="collapse{$smarty.section.news.index}" class="panel-collapse collapse {if $smarty.section.news.index == 0}in{/if}">
                  <div class="panel-body">
                    {$WHATSNEW[whatsnew].content nofilter}
                  </div>
                </div>
              </div>
{/section}
            </div>
          </div>
        </div>
      </div>
    </div>

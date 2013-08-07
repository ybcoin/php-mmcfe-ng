{if $GLOBAL.userdata.username|default}
            <h2>您好, {$smarty.session.USERDATA.username} <span style="font-size:12px;"><b>活跃账户</b>: <b>{$GLOBAL.fees}%</b> 税费 <i>(您从收益中 <a href='{$smarty.server.PHP_SELF}?page=account&action=edit'>捐赠</a> <b></i>{$GLOBAL.userdata.donate_percent}%</b> <i>)</i></span></h2>
{else}
            <h2>您好访客, <span style="font-size:12px;"> 请 <a href="{$smarty.server.PHP_SELF}?page=register">注册</a> 后加入到我们的矿池。</span></h2>
{/if}

{include file="global/block_header.tpl" BLOCK_HEADER="账户详细资料"}
    <form action="{$smarty.server.PHP_SELF}" method="post">
      <input type="hidden" name="page" value="{$smarty.request.page|escape}">
      <input type="hidden" name="action" value="{$smarty.request.action|escape}">
      <input type="hidden" name="do" value="updateAccount">
      <table>
        <tbody><tr><td>账户名: </td><td>{$GLOBAL.userdata.username}</td></tr>
        <tr><td>Id: </td><td>{$GLOBAL.userdata.id}</td></tr>
        <tr><td>API Key: </td><td><a href="{$smarty.server.PHP_SELF}?page=api&action=getuserstatus&api_key={$GLOBAL.userdata.api_key}&id={$GLOBAL.userdata.id}">{$GLOBAL.userdata.api_key}</a></td></tr>
        <tr><td>E-Mail: </td><td><input type="text" name="email" value="{$GLOBAL.userdata.email|escape}" size="20"></td></tr>
        <tr><td>付款地址: </td><td><input type="text" name="paymentAddress" value="{$smarty.request.paymentAddress|default:$GLOBAL.userdata.coin_address|escape}" size="40"></td></tr>
        <tr><td>捐款 %: </td><td><input type="text" name="donatePercent" value="{$smarty.request.donatePercent|default:$GLOBAL.userdata.donate_percent|escape}" size="4"><font size="1"> [捐款金额的百分比（例如：0.5%）]</font></td></tr>
        <tr><td>自动付款阈值: </td><td valign="top"><input type="text" name="payoutThreshold" value="{$smarty.request.payoutThreshold|default:$GLOBAL.userdata.ap_threshold|escape}" size="5" maxlength="5"> <font size="1">[{$GLOBAL.config.ap_threshold.min}-{$GLOBAL.config.ap_threshold.max} {$GLOBAL.config.currency}. 设置'0' 为不自动付款]</font></td></tr>
        <tr><td>4位数 PIN 码: </td><td><input type="password" name="authPin" size="4" maxlength="4"><font size="1"> [您在注册时选择的4位数PIN码]</font></td></tr>
      </tbody></table>
      <input type="submit" class="submit long" value="更新设置"></form>
{include file="global/block_footer.tpl"}

{include file="global/block_header.tpl" BLOCK_HEADER="取款"}
    <ul><li><font color="">Please note: a {$GLOBAL.config.txfee} {$GLOBAL.config.currency} transaction will apply when processing "On-Demand" manual payments</font></li></ul>
    <form action="{$smarty.server.PHP_SELF}" method="post">
      <input type="hidden" name="page" value="{$smarty.request.page|escape}">
      <input type="hidden" name="action" value="{$smarty.request.action|escape}">
      <input type="hidden" name="do" value="cashOut">
      <table>
        <tbody><tr><td>帐户余额: &nbsp;&nbsp;&nbsp;</td><td>{$GLOBAL.userdata.balance.confirmed|escape} {$GLOBAL.config.currency}</td></tr>
        <tr><td>付款到: </td><td><h6>{$GLOBAL.userdata.coin_address|escape}</h6></td></tr>
        <tr><td>4位数PIN码: </td><td><input type="password" name="authPin" size="4" maxlength="4"></td></tr>
      </tbody></table>
      <input type="submit" class="submit mid" value="取款"></form>
{include file="global/block_footer.tpl"}

{include file="global/block_header.tpl" BLOCK_HEADER="修改密码"}
    <ul><li><font color="">注意：密码更改成功完成后您将被重定向到登录页面</font></li></ul>
    <form action="{$smarty.server.PHP_SELF}" method="post"><input type="hidden" name="act" value="updatePassword">
      <input type="hidden" name="page" value="{$smarty.request.page|escape}">
      <input type="hidden" name="action" value="{$smarty.request.action|escape}">
      <input type="hidden" name="do" value="updatePassword">
      <table>
        <tbody><tr><td>当前密码: </td><td><input type="password" name="currentPassword"></td></tr>
        <tr><td>新密码: </td><td><input type="password" name="newPassword"></td></tr>
        <tr><td>确认新密码: </td><td><input type="password" name="newPassword2"></td></tr>
        <tr><td>4位数PIN码: </td><td><input type="password" name="authPin" size="4" maxlength="4"></td></tr>
      </tbody></table>
      <input type="submit" class="submit long" value="修改密码"></form>
{include file="global/block_footer.tpl"}

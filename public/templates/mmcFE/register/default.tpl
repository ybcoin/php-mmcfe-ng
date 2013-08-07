{include file="global/block_header.tpl" BLOCK_HEADER="加入我们的矿池" BLOCK_STYLE="clear:none;"}
<form action="{$smarty.server.PHP_SELF}" method="post">
  <input type="hidden" name="page" value="{$smarty.request.page|escape}">
  <input type="hidden" name="action" value="register">
  <table width="90%" border="0">
    <tbody>
      <tr><td>账户名:</td><td><input type="text" class="text tiny" name="username" value="{$smarty.post.username|escape|default:""}" size="15" maxlength="20" required></td></tr>
      <tr><td>密码:</td><td><input type="password" class="text tiny" name="password1" value="" size="15" maxlength="20" required></td></tr>
      <tr><td>确认密码:</td><td><input type="password" class="text tiny" name="password2" value="" size="15" maxlength="20" required></td></tr>
      <tr><td>Email:</td><td><input type="text" name="email1" class="text small" value="{$smarty.post.email1|escape|default:""}" size="15" required></td></tr>
      <tr><td>确认Email:</td><td><input type="text" class="text small" name="email2" value="{$smarty.post.email2|escape|default:""}" size="15" required></td></tr>
      <tr><td>PIN:</td><td><input type="password" class="text pin" name="pin" value="" size="4" maxlength="4"><span style="font-size:12px"> (4位数字。<b style="color:red;">请牢记PIN码，以后无法修改!</b>)</span></td></tr>
      <tr><td colspan="2">{nocache}{$RECAPTCHA|default:""}{/nocache}</td></tr>
      <tr><td class="center"><input type="submit" class="submit small" value="注册"></td><td></td></tr>
    </tbody>
  </table>
</form>
{include file="global/block_footer.tpl"}

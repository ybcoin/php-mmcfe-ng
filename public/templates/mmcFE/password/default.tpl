{include file="global/block_header.tpl" BLOCK_HEADER="重设密码" BLOCK_STYLE="clear:none;"}
<form action="" method="POST">
<input type="hidden" name="page" value="password">
<input type="hidden" name="action" value="reset">
  <p>如果您的账户设置了电子邮件，请输入您的账户名来重设密码。</p>
  <p><input type="text" value="{$smarty.post.username|default:""}" size="50" name="username" required></p><p><input class="submit small" type="submit" value="重设"></p>
</form>
{include file="global/block_footer.tpl"}

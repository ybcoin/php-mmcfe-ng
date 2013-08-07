{include file="global/block_header.tpl" BLOCK_HEADER="登录" BLOCK_STYLE="clear:none; margin-left:13px;  margin-top:15px;"}        
	<form action="{$smarty.server.PHP_SELF}?page=login" method="post" id="loginForm">
          <p><input type="text" name="username" value="" id="userForm" maxlength="20" required></p>
          <p><input type="password" name="password" value="" id="passForm" maxlength="20" required></p>
          <center><p><input type="submit" class="submit small" value="登录"></p></center>
        </form>
        <center><p><a href="{$smarty.server.PHP_SELF}?page=password"><font size="1">忘记你的密码？</font></a></p></center>
{include file="global/block_footer.tpl"}

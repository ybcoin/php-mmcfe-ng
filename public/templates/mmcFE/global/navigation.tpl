          <ul id="nav">
            <li><a href="{$smarty.server.PHP_SELF}">首页</a></li>
            {if $smarty.session.AUTHENTICATED|default:"0" == 1}
            <li><a href="{$smarty.server.PHP_SELF}?page=account&action=edit">我的账户</a>
              <ul>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=edit">编辑账户</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=workers">我的矿工</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=transactions">交易记录</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=notifications">通知</a></li>
              </ul>
            </li>
            {/if}
            {if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.is_admin == 1}
            <li><a href="{$smarty.server.PHP_SELF}?page=admin">管理员面板</a>
              <ul>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=user">用户信息</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=wallet">钱包信息</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=transactions">交易记录</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=settings">设置</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=news">新闻</a></li>
              </ul>
            </li>
            {/if}
            {if $smarty.session.AUTHENTICATED|default}
            <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=pool">统计</a>
              <ul>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=pool">矿池统计</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blocks">区块统计</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=graphs">Hashrate 图</a></li>
              </ul>
            </li>
            {else}
            <li><a href="{$smarty.server.PHP_SELF}?page=statistics">统计</a>
            {/if}
            <li><a href="{$smarty.server.PHP_SELF}?page=gettingstarted">入门教程</a></li>
            <li><a href="{$smarty.server.PHP_SELF}?page=support">支持</a></li>
            <li><a href="{$smarty.server.PHP_SELF}?page=about&action=pool">关于</a>
              <ul>
                <li><a href="{$smarty.server.PHP_SELF}?page=about&action=pool">关于矿池</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=about&action=api">API 参考</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=about&action=donors">捐助者</a></li>
              </ul>
            </li>
            {if $smarty.session.AUTHENTICATED|default == 1}<li><a href="{$smarty.server.PHP_SELF}?page=logout">退出</a></li>{else}<li><a href="{$smarty.server.PHP_SELF}?page=register">注册</a></li>{/if}
          </ul>

                <div class="block" style="clear:none;">
                 <div class="block_head">
                  <div class="bheadl"></div>
                  <div class="bheadr"></div>
			<h1>入门教程</h1>
		</div>
<div class="block_content" style="padding:10px;">

<p>
</p><ol>
<li><strong>创建账户</strong>
<br>
<ul>
	<li>在这里 <a href="{$smarty.server.PHP_SELF}?page=register">注册新账户</a>，如果您已经注册请登录。</li>
	<li>创建您的<a href="{$smarty.server.PHP_SELF}?page=account&action=workers">矿工账号</a>，用户挖矿时登录矿池。<br/>
    每个账户可以创建多个矿工，每个矿工用于一个钱包。所有矿工挖矿所得会汇总到您的账户中。创建矿工界面如下：<br/>
    <img src="{$PATH}/images/worker.png" alt="创建矿工账号" />
    </li>
</ul>

</li><li><strong>下载用于挖矿的钱包：（v0.4.3.0及以上版本）</strong>
	<ul>
	<li>请到元宝币官网下载相应系统的钱包。<a href="http://www.yuanbaobi.org/?page_id=38" target="_blank">http://www.yuanbaobi.org/?page_id=38</a></li>
	</ul>
</li>
<li><strong>配置钱包：</strong>
	<ul>
    	<li>在钱包的 “挖矿” 标签已经将矿池的配置参数设置好，您只需要将您的矿工账号用户名、密码输入相应的位置，然后就可以开始挖矿了。<br/>
          <img src="{$PATH}/images/miner.png" alt="矿工账号设置" /> </li>
    </ul>
</li>
<li><strong>配置您的收款地址：</strong>
	<ul>
	<li>您需要将您用于收款的钱包地址输入到您的 <a href="{$smarty.server.PHP_SELF}?page=account&action=edit">账户信息</a> 中。<br/>
    <img src="{$PATH}/images/wallet_add.png" alt="设置收款地址" />
	</li>
	</ul>

	</li>
    
   <!-- <li>Optional (linux): <strong>Keeping miner updated</strong></li>
    <ul>
      <li>Updateting manual:
      <pre>      cd cpuminer
      git pull
      make clean
      ./configure CFLAGS="-O3"
      make
      ./minerd --url http://pool.grewe.ca:8337/ --userpass <em>Weblogin</em>.<em>Worker</em>:<em>Worker Password</em>
      </pre>
      </li>
-->
      </ul>
<!--    <br><br>Thanks alot to <b>Pooler</b> for all his work on the minerd, <a href="https://github.com/pooler/cpuminer">@Github</a> &amp; <a href="https://bitcointalk.org/index.php?action=profile;u=43931">@bitcointalk</a>
-->    

</ol>


                </div>          <!-- nested block ends -->
                <div class="bendl"></div>
                <div class="bendr"></div>
                </div>

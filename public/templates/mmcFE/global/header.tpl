          <div id="siteinfo">{$GLOBAL.websitename}<br/>
            <span class="slogan">{$GLOBAL.slogan}</span>
          </div>
          <div id="ministats">
            <table border="0">
              <tr>
                {if $GLOBAL.config.price.currency}
                	<td><li>{$GLOBAL.config.currency}/{$GLOBAL.config.price.currency}: <span class="num">{$GLOBAL.price|default:"0"|number_format:"4"}</span></li></td>  
                {/if}
                <td><li>全网算力：<span class="num">{($GLOBAL.nethashrate / 1000 / 1000 )|default:"0"|number_format:"3"} </span>MH/s</li></td>
                <td><li>矿池算力：<span class="num">{($GLOBAL.hashrate / 1000)|number_format:"3"} </span>MH/s</li></td>
                <td><li>Share 处理速度：<span class="num">{$GLOBAL.sharerate|number_format:"2"} </span>Share/s</li></td>
                <td><li>矿工人数：<span class="num">{$GLOBAL.workers}</span></li></td>
              </tr>
            </table>
          </div>

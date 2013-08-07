            <div class="block" style="clear:none; margin-top:15px; margin-left:13px;">
              <div class="block_head">
                <div class="bheadl"></div>
                <div class="bheadr"></div>
                <h1>信息面板</h1>
              </div>
              <div class="block_content" style="padding-top:10px;">
                <table class="sidebar" style="width: 255px">
                    <tr>
                      <td colspan="2"><b><u>您的统计数据</u></b></td>
                    </tr>
                    <tr>
                      <td><b>算力</b></td>
                      <td class="right">{$GLOBAL.userdata.hashrate|number_format} KH/s</td>
                    </tr>
                    <tr>
                      <td colspan="2"><b><u>未支付Shares</u></b> <span id='tt'><img src='{$PATH}/images/questionmark.png' height='15px' width='15px' title='Submitted shares between the last 120 confirms block until now.'></span></td>
                    </tr>
                    <tr>
                      <td><b>您的有效Shares<b></td>
                      <td class="right"><i>{$GLOBAL.userdata.shares.valid|number_format}</i><font size='1px'></font></b></td>
                    </tr>
                    <tr>
                      <td><b>矿池有效Shares</td>
                      <td class="right"><i>{$GLOBAL.roundshares.valid|number_format}</i> <font size='1px'></font></b></td>
                    </tr>
                    <tr>
                      <td colspan="2"><b><u>本轮Shares</u></b> <span id='tt'><img src='{$PATH}/images/questionmark.png' height='15px' width='15px' title='从上一个区块被发现到现在'></span></td>
                    </tr>
                    <tr>
                      <td><b>矿池有效Shares</b></td>
                      <td class="right"><i>{$GLOBAL.roundshares.valid|number_format}</i></td>
                    </tr>
                    <tr>
                      <td><b>矿池无效Shares</b></td>
                      <td class="right"><i>{$GLOBAL.roundshares.invalid|number_format}</i>{if $GLOBAL.roundshares.valid > 0}<font size='1px'> ({(100 / $GLOBAL.roundshares.valid * $GLOBAL.roundshares.invalid)|number_format:"2"}%)</font>{/if}</td>
                    </tr>
                    <tr>
                      <td><b>您的无效Shares</b></td>
                      <td class="right"><i>{$GLOBAL.userdata.shares.invalid|number_format}</i>{if $GLOBAL.roundshares.valid > 0}<font size='1px'> ({(100 / $GLOBAL.roundshares.valid * $GLOBAL.userdata.shares.invalid)|number_format:"2"}%)</font>{/if}</td>
                    </tr>
                    <tr>
                      <td colspan="2"><b><u>{$GLOBAL.config.currency} 本轮预期</u></b></td>
                    </tr>
                    <tr>
                      <td><b>区块</b></td>
                      <td class="right">{$GLOBAL.userdata.est_block|number_format:"8"}</td>
                    </tr>
                    <tr>
                      <td><b>税费</b></td>
                      <td class="right">{$GLOBAL.userdata.est_fee|number_format:"8"}</td>
                    </tr>
                    <tr>
                      <td><b>捐款</b></td>
                      <td class="right">{$GLOBAL.userdata.est_donation|number_format:"8"}</td>
                    </tr>
                    <tr>
                      <td><b>支付</b></td>
                      <td class="right">{$GLOBAL.userdata.est_payout|number_format:"8"}</td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr><td colspan="2"><b><u>{$GLOBAL.config.currency} 账户余额</u></b></td></tr>
                    <tr><td>已确认</td><td class="right"><b>{$GLOBAL.userdata.balance.confirmed|default:"0"}</td></tr>
                    <tr><td>未确认</td><td class="right"><b>{$GLOBAL.userdata.balance.unconfirmed|default:"0"}</td></tr>
                  </table>
                </div>
              <div class="bendl"></div>
              <div class="bendr"></div>
            </div>

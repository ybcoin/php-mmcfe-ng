{include file="global/block_header.tpl" BLOCK_HEADER="交易记录" BUTTONS=array(Confirmed,Unconfirmed,Orphan)}
<div class="block_content tab_content" id="Confirmed" style="clear:;">
  <center>
    {include file="global/pagination.tpl"}
    <table cellpadding="1" cellspacing="1" width="98%" class="pagesort">
      <thead style="font-size:13px;">
        <tr>
          <th class="header" style="cursor: pointer;">TX #</th>
          <th class="header" style="cursor: pointer;">日期</th>
          <th class="header" style="cursor: pointer;">TX 类型</th>
          <th class="header" style="cursor: pointer;">付款地址</th>
          <th class="header" style="cursor: pointer;">区块 #</th>
          <th class="header" style="cursor: pointer;">数量</th>
        </tr>
      </thead>
      <tbody style="font-size:12px;">
{assign var=has_confirmed value=false}
{section transaction $TRANSACTIONS}
        {if (
          (($TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Bonus')and $TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations)
          or ($TRANSACTIONS[transaction].type == 'Donation' and $TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations)
          or ($TRANSACTIONS[transaction].type == 'Fee' and $TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations)
          or $TRANSACTIONS[transaction].type == 'Credit_PPS'
          or $TRANSACTIONS[transaction].type == 'Fee_PPS'
          or $TRANSACTIONS[transaction].type == 'Donation_PPS'
          or $TRANSACTIONS[transaction].type == 'Debit_AP'
          or $TRANSACTIONS[transaction].type == 'Debit_MP'
          or $TRANSACTIONS[transaction].type == 'TXFee'
        )}
        {assign var=has_credits value=true}
        <tr class="{cycle values="odd,even"}">
          <td>{$TRANSACTIONS[transaction].id}</td>
          <td>{$TRANSACTIONS[transaction].timestamp}</td>
          <td>{$TRANSACTIONS[transaction].type}</td>
          <td>{$TRANSACTIONS[transaction].coin_address}</td>
          <td>{if $TRANSACTIONS[transaction].height == 0}n/a{else}{$TRANSACTIONS[transaction].height}{/if}</td>
          <td><font color="{if $TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Credit_PPS' or $TRANSACTIONS[transaction].type == 'Bonus'}green{else}red{/if}">{$TRANSACTIONS[transaction].amount|number_format:"8"}</td>
        </tr>
        {/if}
{/section}
{if !$has_confirmed}
        <tr><td class="center" colspan="6"><b><i>无数据</i></b></td></tr>
{/if}
      </tbody>
    </table>
    <p>
      <font color="" size="1">
        <b>Credit_AP</b> = 自动付款, <b>Credit_MP</b> = 手动付款, <b>Donation</b> = 捐赠, <b>Fee</b> = 税费
      </font>
    </p>
  </center>
</div>
<div class="block_content tab_content" id="Unconfirmed" style="">
  <center>
    {include file="global/pagination.tpl" ID=2}
    <table cellpadding="1" cellspacing="1" width="98%" class="pagesort2">
      <thead style="font-size:13px;">
        <tr>
          <th class="header" style="cursor: pointer;">TX #</th>
          <th class="header" style="cursor: pointer;">日期</th>
          <th class="header" style="cursor: pointer;">TX 类型</th>
          <th class="header" style="cursor: pointer;">付款地址</th>
          <th class="header" style="cursor: pointer;">区块 #</th>
          <th class="header" style="cursor: pointer;">数量</th>
        </tr>
      </thead>
      <tbody style="font-size:12px;">
{assign var=has_unconfirmed value=false}
{section transaction $TRANSACTIONS}
        {if (
          ($TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Bonus') and $TRANSACTIONS[transaction].confirmations < $GLOBAL.confirmations
          or ($TRANSACTIONS[transaction].type == 'Donation' and $TRANSACTIONS[transaction].confirmations < $GLOBAL.confirmations)
          or ($TRANSACTIONS[transaction].type == 'Fee' and $TRANSACTIONS[transaction].confirmations < $GLOBAL.confirmations)
        )}
        {assign var=has_unconfirmed value=true}
        <tr class="{cycle values="odd,even"}">
          <td>{$TRANSACTIONS[transaction].id}</td>
          <td>{$TRANSACTIONS[transaction].timestamp}</td>
          <td>{$TRANSACTIONS[transaction].type}</td>
          <td>{$TRANSACTIONS[transaction].coin_address}</td>
          <td>{if $TRANSACTIONS[transaction].height == 0}n/a{else}{$TRANSACTIONS[transaction].height}{/if}</td>
          <td><font color="{if $TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Bonus'}green{else}red{/if}">{$TRANSACTIONS[transaction].amount|number_format:"8"}</td>
        </tr>
          {if $TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Bonus'}
            {assign var="credits" value="`$credits|default:"0"+$TRANSACTIONS[transaction].amount`"}
          {else}
            {assign var="debits" value="`$debits|default:"0"+$TRANSACTIONS[transaction].amount`"}
          {/if}
        {/if}
{/section}
{if !$has_unconfirmed}
        <tr><td class="center" colspan="6"><b><i>无数据</i></b></td></tr>
{/if}
        <tr>
          <td colspan="5"><b>未确认总数:</b></td>
          <td><b>{($credits|default - $debits|default)|number_format:"8"}</b></td>
        </tr>
      </tbody>
    </table>
    <p><font color="" sizeze="1">Listed are your estimated rewards and donations/fees for all blocks awaiting {$GLOBAL.confirmations} confirmations.</font></p>
  </center>
</div>
<div class="block_content tab_content" id="Orphan" style="">
  <center>
    {include file="global/pagination.tpl"}
    <table cellpadding="1" cellspacing="1" width="98%" class="pagesort3">
      <thead style="font-size:13px;">
        <tr>
          <th class="header" style="cursor: pointer;">TX #</th>
          <th class="header" style="cursor: pointer;">日期</th>
          <th class="header" style="cursor: pointer;">TX 类型</th>
          <th class="header" style="cursor: pointer;">付款地址</th>
          <th class="header" style="cursor: pointer;">区块 #</th>
          <th class="header" style="cursor: pointer;">数量</th>
        </tr>
      </thead>
      <tbody style="font-size:12px;">
{assign var=has_orphaned value=false}
{section transaction $TRANSACTIONS}
        {if (
          $TRANSACTIONS[transaction].type == 'Orphan_Credit'
          or $TRANSACTIONS[transaction].type == 'Orphan_Donation'
          or $TRANSACTIONS[transaction].type == 'Orphan_Fee'
          or $TRANSACTIONS[transaction].type == 'Orphan_Bonus'
        )}
        <tr class="{cycle values="odd,even"}">
          <td>{$TRANSACTIONS[transaction].id}</td>
          <td>{$TRANSACTIONS[transaction].timestamp}</td>
          <td>{$TRANSACTIONS[transaction].type}</td>
          <td>{$TRANSACTIONS[transaction].coin_address}</td>
          <td>{if $TRANSACTIONS[transaction].height == 0}n/a{else}{$TRANSACTIONS[transaction].height}{/if}</td>
          <td><font color="{if $TRANSACTIONS[transaction].type == 'Orphan_Credit' or $TRANSACTIONS[transaction].type == 'Orphan_Bonus'}green{else}red{/if}">{$TRANSACTIONS[transaction].amount|number_format:"8"}</td>
        </tr>
          {if $TRANSACTIONS[transaction].type == 'Orphan_Credit' or $TRANSACTIONS[transaction].type == 'Orphan_Bonus'}
            {assign var="orphan_credits" value="`$orphan_credits|default:"0"+$TRANSACTIONS[transaction].amount`"}
          {else}
            {assign var="orphan_debits" value="`$orphan_debits|default:"0"+$TRANSACTIONS[transaction].amount`"}
          {/if}
        {/if}
{/section}
{if !$has_orphaned}
        <tr><td class="center" colspan="6"><b><i>无数据</i></b></td></tr>
{/if}
        <tr>
          <td colspan="5"><b>Orphaned Totals:</b></td>
          <td><b>{($orphan_credits|default - $orphan_debits|default)|number_format:"8"}</b></td>
        </tr>
      </tbody>
    </table>
    <p><font color="" sizeze="1">Listed are your orphaned transactions for blocks not part of the main blockchain.</font></p>
  </center>
</div>
{include file="global/block_footer.tpl"}

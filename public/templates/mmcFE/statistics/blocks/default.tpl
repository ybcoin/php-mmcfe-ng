{include file="global/block_header.tpl" BLOCK_HEADER="区块的Shares" BLOCK_STYLE="clear:none;"}
<table width="70%" class="stats" rel="line">
  <caption>区块的Shares</caption> 
  <thead>
    <tr>
{section block $BLOCKSFOUND step=-1}
      <th scope="col">{$BLOCKSFOUND[block].height}</th>
{/section}
    </th>
  </thead>
  <tbody>
    <tr>
      <th scope="row">预期</th>
{section block $BLOCKSFOUND step=-1}
      <td>{round(pow(2,32 - $GLOBAL.config.targetdiff) * $BLOCKSFOUND[block].difficulty)}</td>
{/section}
    </tr>
    <tr>
      <th scope="row">实际</th>
{section block $BLOCKSFOUND step=-1}
      <td>{$BLOCKSFOUND[block].shares}</td>
{/section}
   </tr>
  </tbody>
</table>
<center><br>
<p style="padding-left:30px; padding-right:30px; font-size:10px;">
The graph above illustrates N shares to find a block vs. E Shares expected to find a block based on
target and network difficulty and assuming a zero variance scenario.
</p></center>
{include file="global/block_footer.tpl"}

{include file="global/block_header.tpl" BLOCK_HEADER="最新挖到的 $BLOCKLIMIT 个区块" BLOCK_STYLE="clear:none;"}
<center>
  <table width="100%" style="font-size:13px;">
    <thead>
      <tr style="background-color:#B6DAFF;">
        <th class="center">区块</th>
        <th class="center">合法性</th>
        <th>发现者</th>
        <th class="center">时间</th>
        <th class="right">难度</th>
        <th class="right">金额</th>
        <th class="right">预期 Shares</th>
        <th class="right">实际 Shares</th>
        <th class="right">百分比</th>
      </tr>
    </thead>
    <tbody>
{assign var=rank value=1}
{section block $BLOCKSFOUND}
      <tr class="{cycle values="odd,even"}">
        <!--<td class="center"><a href="{$GLOBAL.blockexplorer}{$BLOCKSFOUND[block].height}" target="_blank">{$BLOCKSFOUND[block].height}</a></td>-->
        <td class="center">{$BLOCKSFOUND[block].height}</td>
        <td class="center">
        {if $BLOCKSFOUND[block].confirmations >= $GLOBAL.confirmations}
          <font color="green">Confirmed</font>
        {else if $BLOCKSFOUND[block].confirmations == -1}
          <font color="red">Orphan</font>
        {else}{$GLOBAL.confirmations - $BLOCKSFOUND[block].confirmations} left{/if}</td>
        <td>{$BLOCKSFOUND[block].finder|default:"unknown"}</td>
        <td class="center">{$BLOCKSFOUND[block].time|date_format:"%d/%m %H:%M:%S"}</td>
        <td class="right">{$BLOCKSFOUND[block].difficulty|number_format:"2"}</td>
        <td class="right">{$BLOCKSFOUND[block].amount|number_format:"2"}</td>
        <td class="right">
          {math assign="estshares" equation="(pow(2,32 - targetdiff) * blockdiff)" targetdiff=$GLOBAL.config.targetdiff blockdiff=$BLOCKSFOUND[block].difficulty}
          {number_format($estshares,0)}
        </td>
        <td class="right">{$BLOCKSFOUND[block].shares|number_format}</td>
        <td class="right">
          {math assign="percentage" equation="shares / estshares * 100" shares=$BLOCKSFOUND[block].shares estshares=$estshares}
          <font color="{if ($percentage <= 100)}green{else}red{/if}">{number_format($percentage,1)} %</font>
        </td>
      </tr>
{/section}
    </tbody>
  </table>
</center>
{if $GLOBAL.config.payout_system != 'pps'}
<ul>
  <li>Note: <font color="orange">Round Earnings are not credited until {$GLOBAL.confirmations} confirms.</font></li>
</ul>
{/if}
{include file="global/block_footer.tpl"}

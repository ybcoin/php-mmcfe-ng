{include file="global/block_header.tpl" BLOCK_HEADER="矿池统计" BLOCK_STYLE="clear:none;"}

{include file="statistics/pool/contributors_shares.tpl"}

{include file="statistics/pool/contributors_hashrate.tpl"}

{include file="global/block_header.tpl" ALIGN="left" BLOCK_HEADER="服务器状态" BLOCK_STYLE="clear:both;" STYLE="padding-left:5px;padding-right:5px;"}
<table class="" width="100%" style="font-size:13px;">
  <tbody>
    <tr>
      <td class="leftheader">矿池算力</td>
      <td>{($GLOBAL.hashrate / 1000)|number_format:"3"} Mhash/s</td>
    </tr>
    <tr>
      <td class="leftheader">矿池效率</td>
      <td>{if $GLOBAL.roundshares.valid > 0}{(100 - (100 / $GLOBAL.roundshares.valid * $GLOBAL.roundshares.invalid))|number_format:"2"}{else}0{/if} %</td>
    </tr>
    <tr>
      <td class="leftheader">当前活跃矿工数</td>
      <td>{$GLOBAL.workers}</td>
    </tr>
    {if $GLOBAL.blockexplorer}
    <tr>
      <td class="leftheader">下一个区块</td>
<!--<td><a href="{$GLOBAL.blockexplorer}{$CURRENTBLOCK + 1}" target="_new">{$CURRENTBLOCK + 1}</a> &nbsp;&nbsp;<font size="1"> (当前: <a href="{$GLOBAL.blockexplorer}{$CURRENTBLOCK}" target="_new">{$CURRENTBLOCK})</a></font></td>-->
      <td>{$CURRENTBLOCK + 1} &nbsp;&nbsp;<font size="1"> (当前: {$CURRENTBLOCK})</font></td>
    </tr>
    {else}
    <tr>
      <td class="leftheader">下一个区块</td>
      <td>{$CURRENTBLOCK + 1} &nbsp;&nbsp; (当前: {$CURRENTBLOCK})</td>
    </tr>
    {/if}
    <tr>
      <td class="leftheader">最后发现的区块</td>
      <!--<td>{if $GLOBAL.blockexplorer}<a href="{$GLOBAL.blockexplorer}{$LASTBLOCK}" target="_new">{$LASTBLOCK|default:"0"}</a>{else}{$LASTBLOCK|default:"0"}{/if}</td>-->
      <td>{if $GLOBAL.blockexplorer}{$LASTBLOCK|default:"0"}{else}{$LASTBLOCK|default:"0"}{/if}</td>
    </tr>
    <tr>
      <td class="leftheader">当前难度</td>
      {if $GLOBAL.chaininfo}
      <!--<td><a href="{$GLOBAL.chaininfo}" target="_new"><font size="2">{$DIFFICULTY}</font></a></td>-->
      <td><font size="2">{$DIFFICULTY}</font></td>
      {else}
      <td><font size="2">{$DIFFICULTY}</font></td>
      {/if}
    </tr>
    <tr>
      <td class="leftheader">预计平均每轮时间</td>
      <td>{$ESTTIME|seconds_to_words}</td>
    </tr>
    <tr>
      <td class="leftheader">预计本轮 Shares</td>
      <td>{(pow(2, 32 - $GLOBAL.config.targetdiff) * $DIFFICULTY)|number_format:"0"} <font size="1">(done: {(100 / (pow(2, 32 - $GLOBAL.config.targetdiff) * $DIFFICULTY) * $GLOBAL.roundshares.valid)|number_format:"2"} %)</td>
    </tr>
    <tr>
      <td class="leftheader">自上一块的时间</td>
      <td>{$TIMESINCELAST|seconds_to_words}</td>
    </tr>
  </tbody>
</table>
<li>These stats are also available in JSON format <a href="{$smarty.server.PHP_SELF}?page=api&action=getpoolstatus&api_key={$GLOBAL.userdata.api_key}">HERE</a></li>
{include file="global/block_footer.tpl"}


{include file="statistics/blocks/small_table.tpl" ALIGN="right" SHORT=true}

{include file="global/block_footer.tpl"}

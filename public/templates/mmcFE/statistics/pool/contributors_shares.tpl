{include file="global/block_header.tpl" ALIGN="right" BLOCK_HEADER="最大 Shares 贡献者"}
<center>
  <table width="100%" border="0" style="font-size:13px;">
    <thead>
      <tr style="background-color:#B6DAFF;">
        <th align="left">排名</th>
        <th scope="col">账户名</th>
        <th class="right" scope="col">Shares</th>
      </tr>
    </thead>
    <tbody>
{assign var=rank value=1}
{assign var=listed value=0}
{section hashrate $CONTRIBSHARES}
      <tr{if $GLOBAL.userdata.username == $CONTRIBSHARES[hashrate].account}{assign var=listed value=1} style="background-color:#99EB99;"{else} class="{cycle values="odd,even"}"{/if}>
        <td>{$rank++}</td>
        <td>{$CONTRIBSHARES[hashrate].account}</td>
        <td class="right">{$CONTRIBSHARES[hashrate].shares|number_format}</td>
      </tr>
{/section}
{if $listed != 1}
      <tr style="background-color:#99EB99;">
        <td>n/a</td>
        <td>{$GLOBAL.userdata.username}</td>
        <td class="right">{$GLOBAL.userdata.shares.valid|number_format}</td>
      </tr>
{/if}
    </tbody>
  </table>
</center>
{include file="global/block_footer.tpl"}

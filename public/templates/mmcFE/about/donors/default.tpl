{include file="global/block_header.tpl" BLOCK_HEADER="捐助者"}
<center>
{include file="global/pagination.tpl"}
<table width="500px" class="pagesort">
  <thead>
    <tr>
      <th>账户名</th>
      <th class="center">%</th>
      <th class="right">{$GLOBAL.config.currency} 总数</th>
    </tr>
  </thead>
  <tbody>
{section name=donor loop=$DONORS}
    <tr>
      <td>{$DONORS[donor].username}</td>
      <td class="center">{$DONORS[donor].donate_percent}</td>
      <td class="right">{$DONORS[donor].donation|number_format:"2"}</td>
    </tr>
{sectionelse}
    <tr>
      <td class="center" colspan="3">还没有捐款，相信第一个慷慨的就是您！</td>
    </tr>
{/section}
  </tbody>
</table>
</center>
{include file="global/block_footer.tpl"}

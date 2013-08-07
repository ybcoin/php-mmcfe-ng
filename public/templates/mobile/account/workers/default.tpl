    <table>
      <tbody>
      <tr>
        <th align="left">矿工名</th>
        <th align="center">活跃</th>
        <th align="right">Khash/s</th>
      </tr>
      {section worker $WORKERS}
      {assign var="username" value="."|escape|explode:$WORKERS[worker].username:2} 
      <tr>
        <td align="left"{if $WORKERS[worker].active} style="color: orange"{/if}>{$username.0|escape}.{$username.1|escape}</td>
        <td align="center"><img src="{$PATH}/images/{if $WORKERS[worker].active}success{else}error{/if}.gif" /></td>
        <td align="right">{$WORKERS[worker].hashrate|number_format}</td>
      </tr>
      {/section}
      </tbody>
    </table>

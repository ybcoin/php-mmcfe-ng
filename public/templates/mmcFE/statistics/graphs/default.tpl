{include file="global/block_header.tpl" BLOCK_HEADER="24小时算力统计" BUTTONS=array(mine,pool,both)}
{include file="{$smarty.request.page}/{$smarty.request.action}/mine.tpl"}
{include file="{$smarty.request.page}/{$smarty.request.action}/pool.tpl"}
{include file="{$smarty.request.page}/{$smarty.request.action}/both.tpl"}
{include file="global/block_footer.tpl"}

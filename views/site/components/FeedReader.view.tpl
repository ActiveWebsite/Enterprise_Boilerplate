{if $view == 'agent_homepage'}
	{* Version for agent rebrand home page *}
	{foreach item="item" from=$items name="feed_loop"}
		<article>
			<h3><a href="{$item.link}" target="_blank">{$item.title}</a></h3>
			<p>{$item.desc|strip_tags}</p>
			<a href="{$item.link}" target="_blank">Read More</a>
		</article>
		{if !$smarty.foreach.feed_loop.last}<hr>{/if}
	{/foreach}
{else}
	{foreach item="item" from=$items name="feed_loop"}
		<article>
			<h3><a href="{$item.link}" target="_blank">{$item.title}</a></h3>
			<p>{$item.desc|strip_tags}</p>
			<a href="{$item.link}" target="_blank">Read More</a>
		</article>
		{if !$smarty.foreach.feed_loop.last}<hr>{/if}
	{/foreach}
{/if}
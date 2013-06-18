<div id="news-index-page">
	<h1 class="page-heading">News</h1>
	{foreach from=$news item=newsItem name=newsLoop}
		<article>
			<span class="pull-right bold"><em>{$newsItem.release|date_format:"%D"}</em> by {$newsItem.user.name}</span>
			<h3><a href="{$newsItem.internallink}" title="View {$newsItem.title|clean_for_attribute}">{$newsItem.title}</a></h3>
			<p>{$newsItem.news|strip_tags|truncate:400} <a href="{$newsItem.internallink}" title="More">More &gt;</a></p>
		</article>
		{if !$smarty.foreach.newsLoop.last}<hr>{/if}
	{/foreach}
	{if $urls}
		<hr>
		<div class="pagination">
			<ul>
				{if $page_manager->get_prev_page_url() != false}
					<li><a href="{$page_manager->get_prev_page_url()}">&laquo; Previous Page</a></li>
				{/if}
				{foreach from=$urls item=show key=page}
					{if $show == 0}
						<li class="active"><a href="{$page_manager->get_page_url($page)}">{$page}</a></li>
					{elseif $show == 1}
						<li><a href="{$page_manager->get_page_url($page)}">{$page}</a></li>
					{else}
						<li class="disabled">...</li>
					{/if}
				{/foreach}
				{if $page_manager->get_next_page_url() != false}
					<li><a href="{$page_manager->get_next_page_url()}">Next Page &raquo;</a></li>
				{/if}
			</ul>
		</div>
	{/if}
</div>
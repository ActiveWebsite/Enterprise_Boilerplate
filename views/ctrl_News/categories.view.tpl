<div id="news-categories-page">
	<h1 class="page-heading">News</h1>
	{foreach from=$news item=news_array key=category_name name=category_loop}
		<div class="news-category margin-bottom-30">
			<h2><a href="/{$controller_alias}/category/{$category_name}">{$category_name}</a></h2>
			<div class="news-category-posts margin-left-30">
				{foreach from=$news_array item=newsItem name=newsLoop}
					<article>
						<span class="pull-right bold"><em>{$newsItem.release|date_format:"%D"}</em> by {$newsItem.user.name}</span>
						<h3><a href="{$newsItem.internallink}" title="View {$newsItem.title|clean_for_attribute}">{$newsItem.title}</a></h3>
						<p>{$newsItem.news|strip_tags|truncate:400} <a href="{$newsItem.internallink}" title="More">More &gt;</a></p>
					</article>
					{if !$smarty.foreach.newsLoop.last}<hr>{/if}
				{/foreach}
			</div>
		</div>
	{/foreach}
</div>
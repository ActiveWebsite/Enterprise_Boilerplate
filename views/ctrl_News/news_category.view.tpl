<div id="news-category-page">
	<div class="page-header">
		<h1>News: {$category_name}</h1>
	</div>
	{foreach from=$news item=newsItem name=newsLoop}
		<article>
			<span class="pull-right bold"><em>{$newsItem.release|date_format:"%D"}</em> by {$newsItem.user.name}</span>
			<h3><a href="{$newsItem.internallink}" title="View {$newsItem.title|clean_for_attribute}">{$newsItem.title}</a></h3>
			<p>{$newsItem.news|strip_tags|truncate:400} <a href="{$newsItem.internallink}" title="More">More &gt;</a></p>
		</article>
		<hr>
	{/foreach}
	<ul class="list-unstyled inline">
		<li><a href="/{$controller_alias}/" title="Back to all news">&laquo; Back To All News</a></li>
	</ul>
</div>
<div id="news-post-page">
	<div class="page-header">
		<h1>{$newsItem.title}</h1>
	</div>
	<p class="bold">
		Publised on {$newsItem.release|date_format:"%D"} by
		{$newsItem.user.name}
	</p>
	<hr>
	<div class="cms-page clearfix">
		{$newsItem.news}
	</div>
	<hr>
	<ul class="list-unstyled inline">
		<li><a href="/{$controller_alias}/" title="Back">&laquo; Back</a></li>
		{if $newsItem.link}
			<li><a href="{$newsItem.link}" title="View Full Article" target="_blank">View Full Article</a></li>
		{/if}
		<li><a href="{$newsItem.permalink}" title="Permalink" target="_blank" rel="nofollow">Permalink</a></li>
	</ul>
	{if $newsItem.files}
		<hr>
		<h3>Documents</h3>
		<ul class="row multi-columns-row">
			{foreach from=$newsItem.files item=file key=index}
				<li class="col-sm-4 col-lg-4"><a href="{$file.url}" target="_blank" rel="nofollow" title="Open {$file.name|clean_for_attribute}">{$file.name}</a></li>
			{/foreach}
		</ul>
	{/if}
</div>
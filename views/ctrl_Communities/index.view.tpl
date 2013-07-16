<div id="community-index">
	<div class="page-header">
		<h1>Communities</h1>
	</div>
</div>
<div class="alert">This page can be built many many ways so please come see r&amp;d about how to set this up.</div>

<ul>
	{foreach from=$communities item=community}
		<li><a href="/{$controller_alias}/{$community.rebrand}">{$community.name}</a></li>
	{/foreach}
</ul>
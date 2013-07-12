{if $communities}
	<div id="home-page-community-gallery" class="cycle-slideshow" data-cycle-pause-on-hover="true" data-cycle-slides=".slide">
		{foreach from=$communities item=community key=index}
			<div class="slide" {if $index > 0} style="display:none;"{/if}>
				<div class="relative">
					{if $community.first_pic.url}
						<img src="{$community.first_pic.url}/crop/229,180" alt="Photo of {$community.name|clean_for_attribute}">
					{/if}
					<h3><a href="{$community_alias}/{$community.rebrand}" title="{$community.name|clean_for_attribute}">{$community.name}</a></h3>
				</div>
			</div>
		{/foreach}
	</div>
{/if}
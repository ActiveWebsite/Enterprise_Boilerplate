<div id="landing-page">
	<div class="row">
		{assign var=blurb_img value=$menu_item->get_blurb_thumb()}
		{if $landing_page->getHeaderText()}
			<div class="cols-sm-8 col-lg-8">
				<h1>{$menu_item->name|replace:'& ':'&amp; '}</h1>
				<p>{$landing_page->getHeaderText()|replace:'& ':'&amp;'}</p>
			</div>
		{/if}
		{if $blurb_img}
			<div class="col-sm-4 col-lg-4">
				<img src="{$blurb_img->getUrl()}" alt="">
			</div>
		{/if}
	</div>
	<hr>
	<ul class="row multi-columns-row">
		{foreach from=$items item=sub_menu_item key=index name=sub_menu_loop}
			<li class="col-sm-6 col-lg-6 margin-bottom-30">
				{assign var=blurb_img value=$sub_menu_item->get_blurb_thumb()}
				<div class="row">
					<div class="col-sm-4 col-lg-4">
						<a href="{$sub_menu_item->uri}" title="{$sub_menu_item->name|clean_for_attribute}">
							<img src="{if $blurb_img}{$blurb_img->getUrl()}/quality/100/crop/130,130{else}/images/pic-landing-page-default.jpg{/if}" alt="{$sub_menu_item->name|clean_for_attribute}">
						</a>
					</div>
					<div class="cols-sm-8 col-lg-8">
						<h3>
							<a href="{$sub_menu_item->uri}" title="{$sub_menu_item->name|clean_for_attribute}">{$sub_menu_item->name|replace:'& ':'&amp; '}</a>
						</h3>
						<p>
							{$sub_menu_item->blurb|replace:'& ':'&amp; '|strip_tags|truncate:225:'...':true}
						</p>
					</div>
				</div>
			</li>
		{/foreach}
	</ul>
</div>
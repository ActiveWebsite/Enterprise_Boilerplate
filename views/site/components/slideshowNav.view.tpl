{if $slideshow_images}
	<div id="home-page-gallery" class="cycle-slideshow" data-cycle-pause-on-hover="true" data-cycle-slides=".slide">
		<div class="cycle-pager"></div>
		{foreach from=$slideshow_images item=image key=index name=slideshow_loop}
			<div class="slide" {if $index > 0} style="display:none;"{/if}>
				<img src="{$image->getURL()}/crop/1170,455" alt="">
				<div class="caption">
					{if $image->meta_info_link}
						<h3><a href="http://{$image->meta_info_link|replace:'http://':''}"{if strpos($image->meta_info_link, 'http://') !== false} target="_blank"{/if}>{$image->getName()}</a></h3>
					{else}
						<h3>{$image->getName()}</h3>
					{/if}
					<p>{$image->meta_info_text}</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}
{if $slideshow_images}
	<div id="home-page-gallery">
		{foreach from=$slideshow_images item=image key=index name=slideshow_loop}
			<figure>
				<img src="{$image->getURL()}" alt="">
				<figcaption>
					{if $image->meta_info_link}
						<a href="http://{$image->meta_info_link|replace:'http://':''}"{if strpos($image->meta_info_link, 'http://') !== false} target="_blank"{/if}><h3>{$image->getName()}</h3></a>
					{else}
						<h3>{$image->getName()}</h3>
					{/if}
					<p>{$image->meta_info_text}</p>
				</figcaption>
			</figure>
		{/foreach}
	</div>
	<div id="home-page-gallery-pager"></div>
{else}
	<div id="home-page-gallery">
		<figure>
			<img src="http://placehold.it/1170x400&amp;text=A" alt="">
			<figcaption><p>Caption 1</p></figcaption>
		</figure>
		<figure style="display:none;">
			<img src="http://placehold.it/1170x400&amp;text=B" alt="">
			<figcaption><p>Caption 2</p></figcaption>
		</figure>
		<figure style="display:none;">
			<img src="http://placehold.it/1170x400&amp;text=C" alt="">
			<figcaption><p>Caption 3</p></figcaption>
		</figure>
		<figure style="display:none;">
			<img src="http://placehold.it/1170x400&amp;text=D" alt="">
			<figcaption><p>Caption 4</p></figcaption>
		</figure>
	</div>
	<div id="home-page-gallery-pager"></div>
{/if}
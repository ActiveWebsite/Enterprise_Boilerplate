{render_layout_arguments var="render_page_breadcrumbs"}
	<ul class="breadcrumb">
		<li><a href="/" title="Home">Home</a></li>  
		<li><a href="/{$controller_alias}/" title="{$CURRENT_CMS_PAGE_LABEL}">{if $CURRENT_CMS_PAGE_LABEL}{$CURRENT_CMS_PAGE_LABEL}{else}{$controller_obj->cms_page->name}{/if}</a></li>
		<li>{$development.name}</li>
	</ul>
{/render_layout_arguments}

<div id="developments-details-page">
	<div class="page-header">
		<h1>{$development.name}</h1>
	</div>
	<div class="row">
		<div class="col-lg-9 margin-bottom-30">
			{if $development.pics}
				<div class="gallery-widget" id="development-gallery">
					<div class="gallery-widget-main-photo-wrapper">
						{foreach from=$development.pics item=photo key=index}
							{if $index == 0}
								<img src="{$photo.url}/maxwidth/647" alt="Main Photo">
							{/if}
						{/foreach}
					</div>
					<div class="gallery-widget-navigation clearfix">
						<a href="#" class="gallery-widget-next" title="Next">Next &gt;</a>
						<a href="#" class="gallery-widget-prev" title="Previous">&lt; Prev</a>
					</div>
					<ul class="gallery-widget-carousel">
						{foreach from=$development.pics item=photo key=index}
							<li>
								<img src="{$photo.url}/crop/130,90" alt="Development Thumbnail">
							</li>
						{/foreach}
					</ul>
				</div>
			{/if}
		</div>
		<div class="col-lg-3 margin-bottom-30">
			<address>
				{$development.address.Street_Address.value}<br>
				{$development.address.City.value}, {$development.address.State.value} {$development.address.Zip.value}
			</address>
			<ul class="list-unstyled">
				{if $development.min_price && $development.max_price}
					<li>${$development.min_price|number_format} - ${$development.max_price|number_format}</li>
				{elseif $development.min_price}
					<li>From ${$development.min_price|number_format}</li>
				{elseif $development.max_price}
					<li>Up To ${$development.max_price|number_format}</li>
				{/if}
				{if $development.min_sqft && $development.max_sqft}
					<li>{$development.min_sqft|number_format} - {$development.max_sqft|number_format} sqft</li>
				{elseif $development.min_sqft}
					<li>From {$development.min_sqft|number_format} sqft</li>
				{elseif $development.max_sqft}
					<li>Up To {$development.max_sqft|number_format} sqft</li>
				{/if}
			</ul>
		</div>
	</div>
	<div class="tabClass" id="development-details-page-tabs">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#info-tab">Info</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane clearfix active" id="info-tab">
				{$development.biography}
			</div>
		</div>
	</div>
</div>
<footerargs>
<script src="/js/buildlist.js?scripts=/js/carousels/jquery.jcarousel.min.js,/js/galleries/jquery.simpleCarouselGallery.2.0.min.js"></script>
{literal}
<script>
	jQuery(document).ready(function($){
		$('#development-details-page-tabs').jtabs();
	});
	jQuery(window).load(function () {
		// build photo gallery on window load so all images exist in the dom. 
		simpleCarouselGalleryObj = jQuery('#development-gallery').simpleCarouselGallery({
			large_resize_method: '/maxwidth/647', // resize method used on the main image
			thumb_resize_method: '/crop/130,90', // resize method used on the thumbnails
			next: '.gallery-widget-next',
			prev: '.gallery-widget-prev',
			renderFullScreen: false,
			animateHeight: true
		}).data('simpleCarouselGallery');
	});
</script>
{/literal}
</footerargs>
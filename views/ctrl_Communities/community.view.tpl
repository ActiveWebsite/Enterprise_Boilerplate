{render_layout_arguments var="render_page_breadcrumbs"}
	<ul class="breadcrumb">
		<li><a href="/" title="Home">Home</a></li>  
		<li><a href="/{$controller_alias}/" title="{$CURRENT_CMS_PAGE_LABEL}">{if $CURRENT_CMS_PAGE_LABEL}{$CURRENT_CMS_PAGE_LABEL}{else}{$controller_obj->cms_page->name}{/if}</a></li>
		<li>{$community.name}</li>
	</ul>
{/render_layout_arguments}

<div id="community-bio">
	<div class="page-header">
		<h1>{$community.name}</h1>
	</div>
	<div class="row">
		<div class="col-lg-9 margin-bottom-30">
			{if $community.photos}
				<div class="gallery-widget" id="community-gallery">
					<div class="gallery-widget-main-photo-wrapper">
						{foreach from=$community.photos item=photo key=index}
							{if $index == 0 && $photo instanceof EntityPicture}
								<img src="{$photo->getURL()}/maxwidth/647" alt="Main Photo">
							{/if}
						{/foreach}
					</div>
					<div class="gallery-widget-navigation clearfix">
						<a href="#" class="gallery-widget-next" title="Next">Next &gt;</a>
						<a href="#" class="gallery-widget-prev" title="Previous">&lt; Prev</a>
					</div>
					<ul class="gallery-widget-carousel">
						{foreach from=$community.photos item=photo key=index}
							{if $photo instanceof EntityPicture}
								<li>
									<img src="{$photo->getURL()}/crop/130,90" alt="Development Thumbnail">
								</li>
							{/if}
						{/foreach}
					</ul>
				</div>
			{/if}
		</div>
		<div class="col-lg-3">
			{if $community_office}
				<h3>Closest Office</h3>
				{foreach from=$community_office item=community_office key=index}
					{if $index == 0}
						<p>
							<span class="bold block">{$community_office.name} Office</span>
							{if $community_office.address.Street_Address.value}
								<span class="block">{$community_office.address.Street_Address.value}</span>
							{/if}
							{if $community_office.address.City.value || $community_office.address.State.value || $community_office.address.Zip.value}
								<span class="block">{$community_office.address.City.value}, {$community_office.address.State.value} {$community_office.address.Zip.value}</span>
							{/if}
							{if $community_office.address.Direct_Phone.value}
								<span class="block">Phone {$community_office.address.Direct_Phone.value}</span>
							{/if}
							{if $site_owner_extended.entity_type =='company'}
								<a href="{$ACTION_URLS.realtor}?office_id={$community_office.id}" title="Agents in this office">Agents in this Office</a>
							{/if}
						</p>
					{/if}
				{/foreach}
			{/if}
			{if $community_office && $related_communities}
				<hr>
			{/if}
			{if $related_communities}
				<h3>Nearby Communities</h3>
				<ul class="list-unstyled">
					{foreach item=related from=$related_communities key=index}
						<li>
							<a href="{$related.rebrand}" title="Go to {$related.name|clean_for_attribute}">{$related.name}</a>
						</li>
					{/foreach}
				</ul>
			{/if}
		</div>
	</div>
	<hr>
	<div id="community-bio-tabs" class="tabClass">
		<ul class="nav nav-tabs tab_triggers">
			<li class="active"><a href="#about-tab">About</a></li>
			<li><a href="#for-sale-tab">Homes for Sale</a></li>
			{if $community.address.Lat_Long.value.Longitude && $community.address.Lat_Long.value.Longitude != '' && $community.address.Lat_Long.value.Longitude != 0 && $community.address.Lat_Long.value.Latitude && $community.address.Lat_Long.value.Latitude != '' && $community.address.Lat_Long.value.Latitude != 0}
				<li><a href="#map-tab">Map</a></li>
			{/if}
		</ul>
		<div class="tab-content">
			<div class="tab-pane cms-page active" id="about-tab">
				{if $community.bio_title}
					<h2>{$community.bio_title}</h2>
				{/if}
				{if $community.biography}
					{$community.biography}
				{/if}
				{if $community_bios}
					{foreach from=$community_bios item=bio name=bioLoop}
						<div class="margin-bottom-30">
							<h2>{$bio->title}</h2>
							{$bio->bio}
						</div>
					{/foreach}
				{/if}
			</div>
			<div class="tab-pane active" id="for-sale-tab"></div>
			{if $community.address.Lat_Long.value.Longitude && $community.address.Lat_Long.value.Longitude != '' && $community.address.Lat_Long.value.Longitude != 0 && $community.address.Lat_Long.value.Latitude && $community.address.Lat_Long.value.Latitude != '' && $community.address.Lat_Long.value.Latitude != 0}
				<div class="tab-pane active" id="map-tab">
					<div id="poi-map-element">
						<div class="poi-map-div"></div>
						<div class="poi-map-form margin-top-15">
							<form method="post" action="/" class="row ui-front">
								<div class="col-sm-5 col-lg-5 margin-bottom-15">
									<label>Show Me</label>
									<div class="input-group">
										<input type="text" name="poi" class="form-control" value="">
										<span class="input-group-btn"><button data-for="poi" type="button" class="poi-map-autocomplete-toggle btn btn-default"><i class="icon icon-chevron-down"></i></button></span>
									</div>
								</div>
								<div class="col-sm-5 col-lg-5 margin-bottom-15">
									<label>Within</label>
									<div class="input-group">
										<input type="text" name="radius" class="form-control" value="">
										<span class="input-group-btn"><button data-for="radius" type="button" class="poi-map-autocomplete-toggle btn btn-default"><i class="icon icon-chevron-down"></i></button></span>
									</div>
								</div>
								<div class="col-sm-2 col-lg-2 margin-bottom-15">
									<label>&nbsp;</label>
									<button type="submit" class="btn btn-default btn-block">Search</button>
								</div>
							</form>
						</div>			
						<div class="poi-map-results-wrapper">
							<div class="poi-map-results">
								<div class="alert alert-info">Select a Point of Interest and Radius from the form above.</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
		</div>
	</div>
</div>
<footerargs>
{* load the scripts that you need that are not already on the page *}
<script src="//maps.googleapis.com/maps/api/js?v={$smarty.google_map_version}&amp;client={$smarty.google_client_id}&amp;channel={$smarty.const.APP_ID}&amp;libraries=places&amp;sensor=false"></script>
<script src="/js/buildlist.js?scripts=/js/libs/jquery_ui/components/core.1.10.3.min.js,/js/libs/jquery_ui/components/menu.1.10.3.min.js,/js/libs/jquery_ui/components/autocomplete.1.10.3.min.js,/js/map_search/jquery.poi-map-2.min.js"></script>
<script src="/js/buildlist.js?scripts=/js/carousels/jquery.jcarousel.min.js,/js/galleries/jquery.simpleCarouselGallery.2.0.min.js"></script>

{* GET THE POLYGON FOR THE COMMUNITY *}
{assign var=polygon value=$community_obj->getBoundries()}

<script>
{literal}
	jQuery(document).ready(function($) {
		var poiMapObject = false, poiMapLoaded = false;
		
		// tabs
		$('#community-bio-tabs').jtabs({
			bootstrapMode:true,
			openCallback: function(obj, num, trigger, tab) {
				var href = $(trigger).find('a').attr('href');
				switch(href) {
					case '#map-tab':
						if (!poiMapLoaded) {
							poiMapLoaded = true;
							poiMapObject = $('#poi-map-element').poiMap({
								latitude: {/literal}{if $community.address.Lat_Long.value.Latitude}{$community.address.Lat_Long.value.Latitude}{else}0{/if}{literal},
								longitude: {/literal}{if $community.address.Lat_Long.value.Longitude}{$community.address.Lat_Long.value.Longitude}{else}0{/if}{literal},
								markerTitle: '{/literal}{$community.name|escape:javascript}{literal}',
								markerShadow: true,
								polygon: '{/literal}{if $polygon.0}{$polygon.0->boundary}{/if}{literal}'
							}).data('poiMap');
						} else {
							if (poiMapObject && poiMapObject.hasOwnProperty("resize")) {
								setTimeout(poiMapObject.resize, 200);
							}
						}
						break;						
					case '#for-sale-tab':
						//<![CDATA[
						_lazyLoadComponent("for-sale-tab","PropertySearch/?search_url=/community/{/literal}{$community.rebrand}{literal}&alternateView=PropertySearchResult&results=6");
						//]]>
						break;
				}
			}
		});
	});
	
	jQuery(window).load(function () {
		// build photo gallery on window load so all images exist in the dom. 
		simpleCarouselGalleryObj = jQuery('#community-gallery').simpleCarouselGallery({
			large_resize_method: '/maxwidth/647', // resize method used on the main image
			thumb_resize_method: '/crop/130,90', // resize method used on the thumbnails
			next: '.gallery-widget-next',
			prev: '.gallery-widget-prev',
			renderFullScreen: false,
			animateHeight: true
		}).data('simpleCarouselGallery');
	});
{/literal}
</script>
</footerargs>
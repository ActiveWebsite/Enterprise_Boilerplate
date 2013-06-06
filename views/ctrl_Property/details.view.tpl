{if stripos($controller_obj->URL.url_raw,'print_view') === false}
	<head>
		<link rel="canonical" href="http://PUT CLIENT DOMAIN NAME HERE/property/{$company_property_id}/{$fullStreetAddress|clean_for_url}">
		{if $streetAddress}
			<meta property="og:title" content="{$fullStreetAddress|clean_for_attribute}">
		{/if}
		{if $first_pic && $first_pic instanceof PropertyPicture}
			<meta property="og:image" content="{$first_pic->getUrl()}" alt="{$fullStreetAddress|clean_for_attribute}">
		{/if}
		{if $remarks}
			<meta property="og:description" content="{$remarks|strip_tags|truncate:200|clean_for_attribute}">
		{/if}
	</head>

	{if $show_results}
		{* if you are not using this section, be sure to remove the javascript at the bottom of the page. *}
		<div id="details-search-results" style="display:none;" class="clearfix"></div>
		<div id="details-search-results-button">
			<a href="#" class="btn"><i class="icon-plus"></i> Search Results</a>
		</div>
	{/if}

	<div class="row-fluid">
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="/" title="Home">Home</a> <span class="divider">&gt;</span></li>
				<li><a href="{$ACTION_URLS.search}" title="Search">Search</a> <span class="divider">&gt;</span></li>
				{if $last_search_url}
					<li><a href="{$ACTION_URLS.search}{$last_search_url}" title="Search Results">Search Results</a> <span class="divider">&gt;</span></li>
				{/if}
				<li class="active">{$fullStreetAddress}</li>
			</ul>
		</div>
		<div class="span3">
			{render_dropin dropin="AddThis" services="print,email,facebook,twitter,google_plusone,pinterest" print_link="/property/print_view/`$company_property_id`"}
		</div>
	</div>

	<div class="row-fluid" id="property-details-page">
		<div class="span9 details-content-column">
			<h1 class="page-heading">{$fullStreetAddress}</h1>
			
			{if $open_houses}
				<div class="alert open-house-alert">
					<h3>Open House</h3>
					<p>
						{assign var=openTrip value=false}
						{foreach from=$open_houses item=thisOpenHouse key=index}
							{if !$openTrip && $thisOpenHouse.start_datetime > 1 && $thisOpenHouse.start_datetime|date_format:'%Y-%m-%d' >= $smarty.now|date_format:'%Y-%m-%d'}
								{assign var=openTrip value=true}
								{$thisOpenHouse.start_datetime|date_format:"%a, %b %e"}
								{$thisOpenHouse.start_datetime|date_format:"%l:%M"} - {$thisOpenHouse.end_datetime|date_format:"%l:%M"}
							{/if}
						{/foreach}
						{if count($open_houses) > 1}
							<a href="#details-full-open-house-list" class="fancybox" data-fancybox-height="500" data-fancybox-width="500" data-fancybox-type="inline" title="View All Open Houses">View All</a>
						{/if}
					</p>
				</div>
				<div class="hidden">
					<div id="details-full-open-house-list">
						<h4>Open House Dates</h4>
						<ul class="unstyled">
							{foreach from=$open_houses item=thisOpenHouse key=index}
								{if $thisOpenHouse.start_datetime > 1 && $thisOpenHouse.start_datetime|date_format:'%Y-%m-%d' >= $smarty.now|date_format:'%Y-%m-%d'}
									<li><strong>Open House:</strong> {$thisOpenHouse.start_datetime|date_format:"%A, %B %e"}, {$thisOpenHouse.start_datetime|date_format:"%l:%M%P"} - {$thisOpenHouse.end_datetime|date_format:"%l:%M%P"}</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			{/if}

			<div class="tabClass" id="details-page-tabs">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#details-tab">Details</a></li>
					<li><a href="#photos-tab">Photos</a></li>
					{if $latitude && $latitude != '' && $latitude != 0 && $longitude && $longitude != '' && $longitude != 0 && $zip_code && $zip_code != '' && $zip_code != 0}
						<li><a href="#map-tab">Map</a></li>
					{/if}
					<li><a href="#community-tab">Community</a></li>
					<li><a href="#mortgage-tab">Mortgage Calculator</a></li>
					{if $latitude && $latitude != '' && $latitude != 0 && $longitude && $longitude != '' && $longitude != 0}
						<li><a href="#nearby-tab">Nearby Properties</a></li>
					{/if}
				</ul>
				<div class="tab-content">
					<div class="tab-pane clearfix active" id="details-tab">
						<div class="row-fluid">
							<div class="span7">
								{$remarks}
							</div>
							<div class="span5">
								{if $photos.0}
									<img src="{$photos.0}crop/349,349" alt="Photo of {$fullStreetAddress|clean_for_attribute}">
								{/if}
							</div>
						</div>
						<hr>
						{include file="$view_path/detailsData.inc.tpl"}
					</div>
					<div class="tab-pane clearfix" id="photos-tab">
						<div class="gallery-widget" id="fullscreen-gallery">
							<div class="gallery-widget-main-photo-wrapper">
								<img src="{$photos.0}/maxwidth/870" alt="Main Property Photo">
							</div>
							<div class="gallery-widget-navigation clearfix">
								<a href="#" class="gallery-widget-next" title="Next">Next &gt;</a>
								<a href="#" class="gallery-widget-slide" title="Slideshow">Slideshow</a>
								<a href="#" class="gallery-widget-prev" title="Previous">&lt; Prev</a>
							</div>
							<ul class="gallery-widget-carousel">
								{foreach from=$photos item=photo key=index}
									<li><img src="{$photo}/crop/130,90" alt="Thumbnail {$index} of {$fullStreetAddress|clean_for_attribute}"></li>
								{/foreach}
							 </ul>
						</div>
					</div>
					{if $latitude && $latitude != '' && $latitude != 0 && $longitude && $longitude != '' && $longitude != 0 && $zip_code && $zip_code != '' && $zip_code != 0}
						<div class="tab-pane clearfix" id="map-tab">
							<div id="poi-map-element"></div>
						</div>
					{/if}
					<div class="tab-pane clearfix" id="community-tab">
						{render_component component="CommunityAssociation" property_id=$property_id}
					</div>
					<div class="tab-pane clearfix" id="mortgage-tab">
						{render_dropin dropin="jQueryMortgageCalcV3" list_price=$list_price tax_amount=$taxes}
					</div>
					{if $latitude && $latitude != '' && $latitude != 0 && $longitude && $longitude != '' && $longitude != 0}
						<div class="tab-pane clearfix" id="nearby-tab"></div>
					{/if}
				</div>
			</div>
		</div>
		<div class="span3 details-sidebar-column">
			{if $next_property_link || $prev_property_link}
				<div class="clearfix margin-bottom-30">
					{if $prev_property_link}
						<a href="{$prev_property_link}" title="Previous Listing" class="floatLeft">&lt; Previous</a>
					{/if}
					{if $next_property_link}
						<a href="{$next_property_link}" title="Next Listing" class="floatRight">Next &gt;</a>
					{/if}
				</div>				
			{/if}

			<div class="clearfix margin-bottom-30">
				<ul class="unstyled">
					{if !$date_sold}
	                    <li>
	                    	<a href="/popup/forms/display/request_info/?prop={$company_property_id}&amp;realtor_id={$realtor.id}" title="Request More Info" class="fancybox" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="765">Request More Info</a>
	                    </li>
	                    <li class="margin-top-10">
	                    	<a href="/popup/forms/display/schedule_showing/?prop={$company_property_id}&amp;realtor_id={$realtor.id}" title="Request a Showing" class="fancybox" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="815">Request a Showing</a>
	                    </li>
						<li class="margin-top-10">
							<a href="/popup/account/addRemoveFavoritePropertyManager/{$company_property_id}" class="addFavorite addFavoriteLinkText{if $is_favorite} removeFavorite{/if}" target="_blank" rel="nofollow" data-property-id="{$company_property_id}" title="{if $is_favorite}Remove from{else}Add to{/if} Favorites">{if $is_favorite}Remove From{else}Add to{/if} Favorites</a>
						</li>
						<li class="margin-top-10">
							<a href="#{$company_property_id}" class="property-bin-add"> Add to Property Cart</a>
						</li>
						<li class="margin-top-10">
							<a href="/property/print_view/{$company_property_id}" target="_blank" rel="nofollow">Print Brochure</a>
						</li>
						<li class="margin-top-10" id="my-notes-item-wrapper">
							{* if not using the property notes section be sure to remove the code from the ctrl_property addAdditionalArgs method as well as the javascript at the bottom of the page *}
							<h4 class="no-margin">Property Notes</h4>
							{if $logged_in_user}
								<div class="margin-top-5">
									<span class="propertyNoteValueContainer"{if !$enterprise_account_note} style="display:none;"{/if}>
										<span class="propertyNoteValue">{$enterprise_account_note}</span> <a href="#" class="editPropertyNoteLink">(edit)</a>
									</span>
									{if !$enterprise_account_note}
										<a href="#" class="addPropertyNoteLink" title="Add a private note for this property">Add a private note for this property</a>
									{/if}
									<form style="display:none;" class="propertyAddNoteForm row-fluid" action="{$ACTION_URLS.account}savePropertyNote/{$company_property_id}">
										<fieldset class="span12">
											<textarea name="note" class="span12" rows="5" cols="40" placeholder="Enter your private note about this property">{if $enterprise_account_note}{$enterprise_account_note}{/if}</textarea>
											<button type="submit" class="btn btn-block">Save</button>
										</fieldset>
									</form>
								</div>
							{else}
								<a data-action="account-register" href="{$ACTION_URLS.account}signup/">Signup</a> or <a data-action="account-login" href="{$ACTION_URLS.account}login/">Login</a> to add notes to this property.
							{/if}
						</li>
					{/if}
				</ul>
			</div>

			{if $realtor}
				<div class="listing-agents margin-bottom-30">
					<h3>
						{if $realtor.entity_type == 'company'}
							{$realtor.name}
						{else}
							<a href="{$ACTION_URLS.realtor}{if $realtor.entity_type == 'realtor'}info{else}team{/if}/{$realtor.rebrand_code}" title="View {$realtor.name|clean_for_attribute}'s Bio">{$realtor.name}</a>
						{/if}
					</h3>
					<div class="row-fluid">
						<div class="span5">
							{if $realtor.entity_type == 'company'}
								<img src="{if $realtor.first_pic.url}{$realtor.first_pic.url}/crop/108,108{else}/images/agent-placeholder.jpg{/if}" alt="{$realtor.name}'s Photo">
							{else}
								<a href="{$ACTION_URLS.realtor}{if $realtor.entity_type == 'realtor'}info{else}team{/if}/{$realtor.rebrand_code}" title="View {$realtor.name|clean_for_attribute}'s Bio"><img src="{if $realtor.first_pic.url}{$realtor.first_pic.url}/crop/108,108{else}/images/agent-placeholder.jpg{/if}" alt="{$realtor.name}'s Photo"></a>
							{/if}
						</div>
						<div class="span7">
							<h4>Contact {if $realtor.entity_type == "realtor"}Me{else}Us{/if} For More Info</h4>
							<p>
								{if $realtor.address.Direct_Phone.value}
									{$realtor.address.Direct_Phone.value}
								{elseif $realtor.address.Cell_Phone.value}
									{$realtor.address.Cell_Phone.value}
								{elseif $realtor.address.Office_Phone.value}
									{$realtor.address.Office_Phone.value}
								{/if}
							</p>
							{if $realtor.rebrand_code}
								<p>
									<a href="/popup/forms/display/request_info/?prop={$company_property_id}&amp;realtor_id={$realtor.id}" title="Request More Info" class="btn fancybox">Email {if $realtor.entity_type|lower == 'team'}Us{else}Me{/if}</a>
								</p>
							{/if}
						</div>
					</div>
				</div>
			{/if}

			{if $recent_properties}
				{* if not using the recent properties section be sure to remove the code from the ctrl_property addAdditionalArgs method *}
				<div class="margin-bottom-30">
					<h3 class="no-margin">Recently Viewed</h3>
					<ul class="unstyled">
						{foreach from=$recent_properties item=recent_property key=index name=recentLoop}
							<li class="margin-top-10">
								<a href="{$recent_property.details_link}/" title="{$recent_property.streetAddress|clean_for_attribute}">
									<img src="{$recent_property.first_pic->getUrl()}/crop/270,130/" alt="Photo of {$recent_property.streetAddress|clean_for_attribute}">
								</a>
								<p>
									<strong>{$recent_property.streetAddress}</strong>
									<span class="block">{$recent_property.list_price}</span>
									<span class="block">
										{if $recent_property.bedrooms_total > 0}{$recent_property.bedrooms_total|clean_bed_bath} Bed{/if}
										{if $recent_property.bedrooms_total > 0 && $recent_property.bathrooms_total > 0} | {/if}
										{if $recent_property.bathrooms_total > 0}{$recent_property.bathrooms_total|clean_bed_bath} Bath{/if}
										{if  $recent_property.sqft_total_combined > 0 && ($recent_property.bedrooms_total > 0 || $recent_property.bathrooms_total > 0)} | {/if}
										{if $recent_property.sqft_total_combined > 0}{$recent_property.sqft_total_combined} SqFt{/if}
									</span>
								</p>
								<a href="/property/property_details_quick_view/{$recent_property.company_property_id}" title="Quick View" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-mini">Quick View</a>
							</li>
						{/foreach}
					</ul>
				</div>
			{/if}
		</div>
	</div>
	<footerargs>
		<script src="https://maps.googleapis.com/maps/api/js?libraries=places&amp;sensor=false"></script>
		<script src="/js/buildlist.js?scripts=/js/jqueryui/components/button.min.js,/js/jqueryui/components/autocomplete.min.js,/js/tabs/jquery.jtabs.min.js,/js/carousels/jquery.jcarousel.min.js,/js/galleries/jquery.simpleCarouselGallery.2.0.min.js,/js/map_search/jquery.poi-map.js"></script>
		<script>
		{literal}
		var simpleCarouselGalleryObj = null;
		var map_poi_object = null;
		var poiMapLoaded = false;
		jQuery(document).ready(function($) {
			// tabs
			$('#details-page-tabs').jtabs({
				bootstrapMode: true,
				openCallback: function(obj, num, trigger, tab) {
					var href = $(trigger).find('a').attr('href');
					switch(href)
					{
						case '#photos-tab':
							setTimeout(function() {
								if (simpleCarouselGalleryObj && typeof simpleCarouselGalleryObj === 'object' && simpleCarouselGalleryObj.hasOwnProperty('Resample')) {
									simpleCarouselGalleryObj.Resample();
								}
							}, 200);
							break;
						case '#map-tab':
							//poi map
							if (!poiMapLoaded) {
								poiMapLoaded = true;
								map_poi_object = $('#poi-map-element').poiMap({
									latitude: {/literal}{if $latitude}{$latitude}{else}0{/if}{literal},
									longitude: {/literal}{if $longitude}{$longitude}{else}0{/if}{literal},
									zip: {/literal}{if $zip_code}{$zip_code}{else}0{/if}{literal},
									property_title: '{/literal}{$streetAddress|escape:javascript}{literal}',
									bootstrapMode: true,
									markerShadow: true,
									buttonText: 'Search'
								}).data('poiMap');
							} else {
								if (map_poi_object && map_poi_object.hasOwnProperty("resize")) {
									setTimeout(map_poi_object.resize, 200);
								}
							}   
							break;
						case '#nearby-tab':
							//<![CDATA[
							// you might want to add the &property_type={$SOMETHING} parameter to this lazyload to get more relevant results
							_lazyLoadComponent('nearby-tab','dropin/NearbyProperties/?latitude={/literal}{$latitude}{literal}&longitude={/literal}{$longitude}{literal}&max_distance=2&max_properties=5&company_property_id={/literal}{$company_property_id}{literal}');
							//]]>
							break;
					}
				}
			});

			// submit the property note form
			$('.propertyAddNoteForm').on('submit', function(e) {
				e.preventDefault();
				var form = $(this);
				form.find('button').prop('disabled', true).text('Saving...');
				$.ajax({
					type: 'POST',
					data: form.serialize(),
					url: form.attr('action'),
					success: function (data, textStatus) {
						form.hide();
						var prnt = $('#my-notes-item-wrapper');
						prnt.find('.propertyNoteValueContainer').show().find('.propertyNoteValue').html(form.find('[name="note"]').val());
						prnt.find('.addPropertyNoteLink').hide();
						prnt.find('.editPropertyNoteLink').show();
						form.find('button').prop('disabled', false).text('Save');
					},
					error: function (data) {
						form.find('button').prop('disabled', false).text('Save');
						alert('Error adding note!');
					}
				});
			});

			// observe property note buttons
			$('.addPropertyNoteLink, .editPropertyNoteLink').on('click', function(e) {
				e.preventDefault();
				$(this).hide();
				$('.propertyAddNoteForm').show();
			});

			//slide details results
			$('#details-search-results-button a').on('click', function(e) {
				e.preventDefault();
				var el = $(this);
				if (el.hasClass('active')) {
					el.removeClass('active');
					el.html('<i class="icon-plus"></i> Search Results');
				} else {
					el.addClass('active');
					el.html('<i class="icon-minus"></i> Search Results');
				}
				_lazyLoadComponent('details-search-results','SearchResults/?company_property_id={/literal}{$company_property_id}{literal}');
				$('#details-search-results').slideToggle('fast');
			});
		});
		jQuery(window).load(function () {
			// build photo gallery on window load so all images exist in the dom. 
			simpleCarouselGalleryObj = jQuery('#fullscreen-gallery').simpleCarouselGallery({
				large_resize_method: '/maxwidth/870', // resize method used on the main image
				thumb_resize_method: '/crop/130,90', // resize method used on the thumbnails
				next: '.gallery-widget-next',
				prev: '.gallery-widget-prev',
				slideshow: '.gallery-widget-slide'
			}).data('simpleCarouselGallery');
		});
		{/literal}
		</script>
	</footerargs>
{else}
    {include file="$view_path/details_print.view.tpl"}
{/if}
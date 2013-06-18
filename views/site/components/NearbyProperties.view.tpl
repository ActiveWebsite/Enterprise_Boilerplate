<div id="nearby-tabs" class="tabClass">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#active-listings" title="Active Listings">Active Listings</a></li>
		<li><a href="#sold-listings" title="Recently Sold">Recently Sold</a></li>
		<li><a href="#reduced-listings" title="Recently Reduced">Recently Reduced</a></li>
		<li><a href="#new-listings" title="Newly Listed">Newly Listed</a></li>
	</ul>
	<div class="tab-content">
		<div id="active-listings" class="tab-pane active">
			{if $properties}
				<h3>{$property_count} Listings ({$furthest_distance} Mile Radius)</h3>
				<ul class="row-fluid thumbnails">
					{foreach from=$properties item=property key=index}
						{if $index < $property_limit}
							<li class="span4 standard-property{if $index%3==0} first-in-row{/if}">
								{assign var='prop_photo' value=$property->get_first_pic()}
								{if $prop_photo instanceof PropertyPicture}
									<div class="prop-photo">
										<a href="/property/{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}" title="View property at $property->getFullStreetAddress()|clean_for_attribute}">
											<img src="{$prop_photo->getUrl()}/crop/275,180" title="Photo of {$property->getFullStreetAddress()|clean_for_attribute}">
										</a>
									</div>
								{/if}
								<h3>
									<a href="/property/{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}" title="View property at {$property->getFullStreetAddress()|clean_for_attribute}">
										{$property->getFullStreetAddress()}
									</a>
								</h3>
								<p>
									{$property->information.list_price->value}
									{if $property->information.bedrooms_total->value > 0} | {$property->information.bedrooms_tota->valuel|clean_bed_bath} Bed{if $property->information.bedrooms_total->value > 1}s{/if}{/if}
									{if $property->information.bathrooms_total->value > 0} | {$property->information.bathrooms_total->value|clean_bed_bath} Bath{if $property->information.bathrooms_total->value > 1}s{/if}{/if}
								</p>
								<div class="prop-cta clearfix">
									<a href="/property/property_details_quick_view/{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-mini">
										Quick View
									</a>
									<a href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property->company_property_id}" data-property-id="{$property->company_property_id}" class="addFavorite addFavoriteButton" target="_blank" rel="nofollow" title="Add to Favorites">
										Add to Favorites
									</a>
									<a href="#{$property->company_property_id}" data-property-id="{$property->company_property_id}" class="property-bin-add property-bin-button" title="Add to Bin">
										Add to Bin
									</a>
								</div>
							</li>
						{/if}
					{/foreach}
				</ul>
				{if $search_url}
					<div class="search-component-view-all">
						<a href="{$search_url}" target="_blank">View All Results</a>
					</div>
				{/if}
			{else}
				<p>We're sorry, but no properties that meet this criteria are currently available.</p>
			{/if}
		</div>
        <div id="sold-listings" class="tab-pane" style="display:none;"></div>
		<div id="reduced-listings" class="tab-pane" style="display:none;"></div>
		<div id="new-listings" class="tab-pane" style="display:none;"></div>
    </div>
</div>
{literal}
<script>
	jQuery(document).ready(function($){
		$('#nearby-tabs').jtabs({
			bootstrapMode: true,
			openCallback: function(obj, num, trigger, tab) {
				var e = $(trigger).find('a').attr('href');			
				//<![CDATA[
				switch(e) {
					case '#new-listings':
						_lazyLoadComponent('new-listings','{/literal}PropertySearch/?search_url=/New_Property/21/company/on/Property_Type/{$property_type}/Distance/{$latitude},{$longitude},5/orderby/geodistance/&alternateView=NearbyPropSearch&results=6&latitude={$latitude}&longitude={$longitude}{literal}');
						break;
					case '#reduced-listings':
						_lazyLoadComponent('reduced-listings','{/literal}PropertySearch/?search_url=/Property_Type/{$property_type}/NewlyReduced/1/Distance/{$latitude},{$longitude},5/orderby/geodistance/&alternateView=NearbyPropSearch&results=6&latitude={$latitude}&longitude={$longitude}{literal}');
						break;
					case '#sold-listings':
						_lazyLoadComponent('sold-listings','{/literal}PropertySearch/?search_url=/sold/Property_Type/{$property_type}/Distance/{$latitude},{$longitude},5/orderby/geodistance/&alternateView=NearbySoldPropSearch&results=6&latitude={$latitude}&longitude={$longitude}{literal}');
						break;
				}
				//]]>
			}
		});
		if (typeof initFancyboxElements === 'function') {
			initFancyboxElements(); //defined in fancybox js file
		}
		if (typeof _checkForFavorites === 'function') {
			_checkForFavorites($('#activeListings a.addFavorite'));
		}
		$('#property-bin-container').propertyBin('resampleBin');
	});
</script>
{/literal}
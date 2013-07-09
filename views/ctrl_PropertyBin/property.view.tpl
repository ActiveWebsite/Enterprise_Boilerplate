{if $property_dict}
	<li class="col-sm-4 col-lg-4 property-bin-item{if !$property_dict.latitude || $property_dict.latitude == 0 || $property_dict.latitude == '' || !$property_dict.longitude || $property_dict.longitude == 0 || $property_dict.longitude == ''} property-bin-no-tour{/if} margin-bottom-30" id="bin-item-{$property_dict.company_property_id}">
		<div class="standard-property property-bin-item-inner">
			{if $property_dict.first_pic && $property_dict.first_pic instanceof PropertyPicture}
				<div class="prop-photo">
					<img class="property-bin-item-photo" src="{$property_dict.first_pic->getUrl()}/crop/220,120" alt="Property Photo">
				</div>
			{/if}
			<h3>
				<a href="{$property_dict.details_link}/{$property_dict.fullStreetAddress|clean_for_url}" title="View property at {$property_dict.fullStreetAddress|clean_for_attribute}">{$property_dict.streetAddress}</a>
			</h3>
			<p>
				{$property_dict.list_price}
				{if $property_dict.bedrooms_total > 0} | {$property_dict.bedrooms_total|clean_bed_bath} Bed{if $property_dict.bedrooms_total > 1}s{/if}{/if}
				{if $property_dict.bathrooms_total > 0} | {$property_dict.bathrooms_total|clean_bed_bath} Bath{if $property_dict.bathrooms_total > 1}s{/if}{/if}
			</p>
			<div class="prop-cta clearfix">
				<a href="/property/property_details_quick_view/{$property_dict.company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-quickview">
					Quick View
				</a>
				<a href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property_dict.company_property_id}" data-property-id="{$property_dict.company_property_id}" class="addFavorite addFavoriteButton" target="_blank" rel="nofollow" title="Add to Favorites">
					Add to Favorites
				</a>
			</div>
			{if !$property_dict.latitude || $property_dict.latitude == 0 || $property_dict.latitude == '' || !$property_dict.longitude || $property_dict.longitude == 0 || $property_dict.longitude == ''}
				<span class="property-bin-item-notification">not available for tour</span>
			{/if}
			<a href="#{$property_dict.company_property_id}" class="property-bin-delete" title="Remove Property From Bin"><i class="icon icon-remove-circle"></i></a>
		</p>
	</li>
{/if}
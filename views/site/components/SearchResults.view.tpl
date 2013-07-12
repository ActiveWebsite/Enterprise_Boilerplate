{if $properties}
	<ul id="expandedSearchResults" class="clearFix jcarousel-skin-details-search-results">
		{foreach from=$properties item=property name=propLoop}
            <li class="standard-property">
                <div class="prop-photo">
                    <a href="/property/{$property.company_property_id}/{$property.fullStreetAddress|clean_for_url}" title="View property at {$property.fullStreetAddress|clean_for_attribute}">
                        <img src="{$property.first_pic->getUrl()}/crop/178,119/" data-hd-src="{$property.first_pic->getUrl()}/crop/356,238/" class="img-hd" title="Photo of {if $property.address_display_bit}{$property.fullStreetAddress|clean_for_attribute}{/if}">
                    </a>
                </div>
                <h3>
                    <a href="/property/{$property.company_property_id}/{$property.fullStreetAddress|clean_for_url}" title="View property at {$property.fullStreetAddress|clean_for_attribute}">
                        {$property.streetAddress}
                    </a>
                </h3>
                <p>
                    {$property.list_price}
                    {if $property.bedrooms_total > 0} | {$property.bedrooms_total|clean_bed_bath} Bed{if $property.bedrooms_total > 1}s{/if}{/if}
                    {if $property.bathrooms_total > 0} | {$property.bathrooms_total|clean_bed_bath} Bath{if $property.bathrooms_total > 1}s{/if}{/if}
                </p>
			</li>
		{/foreach}
	</ul>
	{literal}
		<script>
			jQuery(document).ready(function($) {
				$('#expandedSearchResults').jcarousel();
                // build retina images
                if (typeof _buildRetinaImages === 'function') {
                    _buildRetinaImages($('#expandedSearchResults'));
                }                
			});
		</script>
	{/literal}	
{/if}
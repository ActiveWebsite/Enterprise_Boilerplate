{if $properties}
    <ul class="unstyled" id="my-property-carousel-1">
        {foreach from=$properties item=property key=index}
            <li class="standard-property">
                <div class="prop-photo">
                    <a href="/property/{$property.company_property_id}{if $property.address_display_bit}/{$property.fullStreetAddress|clean_address}{/if}" title="View property{if $property.address_display_bit} at {$property.fullStreetAddress|clean_address}{/if}">
                        <img src="{$property.first_pic->getUrl()}/crop/270,180/" title="Photo of {if $property.address_display_bit}{$property.fullStreetAddress|clean_address}{/if}">
                    </a>
                </div>
                <h3>
                    <a href="/property/{$property.company_property_id}{if $property.address_display_bit}/{$property.fullStreetAddress|clean_address}{/if}" title="View property{if $property.address_display_bit} at {$property.fullStreetAddress|clean_address}{/if}">
                        {if $property.address_display_bit}{$property.fullStreetAddress}{else}Property Details{/if}
                    </a>
                </h3>
                <p>
                    {$property.list_price}
                    {if $property.bedrooms_total > 0} | {$property.bedrooms_total|clean_bed_bath} Bed{if $property.bedrooms_total > 1}s{/if}{/if}
                    {if $property.bathrooms_total > 0} | {$property.bathrooms_total|clean_bed_bath} Bath{if $property.bathrooms_total > 1}s{/if}{/if}
                </p>
                <div class="prop-cta clearfix">
                    <a href="/property/property_details_quick_view/{$property.company_property_id}" class="fancybox fancy-width-920 fancy-height-500 iframe btn btn-mini" rel="resultsPage">
                        Quick View
                    </a>
                    <a href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property.company_property_id}" data-property-id="{$property.company_property_id}" class="addFavoriteLink" target="_blank" rel="nofollow" title="{if $is_fav}Remove from{else}Add to{/if} Favorites">
                        {if $is_fav}Remove from{else}Add to{/if} Favorites
                    </a>
                    <a href="#{$property.company_property_id}" data-property-id="{$property.company_property_id}" class="property-bin-add" title="Add to Bin">
                        Add to Bin
                    </a>
                </div>
            </li>
        {/foreach}
    </ul>
    {if $search_url}
        <div class="search-component-view-all">
            <a href="{$search_url}" title="View All">View All</a>
        </div>
    {/if}
    {literal}
    <script>
        jQuery(document).ready(function($) {
            // load carousel 
            $('#my-property-carousel-1').jcarousel();
            // get any new fancyboxes
            initFancyboxElements();
            // find any property bin items
            $('#property-bin-container').propertyBin('resampleBin');
        });
    </script>
    {/literal}
{else}
    <p>No results found.</p>
{/if}
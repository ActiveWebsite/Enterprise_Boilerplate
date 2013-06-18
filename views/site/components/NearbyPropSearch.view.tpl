{assign var=view_id value=$smarty.now}
{if $properties}
    <ul class="row-fluid thumbnails" id="my-property-{$view_id}">
        {foreach from=$properties item=property key=index}
            <li class="span4 standard-property{if $index%3==0} first-in-row{/if}">
                {if $property.first_pic instanceof PropertyPicture}
                    <div class="prop-photo">
                        <a href="/property/{$property.company_property_id}/{$property.fullStreetAddress|clean_for_url}" title="View property at {$property.fullStreetAddress|clean_for_attribute}">
                            <img src="{$property.first_pic->getUrl()}/crop/270,180/" title="Photo of {$property.fullStreetAddress|clean_for_attribute}">
                        </a>
                    </div>
                {/if}
                <h3>
                    <a href="/property/{$property.company_property_id}/{$property.fullStreetAddress|clean_for_url}" title="View property at {$property.fullStreetAddress|clean_for_attribute}">
                        {$property.fullStreetAddress}
                    </a>
                </h3>
                <p>
                    {$property.list_price}
                    {if $property.bedrooms_total > 0} | {$property.bedrooms_total|clean_bed_bath} Bed{if $property.bedrooms_total > 1}s{/if}{/if}
                    {if $property.bathrooms_total > 0} | {$property.bathrooms_total|clean_bed_bath} Bath{if $property.bathrooms_total > 1}s{/if}{/if}
                </p>
                <div class="prop-cta clearfix">
                    <a href="/property/property_details_quick_view/{$property.company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-mini">
                        Quick View
                    </a>
                    <a href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property.company_property_id}" data-property-id="{$property.company_property_id}" class="addFavorite addFavoriteButton" target="_blank" rel="nofollow" title="Add to Favorites">
                        Add to Favorites
                    </a>
                    <a href="#{$property.company_property_id}" data-property-id="{$property.company_property_id}" class="property-bin-add property-bin-button" title="Add to Bin">
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
            // find any property bin items
            $('#property-bin-container').propertyBin('resampleBin');
            // persiste any favorite links
            if (typeof _checkForFavorites === 'function') {
                _checkForFavorites($('#my-property-{/literal}{$view_id}{literal} a.addFavorite'));
            }            
        });
    </script>
    {/literal}
{else}
    <p>No results found.</p>
{/if}
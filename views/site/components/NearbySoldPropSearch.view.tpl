{if $properties}
    <ul class="row-fluid thumbnails">
        {foreach from=$properties item=property key=index}
            <li class="span4 standard-property{if $index%3==0} first-in-row{/if}">
                {if $property.first_pic instanceof PropertyPicture}
                    <div class="prop-photo">
                        <img src="{$property.first_pic->getUrl()}/crop/270,180/" title="Photo of {$property.fullStreetAddress|clean_for_attribute}">
                    </div>
                {/if}
                <h3>{$property.fullStreetAddress} </h3>
                <p>
                    {$property.list_price}
                    {if $property.bedrooms_total > 0} | {$property.bedrooms_total|clean_bed_bath} Bed{if $property.bedrooms_total > 1}s{/if}{/if}
                    {if $property.bathrooms_total > 0} | {$property.bathrooms_total|clean_bed_bath} Bath{if $property.bathrooms_total > 1}s{/if}{/if}
                </p>
                <div class="prop-cta clearfix">
                    <a href="/property/property_details_quick_view/{$property.company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-mini">
                        Quick View
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
{else}
    <p>No results found.</p>
{/if}
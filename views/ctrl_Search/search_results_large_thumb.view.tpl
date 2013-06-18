{* 
	---------------------------------------------------------
	DETERMIN THE PROPERTY TYPE WE HAVE IF WE ARE USING A SYSTEM WITH MULTIPLE TYPES
	THESE ARE JUST EXAMPLES YOU WILL HAVE YOUR OWN ID'S
	THIS IS AN EXAMPLE
	---------------------------------------------------------
*}
{if $search_narrowers.SV_Property_Type == '145'}
    {* Residential *}
    {assign var=PT value=145}
{elseif $search_narrowers.SV_Property_Type == '146'}
    {* Land/Lot *}
    {assign var=PT value=146}
{elseif $search_narrowers.SV_Property_Type == '147'}
    {* Farms *}
    {assign var=PT value=147}
{elseif $search_narrowers.SV_Property_Type == '148'}
    {* Multi-Family *}
    {assign var=PT value=148}
{elseif $search_narrowers.SV_Property_Type == '149'}
    {* Commercial *}
    {assign var=PT value=149}
{else}
    {* DEFAULT TO RESIDENTIAL *}
    {assign var=PT value=145}
{/if}
<div class="row-fluid">
	<div class="span3">
		{include file="$view_path/search_results_narrower.inc.tpl"}
	</div>
	<div class="span9">
		<h1 class="page-heading">{$page_manager_obj->get_total_count()|number_format} Search Results</h1>
		
		{include file="$view_path/results_header.tpl"}
		
		<hr>
		
		<ul class="row-fluid thumbnails margin-bottom-0">
			{if count($properties) > 0}
			    {foreach item=property from=$properties key=index}
			    	<li class="span4 standard-property{if $index%3==0} first-in-row{/if}">
						<div class="prop-photo">
							<a href="/property/{$property->company_property_id}{if $property->address_display_bit}/{$property->getfullStreetAddress()|clean_for_url}{/if}" title="View property{if $property->address_display_bit} at {$property->getfullStreetAddress()|clean_for_attribute}{/if}">
								<img src="{$properties_pics[$index]->getUrl()}/crop/275,180/" title="Photo of {if $property->address_display_bit}{$property->getfullStreetAddress()|clean_for_attribute}{/if}">
							</a>
							{if $property->open_houses}
								<div class="open-house-banner">
									<p><strong>OPEN</strong> {$open_house[0]->start_datetime|date_format:'%a %m/%e %I'}-{$open_house[0]->end_datetime|date_format:'%I'}</p>
								</div>
							{/if}
						</div>
			    		<h3>
			    			<a href="/property/{$property->company_property_id}{if $property->address_display_bit}/{$property->getfullStreetAddress()|clean_for_url}{/if}" title="View property{if $property->address_display_bit} at {$property->getfullStreetAddress()|clean_for_attribute}{/if}">
			    				{if $property->address_display_bit}{$property->getfullStreetAddress()}{else}Property Details{/if}
			    			</a>
			    		</h3>
			    		<p>
							{$property->list_price}
							{if $property->bedrooms_total > 0} | {$property->bedrooms_total|clean_bed_bath} Bed{if $property->bedrooms_total > 1}s{/if}{/if}
							{if $property->bathrooms_total > 0} | {$property->bathrooms_total|clean_bed_bath} Bath{if $property->bathrooms_total > 1}s{/if}{/if}
			    		</p>
			    		<div class="prop-cta clearfix">
							<a href="/property/property_details_quick_view/{$property->company_property_id}" class="quickview-fancybox btn btn-mini" title="Quick View" data-fancybox-group="results-page" rel="nofollow">
								Quick View
							</a>
							{* determine if this property is a favorite *}
							{if $current_account_user && $current_account_user.id}
								{assign var=is_fav value=$property->is_favorite($current_account_user.id)}
							{else}
								{assign var=is_fav value=false}
							{/if}
							<a href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property->company_property_id}" data-property-id="{$property->company_property_id}" class="addFavorite addFavoriteButton{if $is_fav} removeFavorite{/if}" target="_blank" rel="nofollow" title="{if $is_fav}Remove from{else}Add to{/if} Favorites">
								{if $is_fav}Remove from{else}Add to{/if} Favorites
							</a>
							<a href="#{$property->company_property_id}" data-property-id="{$property->company_property_id}" class="property-bin-add property-bin-button" title="Add to Bin">
								Add to Bin
							</a>
						</div>
			    	</li>
				{/foreach}
			{else}
				<li class="span12 first-in-row">No Properties Found</li>
			{/if}
		</ul>

		<hr class="margin-top-0">

		{include file="$view_path/results_footer.tpl"}
		
	</div>
</div>
<footerargs>
	<iframe name="action_iframe" style="display:none;" width="0" height="0"></iframe>
	<script src="/js/buildlist.js?scripts=/js/search/jquery.Search.js,/js/search/jquery.fancySelect2.min.js,/js/min/search_app.min.js,/js/jqueryui/components/autocomplete.min.js"></script>
	{literal}
		<script>
			jQuery(document).ready(function($) {
				var search = new ClientSearch('refineSearchFormElement', false, false, false);
				search.initRefineSearch();
				
				// instantiate fancybox here by itself so we can use the fancybox group for the next/prev buttons.
				$('a.quickview-fancybox').fancybox({
					title: '',
					autoSize: false,
					width: 800,
					height: 400,
					type: 'iframe',
					wrapCSS: 'fancybox-quickview-nav-wrap'
				});		
			});
		</script>
	{/literal}
</footerargs>
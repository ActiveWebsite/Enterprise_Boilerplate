{if stripos($controller_obj->URL.url_raw,'print_view') === false}
<div id="property-compare-table-wrapper">
	<div class="row-fluid">
		<div class="span6">
			<h2>Comparing <span class="compareCount">{$properties|@count}</span> Properties</h2>
		</div>
		<div class="span6 text-right">
			<a href="{$compare_print_url}" target="_blank" class="printActionURL btn" title="Print">Print</a>
			<a href="#" class="removeAllCompareProperties btn margin-left-10" title="Remove All Properties">Remove All Properties</a>
		</div>
	</div>
	<div id="mainTableArea" class="row-fluid">
		<div class="span2 compare-labels">
			<table class="compareTable">
				<tbody>
					<tr>
						<td><div class="compare-cell-width compare-top-row">Address</td>
					</tr>
					<tr>
						<td><div class="compare-cell-width">Price</td>
					</tr>
					<tr>
						<td><div class="compare-cell-width">MLS#</td>
					</tr>
					<tr>
						<td><div class="compare-cell-width">Bedrooms</td>
					</tr>
					<tr>
						<td><div class="compare-cell-width">Bathrooms</td>
					</tr>
					<tr>
						<td><div class="compare-cell-width">Square Feet</td>
					</tr>
					<tr>
						<td><div class="compare-cell-width compare-request-row">Request Information</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="span10 compare-properties" id="compare-table-right-column-wrapper">
			{if $properties}
				<table class="compareTable">
					<tbody>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width compare-top-row">
										<div class="clearfix">
											<a href="#{$property.company_property_id}" class="compareRemoveProp pull-right" title="Remove Property"><i class="icon-remove"></i></a>
										</div>
										{if $property.photos[0]}
											<a href="{$ACTION_URLS.property_details}{$property.company_property_id}" target="_blank" title="Property Details for {$property.address|clean_for_attribute}">
												<img src="{$property.photos[0]}/crop/217,160" alt="photo of {$property.address|clean_for_attribute}">
											</a>
										{/if}
										<h3>
											<a href="{$ACTION_URLS.property_details}{$property.company_property_id}" target="_blank" title="Property Details for {$property.streetAddress|clean_for_attribute}">{$property.streetAddress}</a>
										</h3>
										<a href="/property/property_details_quick_view/{$property.company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-mini">
											Quick View
										</a>
										<a target="_blank" href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property.company_property_id}" class="addFavorite addFavoriteButton{if $property.is_favorite} removeFavorite{/if}" title="{if $property.is_favorite}Remove From {else}Add to{/if} Favorites">{if $property.is_favorite}Remove From{else}Add to{/if} Favorites</a>
									</div>
								</td>
							{/foreach}
						</tr>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width">
										{if $property.list_price}
											{$property.list_price}
										{else}
											N/A
										{/if}
									</div>
								</td>
							{/foreach}
						</tr>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width">
										{$property.property_id}
									</div>
								</td>
							{/foreach}
						</tr>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width">
										{if $property.bedrooms_total && $property.bedrooms_total > 0}
											{$property.bedrooms_total|clean_bed_bath}
										{else}
											N/A
										{/if}
									</div>
								</td>
							{/foreach}
						</tr>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width">
										{if ($property.bathrooms_total && $property.bathrooms_total > 0)}
											{$property.bathrooms_total|clean_bed_bath}
										{else}
											N/A
										{/if}
									</div>
								</td>
							{/foreach}
						</tr>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width">
										{if $property.sqft_total_combined}
											{$property.sqft_total_combined|number_format:0}
										{else}
											N/A
										{/if}
									</div>
								</td>
							{/foreach}
						</tr>
						<tr>
							{foreach from=$properties item=property key=index}
								<td class="propertyIDRow_{$property.company_property_id}">
									<div class="compare-cell-width compare-request-row">
										{render_dropin dropin="RealtorInfo" template="compare" MLSID=$property.mls_id Listing_Office=$property.listing_office_name MLSCode=$property.listing_agent_id prop=$property.company_property_id}
									</div>
								</td>
							{/foreach}
						</tr>
					</tbody>
				</table>
			{else}
				<p>No properties to compare. <a href="{$ACTION_URLS.search}">Find Properties</a></p>
			{/if}
		</div>
	</div>
</div>
<footerargs>
	<script src="/js/property_comparison/jquery.compareCollectionTable.min.js"></script>
	{literal}
	<script>
		jQuery(document).ready(function($) {
			$('#mainTableArea').compareCollectionTable({
				properties: [{/literal}{if $properties}{foreach from=$properties item=property key=index name=propLoop}"{$property.company_property_id}"{if !$smarty.foreach.propLoop.last},{/if}{/foreach}{/if}{literal}]
			});
		});
	</script>
	{/literal}
</footerargs>
{else}
	{include file="$view_path/details_print.view.tpl"}
{/if}
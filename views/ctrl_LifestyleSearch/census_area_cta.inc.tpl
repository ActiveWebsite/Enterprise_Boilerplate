<ul class="resultCTA row multi-columns-row">
	{if $community.community_rebrand_code}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_rebrand_code}"><i class="icon icon-info-sign"></i> Community Information</a></li>
	{elseif $community.community_association}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_association.rebrand}"><i class="icon icon-info-sign"></i> Community Information</a></li>
	{else}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15">&nbsp;</li>
	{/if}
	<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a title="Properties for Sale" target="_blank" class="view_prop_sale_cta" href="{$ACTION_URLS.search}ZipCode/{foreach from=$community.zip_code name=caZip key=index item=data}{$data.zip}{if !$smarty.foreach.caZip.last},{/if}{/foreach}"><i class="icon icon-home"></i> Properties for Sale</a></li>
	{if $getPropertiesWithMap && $community.zip_code}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a href="#{$community.id}:ZipCode:{foreach from=$community.zip_code name=caZip key=index item=data}{$data.zip}{if !$smarty.foreach.caZip.last},{/if}{/foreach}:40:0" class="view_map_cta" title="Map of {$community.name}"><i class="icon icon-map-marker"></i> View Map and Nearby Properties</a></li>
	{elseif $community.zip_code}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a href="#{$community.id}:ZipCode:{foreach from=$community.zip_code name=caZip key=index item=data}{$data.zip}{if !$smarty.foreach.caZip.last},{/if}{/foreach}:40:0" class="view_map_cta" title="Map of {$community.name}"><i class="icon icon-map-marker"></i> View Map</a></li>
	{/if}
</ul>
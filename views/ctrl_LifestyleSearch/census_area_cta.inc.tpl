<ul class="row resultCTA">
	{if $community.community_rebrand_code}
		<li class="col-xs-6 margin-bottom-10"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_rebrand_code}">Community Information</a></li>
	{elseif $community.community_association}
		<li class="col-xs-6 margin-bottom-10"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_association.rebrand}">Community Information</a></li>
	{else}
		<li class="col-xs-6 margin-bottom-10">&nbsp;</li>
	{/if}
	<li class="col-xs-6 margin-bottom-10"><a title="Properties for Sale" target="_blank" class="view_prop_sale_cta" href="{$ACTION_URLS.search}ZipCode/{foreach from=$community.zip_code name=caZip key=index item=data}{$data.zip}{if !$smarty.foreach.caZip.last},{/if}{/foreach}">Properties for Sale</a></li>
	{if $getPropertiesWithMap && $community.zip_code}
		<li class="col-xs-6 margin-bottom-10"><a href="#{$community.id}:ZipCode:{foreach from=$community.zip_code name=caZip key=index item=data}{$data.zip}{if !$smarty.foreach.caZip.last},{/if}{/foreach}:40:0" class="view_map_cta" title="Map of {$community.name}">View Map and Nearby Properties</a></li>
	{elseif $community.zip_code}
		<li class="col-xs-6 margin-bottom-10"><a href="#{$community.id}:ZipCode:{foreach from=$community.zip_code name=caZip key=index item=data}{$data.zip}{if !$smarty.foreach.caZip.last},{/if}{/foreach}:40:0" class="view_map_cta" title="Map of {$community.name}">View Map</a></li>
	{/if}
</ul>

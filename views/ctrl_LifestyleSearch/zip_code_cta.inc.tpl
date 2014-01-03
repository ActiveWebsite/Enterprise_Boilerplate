<ul class="resultCTA row multi-columns-row">
	{if $community.community_rebrand_code}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_rebrand_code}"><i class="icon icon-info-sign"></i> Community Information</a></li>
	{elseif $community.community_association}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_association.rebrand}"><i class="icon icon-info-sign"></i> Community Information</a></li>
	{else}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15">&nbsp;</li>
	{/if}
	<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a title="Properties for Sale" target="_blank" class="view_prop_sale_cta" href="{$ACTION_URLS.search}ZipCode/{$community.zip_code}"><i class="icon icon-home"></i> Properties for Sale</a></li>
	<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a rel="nofollow" href="http://www.onboardnavigator.com/1.5/webcontent/OBWC_Results.aspx?&amp;AID={$site_owner_onboard_id}&amp;State={$community.state_abbr}&amp;Zip={$community.zip_code}&amp;DataType=1" target="_blank" class="view_data_stats_cta fancybox iframe fancy-width-700 fancy-height-600" title="Detailed Data &amp; Stats For {$community.name}"><i class="icon icon-signal"></i> Detailed Data &amp; Stats</a></li>
	{if $getPropertiesWithMap}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a href="#{$community.id}:ZipCode:{$community.zip_code}:30:0" class="view_map_cta" title="Map of {$community.name}"><i class="icon icon-map-marker"></i> View Map and Nearby Properties</a></li>
	{else}
		<li class="col-sm-6 col-md-6 col-lg-6 margin-bottom-15"><a href="#{$community.id}:ZipCode:{$community.zip_code}:30:0" class="view_map_cta" title="Map of {$community.name}"><i class="icon icon-map-marker"></i> View Map</a></li>
	{/if}
</ul>
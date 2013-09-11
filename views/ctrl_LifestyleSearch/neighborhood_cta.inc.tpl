<ul class="row resultCTA">
	{if $community.community_rebrand_code}
		<li class="col-xs-6 margin-bottom-10"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_rebrand_code}">Community Information</a></li>
	{elseif $community.community_association}
		<li class="col-xs-6 margin-bottom-10"><a title="Community Information" target="_blank" class="view_community_info_cta" href="{$community_alias}{$community.community_association.rebrand}">Community Information</a></li>
	{else}
		<li class="col-xs-6 margin-bottom-10">&nbsp;</li>
	{/if}
	{* old way to get results by hood name 
	{if $community.neighborhood_info.hood_name}
		<li class="col-xs-6 margin-bottom-10"><a title="Properties for Sale" target="_blank" class="view_prop_sale_cta" href="{$ACTION_URLS.search}{if $community.neighborhood_info.market_name}/City/{$community.neighborhood_info.market_name|lower|capitalize}{/if}/Subdivision/{$community.neighborhood_info.hood_name}">Properties for Sale</a></li>
	{/if}
	*}
	<li class="col-xs-6 margin-bottom-10"><a title="Nearby Properties for Sale" target="_blank" class="view_prop_sale_cta" href="{$ACTION_URLS.search}Distance/{$community.geo_center_latitude},{$community.geo_center_longitude},5/orderby/geodistance">Nearby Properties for Sale</a></li>
	{if $community.neighborhood_info && isset($community.neighborhood_info.hood_name) && isset($community.neighborhood_info.market_name)}
		<li class="col-xs-6 margin-bottom-10">
			<a rel="nofollow" href="http://www.onboardnavigator.com/1.5/webcontent/OBWC_Results.aspx?&amp;AID={$site_owner_onboard_id}&amp;State={$community.state_abbr}&amp;Market={$community.neighborhood_info.market_name|upper}&amp;NHood={$community.neighborhood_info.hood_name|upper}&amp;DataType=1" target="_blank" class="view_data_stats_cta fancybox iframe fancy-width-700 fancy-height-600" data-fancybox-type="iframe" data-fancybox-width="700" data-fancybox-height="600" title="Detailed Data &amp; Stats For {$community.neighborhood_info.hood_name|lower|capitalize}{$cityStateFormat}{$community.neighborhood_info.market_name|lower|capitalize}, {$community.state_abbr}">Detailed Data &amp; Stats</a></li>
	{else}
		<li class="col-xs-6 margin-bottom-10">
			<a rel="nofollow" href="http://www.onboardnavigator.com/1.5/webcontent/OBWC_Results.aspx?&amp;AID={$site_owner_onboard_id}&amp;State={$community.state_abbr}&amp;Market={$community.neighborhood_info.market_name|upper}&amp;NHood={$community.neighborhood_info.hood_name|upper}&amp;DataType=1" target="_blank" class="view_data_stats_cta fancybox iframe fancy-width-700 fancy-height-600" data-fancybox-type="iframe" data-fancybox-width="700" data-fancybox-height="600" title="Detailed Data &amp; Stats For {$community.name}">Detailed Data &amp; Stats</a></li>
	{/if}
	{if $getPropertiesWithMap}
		<li class="col-xs-6 margin-bottom-10"><a href="#{$community.id}:Distance:{$community.geo_center_latitude}:{$community.geo_center_longitude}:5:20:0" class="view_map_cta" title="Map of {$community.name}">View Map and Nearby Properties</a></li>
	{else}
		<li class="col-xs-6 margin-bottom-10"><a href="#{$community.id}:Distance:{$community.geo_center_latitude}:{$community.geo_center_longitude}:5:20:0" class="view_map_cta" title="Map of {$community.name}">View Map</a></li>
	{/if}
</ul>
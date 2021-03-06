<div id="developments-list-page">
	<div class="page-header">
		<h1>Developments</h1>
	</div>
	<div id="developments-list-page-results-map"></div>
	<hr>
	<ul class="row">
		{foreach from=$developments item=development name=devList key=index}
			<li class="col-lg-12">
				<div class="row">
					<div class="col-sm-9 col-lg-9">
						<h2><span data-action="open-result-map-bubble" data-id="{$development.id}">{$smarty.foreach.devList.iteration}</span> <a href="/{$controller_alias}/{$development.rebrand}/" title="View more about {$development.name|clean_for_attribute}">{$development.name}</a></h2>
						<p>{$development.biography|strip_tags|truncate}</p>
					</div>
					<div class="col-sm-3 col-lg-3">
						{if $development.first_pic}
							<img src="{$development.first_pic.url}/crop/200,150" class="img-hd" data-hd-src="{$development.first_pic.url}/crop/400,300" alt="Photo of {$development.name|clean_for_attribute}">
						{/if}
					</div>
				</div>
				<hr>
			</li>
		{/foreach}
	</ul>
</div>
<footerargs>
<script src="https://maps.googleapis.com/maps/api/js?v={$smarty.google_map_version}&amp;client={$smarty.google_client_id}&amp;channel={$smarty.const.APP_ID}&amp;sensor=false"></script>
<script src="/js/buildlist.js?scripts=/js/mustache/mustache.min.js,/js/map_search/jquery.search_results_map.min.js"></script>
{literal}
<script type="text/html" id="developments-list-page-results-template">
	<div class="development-list-bubble">
		<h3><a href="{{url}}">{{title}}</a></h3>
		<p><a href="{{url}}">View More Info</a></p>
		<p>{{#photo}}<img src="{{photo}}/crop/60,60" alt="">{{/photo}}</p>
	</div>
</script>
{/literal}
{literal}
<script>
	var resultsPropertyMapObject = null;
	jQuery(document).ready(function($){
		// build out all the development data
		var points = [];
		{/literal}
		{if $developments}
			{foreach from=$developments item=development name=devResults key=index}
				points.push({literal}{{/literal}
				'id': {$development.id}, 
				'lat': {if $development.address.Lat_Long.value.Latitude}{$development.address.Lat_Long.value.Latitude}{else}0{/if}, 
				'lng': {if $development.address.Lat_Long.value.Longitude}{$development.address.Lat_Long.value.Longitude}{else}0{/if}, 
				'icon': '/images/system/map_pins/{$smarty.foreach.devResults.iteration}.png', 
				'title': '{$development.name|escape:'javascript'}', 
				'photo': '{$development.first_pic.url}', 
				'url': '/{$controller_alias}/{$development.rebrand}/'
				{literal}}{/literal});
			{/foreach}
		{/if}
		{literal}

		// build our plugin
		resultsPropertyMapObject = $('#developments-list-page-results-map').resultsPropertyMap({
			center_lat: {/literal}{if $site_owner_extended.address.Lat_Long.value.Latitude}{$site_owner_extended.address.Lat_Long.value.Latitude}{else}0{/if}{literal},
			center_long: {/literal}{if $site_owner_extended.address.Lat_Long.value.Longitude}{$site_owner_extended.address.Lat_Long.value.Longitude}{else}0{/if}{literal},
			property_list: points,
			property_list_template_id: '#developments-list-page-results-template'
		}).data('resultsPropertyMap');

		// make a view on map button work
		$('#developments-list-page [data-action="open-result-map-bubble"]').on('hover', function(e) {
			resultsPropertyMapObject.showBubble($(this).data('id'));
		});
	});
</script>
{/literal}
</footerargs>
<div id="office-index-page">
	<h1 class="page-heading">Offices</h1>
	<div id="office-results-map"></div>
	<hr>
	{if $entities}
		<ul class="row multi-columns-row">
			{foreach from=$entities item=office name=office_loop key=index}
				<li class="col-sm-6 col-lg-6 margin-bottom-30">
					<h2><span data-action="open-result-map-bubble" data-id="{$office.id}">{$smarty.foreach.office_loop.iteration}</span> {$office.name}</h2>
					<address>
						{$office.address.Street_Address.value}<br>
						{$office.address.City.value}{if $office.address.City.value && ($office.address.State.value || $office.address.Zip.value)},{/if} {$office.address.State.value} {$office.address.Zip.value}
					</address>
					<ul class="list-unstyled">
						{if $office.address.Direct_Phone.value}
							<li>Phone {$office.address.Direct_Phone.value}</li>
						{elseif $office.address.Office_Phone.value}
							<li>Phone {$office.address.Office_Phone.value}</li>
						{/if}
						{if $office.address.Fax_Phone.value}<li>Fax {$office.address.Fax_Phone.value}</li>{/if}
						{if $SITE_OWNER instanceof Company}<li><a href="{$ACTION_URLS.realtor}?office_id={$office.id}">Agents in this Office</a></li>{/if}
						<li><a class="fancybox" data-fancybox-type="iframe" data-fancybox-width="500" data-fancybox-height="650" title="Email This Office" target="_blank" rel="nofollow" href="/popup{$ACTION_URLS.contact}office/{$office.rebrand}">Email This Office</a></li>
						<li><a class="fancybox" data-fancybox-type="iframe" data-fancybox-width="900" data-fancybox-height="675" title="Driving Directions" target="_blank" rel="nofollow" href="/map_search/generic/directions/?action=directions&amp;to={$office.address.Street_Address.value|replace:' ':'%20'}%20{$office.address.City.value|replace:' ':'%20'},%20{$office.address.State.value}&amp;lat={$office.address.Lat_Long.value.Latitude}&amp;lng={$office.address.Lat_Long.value.Longitude}">Driving Directions</a></li>
					</ul>
				</li>
			{/foreach}
		</ul>
	{/if}
</div>
<footerargs>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="/js/buildlist.js?scripts=/js/mustache/mustache.min.js,/js/map_search/jquery.search_results_map.min.js"></script>
{literal}
<script type="text/template" id="office-map-bubble-template">
	<div class="office-map-bubble">
		<h3>{{title}}</h3>
		{{#first_pic}}<img src="{{first_pic}}/crop/140,125" alt="Office Photo">{{/first_pic}}
		<div class="office-bubble-info">
			<address>
				{{address}}<br>
				{{city}}, {{state}} {{zip}}
			</address>
			<ul class="list-unstyled">
				{{#direct_phone}}<li><span>Phone</span> <strong>{{direct_phone}}</strong></li>{{/direct_phone}}
				{{#office_phone}}<li><span>Phone</span> <strong>{{office_phone}}</strong></li>{{/office_phone}}
				{{#fax_phone}}<li><span>Phone</span> <strong>{{fax_phone}}</strong></li>{{/fax_phone}}
				{/literal}{if $SITE_OWNER instanceof Company}{literal}<li><a href="{/literal}{$ACTION_URLS.realtor}{literal}?office_id={{id}}">Agents in this Office</a></li>{/literal}{/if}{literal}
				<li><a class="fancybox" data-fancybox-type="iframe" data-fancybox-width="500" data-fancybox-height="650" title="Email This Office" target="_blank" rel="nofollow" href="/popup{/literal}{$ACTION_URLS.contact}{literal}office/{{rebrand}}">Email This Office</a></li>
				<li><a class="fancybox" data-fancybox-type="iframe" data-fancybox-width="900" data-fancybox-height="675" title="Driving Directions" target="_blank" rel="nofollow" href="/map_search/generic/directions/?action=directions&amp;to={{full_address}}&amp;lat={{lat}}&amp;lng={{lng}}">Driving Directions</a></li>
			</ul>
		</div>
	</div>
</script>
{/literal}
{literal}
<script>
	var resultsPropertyMapObject;
	jQuery(document).ready(function($){
		// build out all the property data
		var points = [];
		{/literal}
		{if $entities}
			{foreach from=$entities item=office name=office_loop}
				points.push({literal}{{/literal}
					'id': '{$office.id}',
					'lat': {if $office.address.Lat_Long.value.Latitude}{$office.address.Lat_Long.value.Latitude}{else}0{/if},
					'lng': {if $office.address.Lat_Long.value.Longitude}{$office.address.Lat_Long.value.Longitude}{else}0{/if},
					'icon': '/images/system/map_pins/{$smarty.foreach.office_loop.iteration}.png',
					'title': '{$office.name|escape:"javascript"}',
					'address': '{$office.address.Street_Address.value|escape:"javascript"}',
					'city': '{$office.address.City.value|escape:"javascript"}',
					'state': '{$office.address.State.value|escape:"javascript"}',
					'zip': '{$office.address.Zip.value}',
					'first_pic': '{$office.first_pic.url}',
					'direct_phone': '{$office.address.Direct_Phone.value}',
					'office_phone': '{$office.address.Office_Phone.value}',
					'fax_phone': '{$office.address.Fax_Phone.value}'
				{literal}}{/literal});
			{/foreach}
		{/if}
		{literal}

		// build our map plugin
		resultsPropertyMapObject = $('#office-results-map').resultsPropertyMap({
			hide_if_no_results: false,
			center_lat: {/literal}{if $site_owner_extended.address.Lat_Long.value.Latitude}{$site_owner_extended.address.Lat_Long.value.Latitude}{else}0{/if}{literal},
			center_long: {/literal}{if $site_owner_extended.address.Lat_Long.value.Longitude}{$site_owner_extended.address.Lat_Long.value.Longitude}{else}0{/if}{literal},
			property_list: points,
			property_list_template_id: '#office-map-bubble-template'
		}).data('resultsPropertyMap');

		// make a the numbers click open the map info window
		$('#office-index-page [data-action="open-result-map-bubble"]').on('hover', function(e) {
			resultsPropertyMapObject.showBubble($(this).data('id'));
		});
	});
</script>
{/literal}
</footerargs>
{literal}
<script>
	jQuery(document).ready(function($) {
		//build the polygon/radius map for searches if it's available
		$('#radius-polygon-widget').polygonRadiusMap({
			map_zoom: 14,
			maxPoints:5,
			latitude: {/literal}{$site_owner_extended.address.Lat_Long.value.Latitude}{literal},
			longitude: {/literal}{$site_owner_extended.address.Lat_Long.value.Longitude}{literal}
		});
	});
</script>
{/literal}	
{assign var="wkt_str" value=""}
{foreach from=$search_dict.boundaries item=bnd name=boundloop}
	{assign var="wkt_str" value=$wkt_str|cat:$bnd.value}
	{if $smarty.foreach.boundloop.last eq false}
		{assign var="wkt_str" value=$wkt_str|cat:"|"}
	{/if}
{/foreach}
<div id="radius-polygon-widget" class="clearfix">
	<h2>Polygon/Radius Search</h2>
	<div id="radius-polygon-widget-left-column">
		<div id="radius-polygon-widget-map"></div>
		<p class="radius-polygon-widget-polygon-help">{* you can put extra help stuff here *}</p>
		<p class="radius-polygon-widget-radius-help">{* you can put extra help stuff here *}</p>
	</div>
	<div id="radius-polygon-widget-right-column">
		<div id="radius-polygon-widget-tabs" class="tabClass" data-bootstrap-mode="true">
			<ul class="nav nav-tabs tab_triggers">
				<li class="active"><a href="#radius-polygon-widget-polygon-tab" title="Polygon Tab">Polygon</a></li>
				<li><a href="#radius-polygon-widget-radius-tab" title="Radius Tab">Radius</a></li>
			</ul>
			<div class="tab-content">
				<div id="radius-polygon-widget-polygon-tab" class="tab-pane active">
					<h3>Create A New Polygon Search</h3>
					<h4>Directions</h4>
					<ol>
						<li>Click on the "Start New Polygon" button.</li>
						<li>Zoom in to your desired location using the plus and minus buttons on the left of the map (optional).</li>										
						<li>Click on the map to indicate the starting point of your polygon.</li>							
						<li>Continue clicking points on the map to draw a polygon around your desired area.</li>
						<li>Clicking on an existing point in your polygon will remove that point.</li>
						<li>You can drag a point around once you have created it.</li>
						<li>You may only use a maximum of 5 points for your polygon.</li>
						<li>Click the "Delete Polygon" button to start over or remove the polygon.</li>
					</ol>
					<div class="field">
						<input type="hidden" name="wkt" id="wkt" value="{$wkt_str}">
						<input type="button" id="new_polygon_button" value="Start New Polygon">	
						<input type="button" id="delete_polygon_button" value="Delete Polygon">
					</div>
				</div>
				<div id="radius-polygon-widget-radius-tab" class="tab-pane">
					<h3>Create A New Radius Search</h3>
					<h4>Directions</h4>
					<ol>
						<li>Type in an address.</li>
						<li>Select a radius from the select box.</li>
						<li>Click the "Find Address" button.</li>
						<li>Right clicking the map will move the circle.</li>
						<li>Dragging the marker will also move the cricle.</li>
						<li>You may also right click any point on the map to create a circle instead of typing in an address.</li>
					</ol>
					<div class="field">
						<label class="bold block">Street Address City, State Zip</label>
						<input id="address_search" name="address_search" value="" type="text" title="Street Address City, State Zip" placeholder="Enter Street Address City, State Zip">
					</div>
					<div class="field">
						<label class="bold block">Radius</label>
						<input type="hidden" name="Distance[]" id="radius_lat" value="{if $distance_form.latitude}{$distance_form.latitude}{elseif $search_dict.terms.Distance.csv}{$search_dict.terms.Distance.csv.0}{/if}">
						<input type="hidden" name="Distance[]" id="radius_long" value="{if $distance_form.longitude}{$distance_form.longitude}{elseif $search_dict.terms.Distance.csv}{$search_dict.terms.Distance.csv.1}{/if}">
						<select id="radius" name="Distance[]">
							<option value="">Select Distance</option>
							{if $search_config.radius_values instanceof CompanySearchConfig}
								{foreach from=$search_config.radius_values->getValues() item=name key=value}
									<option value="{$value}"{if $distance_form.radius == $value || ($search_dict.terms.Distance.csv && $search_dict.terms.Distance.csv.2 == $value)} selected="selected"{/if}>{$name}</option>
								{/foreach}
							{/if}
						</select>
					</div>
					<div class="field">
						<input id="geocode" type="button" class="btn" value="Find Address">
						<input id="remove_circle" disabled="disabled" class="btn" type="button" value="Delete Circle">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
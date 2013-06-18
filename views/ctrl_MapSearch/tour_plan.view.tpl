{*
	THIS DIV CONTAINS ALL THE DATA THAT WILL BE CONTAINED WITHIN THE BUBBLE ON THE MAP
	DO NOT MESS UP THE OUTER ID OF "marker_label_{$prop.company_property_id}"
	DO NOT MESS UP THE OUTER CLASS OF "tourMapInfoBubble"
*}
<div style="display: none;">
	{foreach from=$tour_properties item=prop name=tableloop}
		<div class="tourMapInfoBubble" id="marker_label_{$prop.company_property_id}">
			{if $prop.photos && $prop.photos.0}
				<img src="{$prop.photos.0}/crop/97,73/" alt="photo of {$prop.streetAddress}">
			{/if}
			<p>
				<a title="{$prop.company_property_id}" class="bold" href="/property/{$prop.company_property_id}">{if $prop.streetAddress}{$prop.streetAddress}{elseif $prop.city || $prop.state}{if $prop.city}{$prop.city},{/if} {if $prop.state}{$prop.state}{/if}{else}Address Not Available{/if}</a>
				<span class="block">{if $prop.city}{$prop.city},{/if} {if $prop.state}{$prop.state}{/if}</span>
				<span class="block">
					{if $prop.bedrooms_total && $prop.bedrooms_total > 0}
						{$prop.bedrooms_total|clean_bed_bath} Bed
					{/if}
					{if ($prop.bedrooms_total && $prop.bedrooms_total > 0) && ($prop.bathrooms_total && $prop.bathrooms_total > 0)}
						|
					{/if}
					{if $prop.bathrooms_total && $prop.bathrooms_total > 0}
						{$prop.bathrooms_total|clean_bed_bath} Bath |
					{/if}
					{if $prop.list_price}
						{$prop.list_price}
					{/if}
				</span>
				{if $prop.open_house_info}
					{foreach from=$prop.open_house_info item=open_house key=index}
						{if $index == 0}
							{if $view_titles.open_blurb != ''}
								<span class="openHouseBlurb">{$view_titles.open_blurb}</span>
							{/if}
							<span class="openHouseTimes block bold">{$open_house.start_datetime|date_format:"%A, %B %e"}</span>
							<span class="openHouseTimes block bold">{$open_house.start_datetime|date_format:"%l:%M"} - {$open_house.end_datetime|date_format:"%l:%M%P"}</span>
						{/if}	
					{/foreach}
				{/if}
			</p>
		</div>
	{/foreach}
</div>
{*
	THIS DIV CONTAINS ALL THE DATA THAT WILL BE IN THE PROPERTY DIRECTIONS
	DO NOT MESS UP THE OUTER ID OF "directions_display_{$prop.company_property_id}"
*}
<div style="display: none;">
	{foreach from=$tour_properties item=prop name=tableloop}
		{if $prop.latitude && $prop.latitude != 0 && $prop.latitude != '' && $prop.longitude && $prop.longitude != 0 && $prop.longitude != ''}
			<span id="directions_display_{$prop.company_property_id}">
				{if $prop.photos && $prop.photos.0}
					<img src="{$prop.photos.0}/crop/97,73/" width="97" height="73" alt="photo of {$prop.streetAddress}">
				{/if}
				<span class="dirAddressMeta">
					<span class="dirAddress">{if $prop.streetAddress}{$prop.streetAddress}{elseif $prop.city || $prop.state}{if $prop.city}{$prop.city},{/if} {if $prop.state}{$prop.state}{/if}{else}Address Not Available{/if}</span>
					<span class="dirCityState">{if $prop.city}{$prop.city},{/if} {if $prop.state}{$prop.state}{/if}</span>
					<span class="dirMeta">
						{if $prop.bedrooms_total && $prop.bedrooms_total > 0}
							{$prop.bedrooms_total|clean_bed_bath} Bed
						{/if}
						{if ($prop.bedrooms_total && $prop.bedrooms_total > 0) && ($prop.bathrooms_total && $prop.bathrooms_total > 0)}
							|
						{/if}
						{if $prop.bathrooms_total && $prop.bathrooms_total > 0}
							{$prop.bathrooms_total|clean_bed_bath} Bath |
						{/if}
						{if $prop.list_price}
							{$prop.list_price}
						{/if}
					</span>
					{if $prop.open_house_info}
						{foreach from=$prop.open_house_info item=open_house key=index}
							{if $index == 0}
								{if $view_titles.open_blurb != ''}
									<span class="openHouseBlurb">{$view_titles.open_blurb}</span>
								{/if}
								<span class="openHouseTimes">{$open_house.start_datetime|date_format:"%A, %B %e"}</span>
								<span class="openHouseTimes">{$open_house.start_datetime|date_format:"%l:%M"} - {$open_house.end_datetime|date_format:"%l:%M%P"}</span>
							{/if}	
						{/foreach}
					{/if}
				</span>
			</span>
		{/if}
	{/foreach}
</div>
<div class="row-fluid">
	<div class="span4 hidden-print" id="tourLeftColumn">
		{*
			TO CHANGE VIEW TITLES CREATE AN OVERRIDE OF THE FUNCTION tour_custom_titles() IN BASE_ctrl_MapSearch.action.php
		*}
		<h2>{$view_titles.left_column_title}</h2>
		<div id="currentTourPropertyWrapper">
			<form action="/map_search/" method="post" id="tourOrderForm">
				<ul class="unstyled" id="sortableTourProperties">
					{*
						LIST OF ALL PROPS IN TOUR
						DO NOT MESS UP UNORDERED LIST ID OF "sortableTourProperties"
						DO NOT MESS UP THE CLICK EVENTS FOR THE IMAGE OR THE REMOVE BUTTON.
						THE SELECT MUST BE HERE TOO.
					*}
					{foreach from=$tour_properties item=prop name=tableloop}
						{if $prop.latitude && $prop.latitude != 0 && $prop.latitude != '' && $prop.longitude && $prop.longitude != 0 && $prop.longitude != ''}
							<li class="clearfix tourPropertyWrapper" id="tour_prop_{$prop.company_property_id}">
								<div class="row-fluid">
									<div class="span2">
										<select name="TourOrder" class="span12">
											{foreach from=$tour_properties item=propfoo name=selectloop }
												<option value="{$smarty.foreach.selectloop.index}" {if $smarty.foreach.tableloop.index==$smarty.foreach.selectloop.index}selected="selected"{/if} >{$smarty.foreach.selectloop.iteration}</option>
											{/foreach}
										</select>
									</div>
									<div class="span10">
										<div class="row-fluid">
											<div class="span3">
												{if $prop.photos && $prop.photos.0}
													<a href="#{$prop.company_property_id}" class="open-property-bubble"><img src="{$prop.photos.0}/crop/97,73/" alt="photo of {$prop.streetAddress}"></a>
												{/if}
											</div>
											<div class="span8">
												<p>
													<a title="{$prop.company_property_id}" class="bold" href="/property/{$prop.company_property_id}">{if $prop.streetAddress}{$prop.streetAddress}{elseif $prop.city || $prop.state}{if $prop.city}{$prop.city},{/if} {if $prop.state}{$prop.state}{/if}{else}Address Not Available{/if}</a>
													<span class="block">{if $prop.city}{$prop.city},{/if} {if $prop.state}{$prop.state}{/if}</span>
													<span class="block">
														{if $prop.bedrooms_total && $prop.bedrooms_total > 0}
															{$prop.bedrooms_total|clean_bed_bath} Bed
														{/if}
														{if ($prop.bedrooms_total && $prop.bedrooms_total > 0) && ($prop.bathrooms_total && $prop.bathrooms_total > 0)}
															|
														{/if}
														{if $prop.bathrooms_total && $prop.bathrooms_total > 0}
															{$prop.bathrooms_total|clean_bed_bath} Bath |
														{/if}
														{if $prop.list_price}
															{$prop.list_price}
														{/if}
													</span>
													{if $prop.open_house_info}
														{foreach from=$prop.open_house_info item=open_house key=index}
															{if $index == 0}
																{if $view_titles.open_blurb != ''}
																	<span class="openHouseBlurb">{$view_titles.open_blurb}</span>
																{/if}
																<span class="block bold">{$open_house.start_datetime|date_format:"%a, %b %e,"} {$open_house.start_datetime|date_format:"%l:%M"} - {$open_house.end_datetime|date_format:"%l:%M%P"}</span>
															{/if}	
														{/foreach}
													{/if}													
												</p>
											</div>
											<div class="span1">
												<a href="#{$prop.company_property_id}" class="removeFromTourLink" title="Remove"><i class="icon-remove"></i></a>
											</div>
										</div>
									</div>
								</div>
							</li>
						{/if}
					{/foreach}
				</ul>
			</form>
		</div>
	</div>
	<div class="span8" id="tourRightColumn">
		{* PRINT PAGE HEADER *}
		{*
			TO CHANGE VIEW TITLES CREATE AN OVERRIDE OF THE FUNCTION tour_custom_titles() IN BASE_ctrl_MapSearch.action.php
		*}
		<h2 id="printViewHeader" class="visible-print">{$view_titles.print_title}</h2>
		{* END PRINT PAGE HEADER *}

		<div id="tourDirectionsEntry" class="hidden-print">
			<div id="tourActions" class="text-right">
				<button class="printButtonTrigger">Print</button>
				{if $show_email_button}
					<a href="{$ACTION_URLS.local_root}/email_tour" class="tour-email-button emailTourButton" data-fancybox-width="490" data-fancybox-height="650" data-fancybox-type="iframe" rel="nofollow" target="_blank">Email</a>
				{/if}
			</div>
			{*
				TO CHANGE VIEW TITLES CREATE AN OVERRIDE OF THE FUNCTION tour_custom_titles() IN BASE_ctrl_MapSearch.action.php
			*}
			<h2>{$view_titles.right_column_title}</h2>
			{*
				FORM FOR THE DIRECTIONS
				DO NOT MESS WITH THE ID OF THE TRANSPORTATION MODE SELECT BOX
				DO NOT MESS WITH THE ID FOR THE OPTIMIZE ROUTE CHECKBOX
				DO NOT MESS WITH THE  ID OR CLASS NAME OF THE GET DIRECTIONS BUTTON
				DO NOT MESS WITH THIS FORM'S ACTION OR ONSUBMIT ACTION OR ITS METHOD OR ITS ID
			*}
			<form id="tour_map_start_form" action="/map_search/" method="post" onsubmit="return false;">
				<fieldset class="row-fluid">
					<div class="span4">
						<label class="bold block">Starting Address</label>
						<input class="span12" type="text" placeholder="Enter Start Address" value="{$smarty.request.StartingAddress}" name="StartingAddress" id="tour_start_form_address"> {* SAMPLE ADDRESS 2173 NE Broadway Portland, OR 97232 *}
					</div>
					<div class="span4">
						<label class="bold block">Transportation</label>
						<select name="TransportationMode" title="Choose your transportation mode" class="span12" id="dir_travel_mode">
							<option value="DRIVING" selected>Driving</option>
							<option value="WALKING">Walking</option>
							<option value="BICYCLING">Bicycling</option>
						</select>
					</div>
					<div id="fastRouteWrapper" class="span2">
						<label>&nbsp;</label>
						<label class="checkbox" title="give me the best route">
							<input type="checkbox" title="give me the best route" name="OptimizeRoute" value="" id="optimize_route">
							Fastest Route
						</label>			
					</div>
					<div class="span2 submitField">
						<label>&nbsp;</label>
						<input type="submit" title="Get Directions" class="btn-block getDirectionsButton" value="Get Directions">
					</div>
				</fieldset>
			</form>
		</div>
		{* DIV#tour_map_start_status IS PLACE HOLDER FOR ANY ERRORS THAT MAY OCCURE *}
		<div id="tour_map_start_status" class="alert alert-block alert-error hidden-print" style="display:none;"></div>
		{* DIV#tour_map_div IS PLACE HOLDER FOR THE MAP  *}
		<div id="tour_map_div"></div>
		{* DIV#tour_map_directions IS THE PLACE HOLDER FOR THE DIRECTIONS *}
		<div id="tour_map_directions" style="display:none;"></div>	
	</div>
</div>

<footerargs>
<script src="/js/jqueryui/components/drag_sort.min.js"></script>	
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="/js/map_search/jquery.tourPlan.min.js"></script>
<script>
	var tourPlanObj;
	{literal}
	jQuery(document).ready(function($) {
		tourPlanObj = $('#currentTourPropertyWrapper').tourplan({
			mediaServer: '{/literal}{$media_server_url}{literal}',
			defaultLat: '{/literal}{$site_owner_lat}{literal}',
			defaultLong: '{/literal}{$site_owner_long}{literal}'		
		}).data('tourplan');
		{/literal}
		//foreach through properties here and add them to the map.
		{foreach from=$tour_properties item=prop name=maploop}
			{if $prop.latitude && $prop.latitude != 0 && $prop.latitude != '' && $prop.longitude && $prop.longitude != 0 && $prop.longitude != ''}
				tourPlanObj.addMarker({$prop.latitude}, {$prop.longitude}, "{$prop.title}", "{$smarty.foreach.maploop.iteration}", "marker_label_{$prop.company_property_id}", "{$prop.company_property_id}");
			{/if}
		{/foreach}
		{literal}
	});
	{/literal}
</script>
</footerargs>
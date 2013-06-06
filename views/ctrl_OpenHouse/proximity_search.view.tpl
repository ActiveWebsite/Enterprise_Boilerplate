<div id="proximitySearchWrapper">
	<h1 class="page-heading">Proximity Search</h1>
	<p>
		Enter an address or choose from our list of pre-defined starting points. Next, choose your search radius and click "Search". 
		You can then further narrow your results using the available filters. When you are ready to see the results, click the "Results" button.
	</p>
	<div id="proximity-search">
        <div class="proximity-search-form">
            <form action="{$ACTION_URLS.search}url_search" method="post">
				<input type="hidden" name="Distance[]" class="proximity-search-lat" value="{$distance_form.latitude}">
				<input type="hidden" name="Distance[]" class="proximity-search-long" value="{$distance_form.longitude}">
				<input type="hidden" name="RadiusAddressPersistence" class="proximity-search-persistence" value="">
				<fieldset class="proximity-search-primary-filters">
					<h2>Choose Your Starting Point</h2>
					<div class="row-fluid">
						<div class="span4">
							<label class="block" for="radius_address_field">Address, Landmark or Point of Interest</label>
							<input type="text" name="address_search[]" id="radius_address_field" title="Enter Address, Landmark, or Point of Interest" value="" class="proximity-search-starting-point-input span12">
						</div>
						<div class="span4">
							<label class="block" for="radius_starting_point_field">Or Choose a Pre-Defined Starting Point</label>
							<select name="address_search[]" id="radius_starting_point_field" class="proximity-search-starting-point-select span12">
								<option value="">Choose Location</option>
								{if $geo_array}
									{foreach from=$geo_array item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="span2">
							<label class="block" for="radius_field">Radius</label>
							<select name="Distance[]" id="radius_field" class="proximity-search-radius span12">
								{if $search_config.radius_values instanceof CompanySearchConfig}
									{foreach from=$search_config.radius_values->getValues() item=name key=value}
										<option value="{$value}">{$name|replace:"Within":""}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="span2">
							<label class="block">&nbsp;</label>
							<input type="submit" class="proximity-search-find-address btn btn-block" value="Search">
						</div>
					</div>	
				</fieldset>
				<fieldset class="proximity-search-secondary-filters" style="display:none;">
					<h2>Refine Search</h2>
					<div class="row-fluid">
						<div class="span4">
							<label class="block" for="radius_min_price">Price Range</label>
							<div class="row-fluid">
								<div class="span5-half">
									<select name="Min_Price" class="span12" id="radius_min_price">
										{if $search_config.min_price instanceof CompanySearchConfig}
											{foreach from=$search_config.min_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
								<div class="span1">
									<span class="to-spacer">to</span>
								</div>
								<div class="span5-half">
									<select name="Max_Price" class="span12" id="radius_max_price">
										{if $search_config.max_price instanceof CompanySearchConfig}
											{foreach from=$search_config.max_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
							</div>
						</div>
						<div class="span3">
							<label class="block" for="Bedrooms">Beds</label>
							<select name="MinBeds" id="radius_bedrooms" class="span12">
								{if $search_config.bedrooms instanceof CompanySearchConfig}
									{foreach from=$search_config.bedrooms->getValues() item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="span3">
							<label class="block" for="Bathrooms">Baths</label>
							<select name="Bathrooms" id="radius_bathrooms" class="span12">
								{if $search_config.bathrooms instanceof CompanySearchConfig}
									{foreach from=$search_config.bathrooms->getValues() item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="span2">							
							<label class="block">&nbsp;</label>
							<input type="submit" class="btn btn-block" value="Results">
						</div>
					</div>
					<div class="proximity-search-result-count"></div>
				</fieldset>
            </form>
        </div>
        <div class="proximity-search-map"></div>
    </div>
</div>
<footerargs>
    <script src="https://maps.google.com/maps/api/js?sensor=false"></script>
	<script src="/js/map_search/radius_search/jquery.proximity-search.min.js"></script>
    <script>
		{literal}
		jQuery(document).ready(function($) {
			$('#proximity-search').proximitySearch({
				map_zoom: {/literal}{$site_owner_zoom}{literal},
				latitude: {/literal}{$site_owner_lat}{literal},
				longitude: {/literal}{$site_owner_long}{literal}
			});			
		});
		{/literal}
	</script>
</footerargs>
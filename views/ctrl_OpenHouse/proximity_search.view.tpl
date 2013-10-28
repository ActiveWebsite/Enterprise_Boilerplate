<div id="proximitySearchWrapper">
	<div class="page-header">
		<h1>Proximity Search</h1>
	</div>
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
					<div class="row">
						<div class="col-sm-4 margin-bottom-15">
							<label class="block" for="radius_address_field">Address, Landmark or Point of Interest</label>
							<input type="text" name="address_search[]" id="radius_address_field" placeholder="Address, Landmark, or Point of Interest" value="" class="form-control proximity-search-starting-point-input">
						</div>
						<div class="col-sm-4 margin-bottom-15">
							<label class="block" for="radius_starting_point_field">Or Choose a Pre-Defined Starting Point</label>
							<select name="address_search[]" id="radius_starting_point_field" class="form-control proximity-search-starting-point-select">
								<option value="">Choose Location</option>
								{if $geo_array}
									{foreach from=$geo_array item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="col-sm-2 margin-bottom-15">
							<label class="block" for="radius_field">Radius</label>
							<select name="Distance[]" id="radius_field" class="form-control proximity-search-radius">
								{if $search_config.radius_values instanceof CompanySearchConfig}
									{foreach from=$search_config.radius_values->getValues() item=name key=value}
										<option value="{$value}">{$name|replace:"Within":""}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="col-sm-2 margin-bottom-15">
							<label class="block">&nbsp;</label>
							<input type="submit" class="proximity-search-find-address btn btn-primary btn-block" value="Search">
						</div>
					</div>	
				</fieldset>
				<fieldset class="proximity-search-secondary-filters" style="display:none;">
					<h2>Refine Search</h2>
					<div class="row">
						<div class="col-sm-4">
							<label class="block" for="radius_min_price">Price Range</label>
							<div class="row">
								<div class="col-sm-6 margin-bottom-15">
									<select class="form-control" name="Min_Price" id="radius_min_price">
										{if $search_config.min_price instanceof CompanySearchConfig}
											{foreach from=$search_config.min_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
								<div class="to-spacer-gutter margin-bottom-15">to</div>
								<div class="col-sm-6 margin-bottom-15">
									<select class="form-control" name="Max_Price" id="radius_max_price">
										{if $search_config.max_price instanceof CompanySearchConfig}
											{foreach from=$search_config.max_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-3 margin-bottom-15">
							<label class="block" for="Bedrooms">Beds</label>
							<select class="form-control" name="MinBeds" id="radius_bedrooms">
								{if $search_config.bedrooms instanceof CompanySearchConfig}
									{foreach from=$search_config.bedrooms->getValues() item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="col-sm-3 margin-bottom-15">
							<label class="block" for="Bathrooms">Baths</label>
							<select class="form-control" name="Bathrooms" id="radius_bathrooms">
								{if $search_config.bathrooms instanceof CompanySearchConfig}
									{foreach from=$search_config.bathrooms->getValues() item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="col-cm-2 margin-bottom-15">							
							<label class="block">&nbsp;</label>
							<input type="submit" class="btn btn-primary btn-block" value="Results">
						</div>
					</div>
					<div class="proximity-search-result-count"></div>
				</fieldset>
            </form>
        </div>
        <div class="proximity-search-map margin-top-30"></div>
    </div>
</div>
<footerargs>
    <script src="https://maps.google.com/maps/api/js?v=3.13&amp;sensor=false"></script>
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
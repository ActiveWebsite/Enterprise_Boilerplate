<div id="open-house-search">
	<div class="page-header">
		<h1>Open House Search</h1>
	</div>
	<form method="post" action="/search/url_search">
		<input type="hidden" name="open_house" value="on">
		<ul class="row">
			{if $custom_configs.today == "Sunday"}
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}">
							<input title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$custom_configs.sun_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}">
							{$custom_configs.sun_time|date_format:'%a, %b %e'}
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="All Dates">
							<input checked="checked" name="from" title="All Dates" type="radio" value="" />
							All Upcoming Dates
						</label>
					</div>
				</li>
			{elseif $custom_configs.today == "Saturday"}
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}">
							<input name="from" title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sat_time|date_format:'%Y-%m-%d'}" />
							{$custom_configs.sat_time|date_format:'%a, %b %e'}
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}">
							<input title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$custom_configs.sun_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
							{$custom_configs.sun_time|date_format:'%a, %b %e'}
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses for this weekend">
							<input title="Show Open Houses for this weekend" name="from" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
							Both Days
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show All Upcoming Open Houses">
							<input checked="checked" title="Show All Upcoming Open Houses" name="from" type="radio" value="" />
							All Upcoming Dates
						</label>
					</div>
				</li>
			{else}
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}">
							<input name="from" title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sat_time|date_format:'%Y-%m-%d'}" />
							{$custom_configs.sat_time|date_format:'%a, %b %e'}
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}">
							<input title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$custom_configs.sun_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
							{$custom_configs.sun_time|date_format:'%a, %b %e'}
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show Open Houses for this weekend">
							<input title="Show Open Houses for this weekend" name="from" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
							Both Days
						</label>
					</div>
				</li>
				<li class="col-sm-3 margin-bottom-15">
					<div class="radio">
						<label title="Show All Upcoming Open Houses">
							<input checked="checked" title="Show All Upcoming Open Houses" name="from" type="radio" value="" />
							All Upcoming Dates
						</label>
					</div>
				</li>
			{/if}
		</ul>
		<div class="row">
			<div class="col-sm-6">
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
		</div>
		<div class="text-right">
			<input type="submit" class="btn btn-primary" value="Search" title="Show Results">
		</div>
	</form>
</div>

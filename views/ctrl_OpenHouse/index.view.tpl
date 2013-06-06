<div id="open-house-search">
	<h1 class="page-heading">Open House Search</h1>
	<form method="post" action="/search/url_search">
		<input type="hidden" name="open_house" value="on">
		<ul class="unstyled row-fluid">
			{if $custom_configs.today == "Sunday"}
				<li class="span3">
					<label class="radio" title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}">
						<input title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$custom_configs.sun_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}">
						{$custom_configs.sun_time|date_format:'%a, %b %e'}
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="All Dates">
						<input checked="checked" name="from" title="All Dates" type="radio" value="" />
						All Upcoming Dates
					</label>
				</li>
			{elseif $custom_configs.today == "Saturday"}
				<li class="span3">
					<label class="radio" title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}">
						<input name="from" title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sat_time|date_format:'%Y-%m-%d'}" />
						{$custom_configs.sat_time|date_format:'%a, %b %e'}
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}">
						<input title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$custom_configs.sun_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
						{$custom_configs.sun_time|date_format:'%a, %b %e'}
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="Show Open Houses for this weekend">
						<input title="Show Open Houses for this weekend" name="from" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
						Both Days
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="Show All Upcoming Open Houses">
						<input checked="checked" title="Show All Upcoming Open Houses" name="from" type="radio" value="" />
						All Upcoming Dates
					</label>
				</li>
			{else}
				<li class="span3">
					<label class="radio" title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}">
						<input name="from" title="Show Open Houses on {$custom_configs.sat_time|date_format:'%a, %b %e'}" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sat_time|date_format:'%Y-%m-%d'}" />
						{$custom_configs.sat_time|date_format:'%a, %b %e'}
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}">
						<input title="Show Open Houses on {$custom_configs.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$custom_configs.sun_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
						{$custom_configs.sun_time|date_format:'%a, %b %e'}
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="Show Open Houses for this weekend">
						<input title="Show Open Houses for this weekend" name="from" type="radio" value="{$custom_configs.sat_time|date_format:'%Y-%m-%d'}|{$custom_configs.sun_time|date_format:'%Y-%m-%d'}" />
						Both Days
					</label>
				</li>
				<li class="span3">
					<label class="radio" title="Show All Upcoming Open Houses">
						<input checked="checked" title="Show All Upcoming Open Houses" name="from" type="radio" value="" />
						All Upcoming Dates
					</label>
				</li>
			{/if}
		</ul>
		<div class="row-fluid">
			<div class="span6">
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
		</div>
		<div class="text-right">
			<input type="submit" class="btn" value="Search" title="Show Results">
		</div>
	</form>
</div>

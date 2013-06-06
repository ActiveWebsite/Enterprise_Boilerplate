<form action="{$ACTION_URLS.search}url_search/" class="quick-search-component margin-0">
	<h3>Quick Search</h3>
	<fieldset class="clearfix">
		<div class="row-fluid margin-bottom-10">
			<div class="span12">
				<input class="span12" id="qs_field_01" type="text" value="" placeholder="Address, Zip Code or MLS#" name="AddressAndLoc">
			</div>
		</div>
		<div class="row-fluid margin-bottom-10">
			<div class="span12">
				<label for="qs_field_02">Property Type</label>
				<select class="span12" id="qs_field_02" title="Select Property Type" name="Property_Type">
					{if $search_config.property_type instanceof CompanySearchConfig}
						{foreach from=$search_config.property_type->getValues() item=name key=value}
							<option value="{$value}">{$name}</option>
						{/foreach}
					{/if} 
				</select>   
			</div>
		</div>
		<div class="row-fluid margin-bottom-10">
			<div class="span5-half">
				<label for="qss-field-03">Price Range</label>
				<select id="qss-field-03" class="span12" name="Min_Price">
					{if $search_config.min_price instanceof CompanySearchConfig}
						{foreach from=$search_config.min_price->getValues() item=name key=value}
							<option value="{$value}">{$name}</option>
						{/foreach}
					{/if}    
				</select>
			</div>
			<div class="span1">
				<label>&nbsp;</label>
				<span class="to-spacer">to</span>
			</div>
			<div class="span5-half">
				<label>&nbsp;</label>
				<select class="span12" name="Max_Price">
					{if $search_config.max_price instanceof CompanySearchConfig}
						{foreach from=$search_config.max_price->getValues() item=name key=value}
							<option value="{$value}">{$name}</option>
						{/foreach}
					{/if}    
				</select>
			</div>
		</div>
		<div class="row-fluid margin-bottom-5">
			<div class="span6">
				<label for="qs_field_04">Beds</label>
				<select id="qs_field_04" class="span12" title="Select Bedrooms" name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}">{$name}</option>
						{/foreach}
					{/if}    
				</select>
			</div>
			<div class="span6">
				<label for="qs_field_05">Baths</label>
				<select id="qs_field_05" class="span12" title="Select Bathrooms" name="Bathrooms">
					{if $search_config.bathrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bathrooms->getValues() item=name key=value}
							<option value="{$value}">{$name}</option>
						{/foreach}
					{/if}    
				</select>
			</div>
		</div>
		<input type="submit" value="Search" class="btn pull-right">
	</fieldset>
</form>
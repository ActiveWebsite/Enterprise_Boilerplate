<div class="row-fluid">
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="sb_01">Select Box</label>
			<div class="controls">
				<select id="sb_01" class="span12" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
			</div>
		</div>
	</div>
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="sb_02">Select Box</label>
			<div class="controls">
				<select id="sb_01" class="span12" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
			</div>
		</div>
	</div>	
</div>

<div class="row-fluid">
	<div class="span3">
		<div class="control-group">
			<label class="control-label" for="sb_01">Select Box</label>
			<div class="controls">
				<select id="sb_01" class="span12" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
			</div>
		</div>
	</div>
	<div class="span3">
		<div class="control-group">
			<label class="control-label" for="sb_02">Select Box</label>
			<div class="controls">
				<select id="sb_01" class="span12" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
			</div>
		</div>
	</div>	
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="sb_02">Select Box</label>
			<div class="controls">
				<select id="sb_01" class="span12" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
			</div>
		</div>
	</div>	
</div>

<div class="row-fluid">
	<div class="span3">
		<div class="control-group">
			<label class="control-label" for="sb_01">Input Box</label>
			<div class="controls">
				<input type="text" id="sb_01" class="span12" title="Select " name="Bedrooms">
			</div>
		</div>
	</div>
	<div class="span3">
		<div class="control-group">
			<label class="control-label" for="sb_02">Input Box</label>
			<div class="controls">
				<input type="text" id="sb_01" class="span12" title="Select " name="Bedrooms">
			</div>
		</div>
	</div>	
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="sb_02">Input Box</label>
			<div class="controls">
				<input type="text" id="sb_01" class="span12" title="Select " name="Bedrooms">
			</div>
		</div>
	</div>	
</div>

<div class="row-fluid">
    <div class="span6">
        <div class="control-group">
            <label class="control-label" for="asf-bedrooms">Multi Select</label>
            <div class="controls">
                <select id="asf-bedrooms" title="Select Multiple Options" name="Bedrooms[]" class="span12 msw2-select">
                    <option value="">Choose More Options</option>
                    {if $search_config.bedrooms instanceof CompanySearchConfig}
                        {foreach from=$search_config.bedrooms->getValues() item=name key=value name=config_loop}
                            <option value="{$value}"{if $smarty.foreach.config_loop.first && !$search_narrowers.MV_Bedrooms && !$search_dict.terms.Bedrooms} selected="selected"{/if}{if $value != '' && (($search_narrowers.MV_Bedrooms && is_array($search_narrowers.MV_Bedrooms) && array_key_exists($value,$search_narrowers.MV_Bedrooms)) || ($search_dict.terms.Bedrooms && is_array($search_dict.terms.Bedrooms.csv) && in_array($value,$search_dict.terms.Bedrooms.csv)))} disabled="disabled"{/if}>{$name}</option>
                        {/foreach}
                    {/if}
                </select>
                <ul class="msw2-list">
                    <li class="msw2-list-placeholder"></li>
                    {if $search_config.bedrooms instanceof CompanySearchConfig}
                        {foreach from=$search_config.bedrooms->getValues() item=name key=value name=config_loop}
                            {if $value != '' && (($search_narrowers.MV_Bedrooms && is_array($search_narrowers.MV_Bedrooms) && array_key_exists($value,$search_narrowers.MV_Bedrooms)) || ($search_dict.terms.Bedrooms && is_array($search_dict.terms.Bedrooms.csv) && in_array($value,$search_dict.terms.Bedrooms.csv)))}
                                <li><i class="icon-remove msw2-remove" title="Remove"></i><input type="hidden" name="Bedrooms[]" value="{$value}"> {$name}</li>
                            {/if}
                        {/foreach}
                    {/if}
                </ul>
            </div>
        </div>
    </div>
	<div class="span2">
		<div class="control-group">
			<label class="checkbox bumpCheckbox">
				<input type="checkbox" value="1" name="Bedrooms" title="Checkbox"{if isset($search_dict.terms.Bedrooms) || $search_narrowers.SV_Bedrooms} checked="checked"{/if}> Checkbox
			</label>
		</div>
	</div>
	<div class="span2">
		<div class="control-group">
			<label class="checkbox bumpCheckbox">
				<input type="checkbox" value="1" name="Bedrooms" title="Checkbox"{if isset($search_dict.terms.Bedrooms) || $search_narrowers.SV_Bedrooms} checked="checked"{/if}> Checkbox
			</label>
		</div>
	</div>
	<div class="span2">
		<div class="control-group">
			<label class="checkbox bumpCheckbox">
				<input type="checkbox" value="1" name="Bedrooms" title="Checkbox"{if isset($search_dict.terms.Bedrooms) || $search_narrowers.SV_Bedrooms} checked="checked"{/if}> Checkbox
			</label>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span2">
		<div class="control-group">
			<label class="radio bumpRadio">
				<input type="radio" value="1" name="Bedrooms" title="Radio"{if isset($search_dict.terms.Bedrooms) || $search_narrowers.SV_Bedrooms} checked="checked"{/if}> Radio
			</label>
		</div>
	</div>
	<div class="span2">
		<div class="control-group">
			<label class="radio bumpRadio">
				<input type="radio" value="1" name="Bedrooms" title="Radio"{if isset($search_dict.terms.Bedrooms) || $search_narrowers.SV_Bedrooms} checked="checked"{/if}> Radio
			</label>
		</div>
	</div>
	<div class="span2">
		<div class="control-group">
			<label class="radio bumpRadio">
				<input type="radio" value="1" name="Bedrooms" title="Radio"{if isset($search_dict.terms.Bedrooms) || $search_narrowers.SV_Bedrooms} checked="checked"{/if}> Radio
			</label>
		</div>
	</div>
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="min">Min</label>
			<div class="controls combo-box">
				<input type="text" class="span6" id="min" name="Bedrooms" title="Enter " value="{if $search_narrowers.SV_Bedrooms}{$search_narrowers.SV_Bedrooms}{elseif $search_dict.terms.Bedrooms.value}{$search_dict.terms.Bedrooms.value}{/if}">
				<span class="range-spacer">to</span>
				<input type="text" class="span6" name="Bedrooms" title="Enter " value="{if $search_narrowers.SV_Bedrooms}{$search_narrowers.SV_Bedrooms}{elseif $search_dict.terms.Bedrooms.value}{$search_dict.terms.Bedrooms.value}{/if}">
			</div>
		</div>
	</div>	
</div>

<div class="row-fluid">
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="min">Min</label>
			<div class="controls combo-box">
				<select id="min" class="span6" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
				<span class="range-spacer">to</span>
				<select class="span6" title="Select " name="Bedrooms">
					{if $search_config.bedrooms instanceof CompanySearchConfig}
						{foreach from=$search_config.bedrooms->getValues() item=name key=value}
							<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
						{/foreach}
					{/if}
				</select>
			</div>
		</div>
	</div>
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="as_city">Autocomplete</label>
			<div class="controls">
				<input type="text" class="autoCompleteField span12" id="as_city" data-src="city" placeholder"Enter Value" name="Bedroom" placeholder="Enter Value To See Suggestions" value="">
			</div>
		</div>
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<div class="control-group">
			<label class="control-label" for="as_city2">Autocomplete With Error</label>
			<div class="controls">
				<input type="text" class="autoCompleteField validate-entry span12" id="as_city2" data-src="city2" placeholder"Enter Value" name="Bedroom" placeholder="Enter Value To See Suggestions" value="">
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span12">
		<div class="control-group">
			<label class="control-label">Open Houses</label>
			<div class="controls row-fluid" id="open-house-block">
				<input type="hidden" id="openHouseOn" name="open_house" value="{if isset($search_narrowers.open_house) || isset($search_narrowers.saturday) || isset($search_narrowers.sunday) || isset($search_dict.filters.openhouse)}on{/if}">
				<ul class="unstyled">
					{if $search_dict && $search_dict.filters.openhouse.filter_args}
						{assign var=dict_from value=`$search_dict.filters.openhouse.filter_args.0`|`$search_dict.filters.openhouse.filter_args.1`}
					{else}
						{assign var=dict_from value=false}
					{/if}
					{if $open_house_dates.today == "Sunday"}
						<li class="span3">
							<label class="radio">
								<input{if (isset($search_narrowers.open_house) &&
								$search_narrowers.from != $open_house_dates.week_check &&
								$search_narrowers.from != $open_house_dates.saturday_check &&
								$search_narrowers.from != $open_house_dates.sunday_check &&
								$search_narrowers.from != $open_house_dates.weekend_check) || (isset($search_dict.filters.openhouse) &&
								$dict_from != $open_house_dates.week_check &&
								$dict_from != $open_house_dates.saturday_check &&
								$dict_from != $open_house_dates.sunday_check &&
								$dict_from != $open_house_dates.weekend_check)} checked="checked"{/if} name="from" title="All Dates" type="radio" value="">
								All Dates
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses on {$open_house_dates.sun_time|date_format:'%a, %b %e'}">
								<input{if ($search_narrowers.from == $open_house_dates.sunday_check) || ($dict_from == $open_house_dates.sunday_check)} checked="checked"{/if} title="Show Open Houses on {$open_house_dates.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}">
								{$open_house_dates.sun_time|date_format:'%a, %b %e'}
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses for next week">
								<input{if ($search_narrowers.from == $open_house_dates.week_check) || ($dict_from == $open_house_dates.week_check)} checked="checked"{/if} title="Show Open Houses for next week" name="from" type="radio" value="{$open_house_dates.week_check}">
								Next Week
							</label>
						</li>
					{elseif $open_house_dates.today == "Saturday"}
						<li class="span3">
							<label class="radio" title="Show All Upcoming Open Houses">
								<input{if (isset($search_narrowers.open_house) &&
								$search_narrowers.from != $open_house_dates.week_check &&
								$search_narrowers.from != $open_house_dates.saturday_check &&
								$search_narrowers.from != $open_house_dates.sunday_check &&
								$search_narrowers.from != $open_house_dates.weekend_check) || (isset($search_dict.filters.openhouse) &&
								$dict_from != $open_house_dates.week_check &&
								$dict_from != $open_house_dates.saturday_check &&
								$dict_from != $open_house_dates.sunday_check &&
								$dict_from != $open_house_dates.weekend_check)} checked="checked"{/if} title="Show All Upcoming Open Houses" name="from" type="radio" value="">
								All Dates
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses on {$open_house_dates.sat_time|date_format:'%a, %b %e'}">
								<input{if ($search_narrowers.from == $open_house_dates.saturday_check) || ($dict_from == $open_house_dates.saturday_check)} checked="checked"{/if}  name="from" title="Show Open Houses on {$open_house_dates.sat_time|date_format:'%a, %b %e'}" type="radio" value="{$open_house_dates.sat_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sat_time|date_format:'%Y-%m-%d'}">
								{$open_house_dates.sat_time|date_format:'%a, %b %e'}
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses on {$open_house_dates.sun_time|date_format:'%a, %b %e'}">
								<input{if ($search_narrowers.from == $open_house_dates.sunday_check) || ($dict_from == $open_house_dates.sunday_check)} checked="checked"{/if}  title="Show Open Houses on {$open_house_dates.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}">
								{$open_house_dates.sun_time|date_format:'%a, %b %e'}
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses for this weekend">
								<input{if ($search_narrowers.from == $open_house_dates.weekend_check) || ($dict_from == $open_house_dates.weekend_check)} checked="checked"{/if} title="Show Open Houses for this weekend" name="from" type="radio" value="{$open_house_dates.sat_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}">
								Both Day
							</label>
						</li>
					{else}
						<li class="span3">
							<label class="radio" title="Show All Upcoming Open Houses">
								<input{if (isset($search_narrowers.open_house) &&
								$search_narrowers.from != $open_house_dates.week_check &&
								$search_narrowers.from != $open_house_dates.saturday_check &&
								$search_narrowers.from != $open_house_dates.sunday_check &&
								$search_narrowers.from != $open_house_dates.weekend_check) || (isset($search_dict.filters.openhouse) &&
								$dict_from != $open_house_dates.week_check &&
								$dict_from != $open_house_dates.saturday_check &&
								$dict_from != $open_house_dates.sunday_check &&
								$dict_from != $open_house_dates.weekend_check)} checked="checked"{/if} title="Show All Upcoming Open Houses" name="from" type="radio" value="">
								All Dates
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses on {$open_house_dates.sat_time|date_format:'%a, %b %e'}">
								<input{if ($search_narrowers.from == $open_house_dates.saturday_check) || ($dict_from == $open_house_dates.saturday_check)} checked="checked"{/if}  name="from" title="Show Open Houses on {$open_house_dates.sat_time|date_format:'%a, %b %e'}" type="radio" value="{$open_house_dates.sat_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sat_time|date_format:'%Y-%m-%d'}">
								{$open_house_dates.sat_time|date_format:'%a, %b %e'}
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses on {$open_house_dates.sun_time|date_format:'%a, %b %e'}">
								<input{if ($search_narrowers.from == $open_house_dates.sunday_check) || ($dict_from == $open_house_dates.sunday_check)} checked="checked"{/if}  title="Show Open Houses on {$open_house_dates.sun_time|date_format:'%a, %b %e'}" name="from" type="radio" value="{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}">
								{$open_house_dates.sun_time|date_format:'%a, %b %e'}
							</label>
						</li>
						<li class="span3">
							<label class="radio" title="Show Open Houses for this weekend">
								<input{if ($search_narrowers.from == $open_house_dates.weekend_check) || ($dict_from == $open_house_dates.weekend_check)} checked="checked"{/if} title="Show Open Houses for this weekend" name="from" type="radio" value="{$open_house_dates.sat_time|date_format:'%Y-%m-%d'}|{$open_house_dates.sun_time|date_format:'%Y-%m-%d'}">
								Both Days
							</label>
						</li>
					{/if}
					<li class="span3">
						<label class="radio" title="Do Not Show Open Houses">
							<input checked="checked" class="noOpenHouses" title="Do Not Show Open Houses" name="from" type="radio" value="">
							None
						</label>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>


<div class="row-fluid">
	<div class="span12">
		<div class="control-group">
			<label class="control-label">Listed By</label>
			<div class="controls row-fluid">
				<input type="hidden" name="company" value="{if isset($search_dict.filters.company) || isset($search_narrowers.company)}on{/if}" class="company_only_field">
				<ul class="unstyled">
					<li class="span4">
						<label class="radio" title="All Companies">
							<input title="All Companies"{if !isset($search_dict.filters.company) && !isset($search_narrowers.company) && empty($search_narrowers.Listing_Agent) && empty($search_dict.terms.Listing_Agent.value)} checked="checked"{/if} type="radio" name="company" class="prop_listed_by_field" value="">
							All Companies
						</label>
					</li>
					<li class="span4">
						<label class="radio" title="All Company Agents">
							<input title="All Company Agents" type="radio" name="company" class="prop_listed_by_field" value="on"{if isset($search_dict.filters.company) || isset($search_narrowers.company)} checked="checked"{/if}>
							All Company Agents
						</label>
					</li>
					<li class="span4">
						<label class="radio" title="Select Company Agents">
							<input type="radio" title="Select Company Agents" name="company" class="prop_listed_by_field" value="choose_agent"{if !empty($search_narrowers.MV_Listing_Agent) || !empty($search_dict.terms.Listing_Agent.value)} checked="checked"{/if}>
							Select Company Agents
						</label>
						<select name="Listing_Agent[]" title="All Agents" class="span12 listing_agent_select_box" style="display:{if !empty($search_narrowers.MV_Listing_Agent) || !empty($search_dict.terms.Listing_Agent.value)}block{else}none{/if};" multiple="multiple">
							<option value="">All Agents</option>
							{if $realtors}
								<optgroup label="Realtors">
									{foreach from=$realtors item=realtor key=index}
									{if $realtor instanceof LiteRealtor}
									<option value="{$realtor->get_rebrand_code()}"{if ( is_array($search_narrowers.MV_Listing_Agent) && array_key_exists($realtor->get_rebrand_code(), $search_narrowers.MV_Listing_Agent)) || (is_array($search_dict.terms.Listing_Agent.csv) && in_array($realtor->get_rebrand_code(), $search_dict.terms.Listing_Agent.csv))} selected="selected"{/if}>{$realtor->get_name()}</option>
									{/if}
									{/foreach}
								</optgroup>
							{elseif $search_narrowers.realtors}
								<optgroup label="Realtors">
									{foreach from=$search_narrowers.realtors item=realtor key=index}
									{if $realtor instanceof LiteRealtor}
									<option value="{$realtor->get_rebrand_code()}"{if is_array($search_narrowers.MV_Listing_Agent) && array_key_exists($realtor->get_rebrand_code(), $search_narrowers.MV_Listing_Agent)} selected="selected"{/if}>{$realtor->get_name()}</option>
									{/if}
									{/foreach}
								</optgroup>
							{/if}
							{if $teams}
								<optgroup label="Teams">
									{foreach from=$teams item=team key=index}
									{if $team instanceof LiteEntityTeam}
									<option value="{$team->get_rebrand_code()}"{if ( is_array($search_narrowers.MV_Listing_Agent) && array_key_exists($realtor->get_rebrand_code(), $search_narrowers.MV_Listing_Agent)) || (is_array($search_dict.terms.Listing_Agent.csv) && in_array($team->get_rebrand_code(), $search_dict.terms.Listing_Agent.csv))} selected="selected"{/if}>{$team->get_name()}</option>
									{/if}
									{/foreach}
								</optgroup>
							{elseif $search_narrowers.teams}
								<optgroup label="Teams">
									{foreach from=$search_narrowers.teams item=team key=index}
									{if $team instanceof LiteEntityTeam}
									<option value="{$team->get_rebrand_code()}"{if is_array($search_narrowers.MV_Listing_Agent) && array_key_exists($team->get_rebrand_code(), $search_narrowers.MV_Listing_Agent)} selected="selected"{/if}>{$team->get_name()}</option>
									{/if}
									{/foreach}
								</optgroup>
							{/if}
						</select>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

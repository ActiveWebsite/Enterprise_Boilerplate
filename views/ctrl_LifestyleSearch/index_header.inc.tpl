<form method="post" id="filterForm" class="lss-form" action="{$controller_alias}search">
		<div class="row" id="narrowSearch">
			{if $site_owner_states && count($site_owner_states) > 1}
				<div class="col-sm-5 margin-bottom-15">
					<label>State</label>
					<select class="form-control" id="userStateSelect" name="stateId">
						{foreach from=$site_owner_states item=state_name key=state_id}
						<option value="{$state_id}">{$state_name}</option>
						{/foreach}
					</select>					
				</div>
			{else}
				<input id="userStateSelect" type="hidden" name="stateId" value="{foreach from=$site_owner_states item=state_name key=state_id}{$state_id}{/foreach}">
			{/if}
			{if $default_to_county_cbsa}
				<input type="hidden" name="defaultCounties" value="{foreach name=countyDefList from=$static_counties item=county_name key=county_id}{$county_id}{if !$smarty.foreach.countyDefList.last}|{/if}{/foreach}">
			{/if}
			<div class="col-sm-5 margin-bottom-15">
				<label>Count{if $multiselect_county_cbsa}ies{else}y{/if}</label>
				<select class="form-control" id="userCountySelect" disabled="disabled" name="countyId{if $multiselect_county_cbsa}[]{/if}"{if $multiselect_county_cbsa} multiple="multiple"{/if}>
					<option value="">Choose County</option>
				</select>
				{if $multiselect_county_cbsa}<span class="hint">Ctrl + click to add multiple items</span>{/if}
			</div>
			{if $showCBSA}
				<div class="col-sm-5 col-sm-offset-2 margin-bottom-15">
					<label>{if $multiselect_county_cbsa}Areas/Metroplexes/Regions{else}Area/Metroplex/Region{/if}</label>
					<select class="form-control" id="userCBSASelect" disabled="disabled" name="cbsaId{if $multiselect_county_cbsa}[]{/if}"{if $multiselect_county_cbsa} multiple="multiple"{/if}>
						<option value="">Choose Region</option>
					</select>
					{if $multiselect_county_cbsa}<span class="hint">Ctrl + click to add multiple items</span>{/if}
				</div>
			{/if}
		</div>
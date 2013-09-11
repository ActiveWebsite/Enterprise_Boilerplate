<p id="pageDescription">
    {if $site_owner_states && count($site_owner_states) > 1}
	   What state, county or general area do you want to live in?
    {else}
	   Our Lifestyle Search defaults to the {foreach from=$site_owner_states item=state_name key=state_id}{$state_name}{/foreach} area. To choose a more specific
	   location, select a county{if $showCBSA} or metro area{/if} from the list{if $showCBSA}s{/if} below.
    {/if}
</p>
<div class="lifestyleSearchFilters">
    <form method="post" id="filterForm" action="{$controller_alias}search">
	   <div id="narrowSearch" class="row">
	   		<div class="col-sm-6">
				{if $site_owner_states && count($site_owner_states) > 1}
					<label>State</label>
					<select id="userStateSelect" class="form-control" name="stateId">
					    {foreach from=$site_owner_states item=state_name key=state_id}
						   <option value="{$state_id}">{$state_name}</option>
					    {/foreach}
					</select>
				{else}
					<input id="userStateSelect" type="hidden" name="stateId" value="{foreach from=$site_owner_states item=state_name key=state_id}{$state_id}{/foreach}">
				{/if}
			</div>
			<div class="col-sm-6">
				{if $default_to_county_cbsa}
				    <input type="hidden" name="defaultCounties" value="{foreach name=countyDefList from=$static_counties item=county_name key=county_id}{$county_id}{if !$smarty.foreach.countyDefList.last}|{/if}{/foreach}">
				{/if}
				<label>Count{if $multiselect_county_cbsa}ies{else}y{/if}</label>
				<select class="form-control{if $multiselect_county_cbsa} multiSelect{/if}" id="userCountySelect" disabled="disabled" name="countyId{if $multiselect_county_cbsa}[]{/if}"{if $multiselect_county_cbsa} multiple="multiple"{/if}>
					<option value="">Choose County</option>
				</select>
				{if $multiselect_county_cbsa}<span class="hint">Ctrl + click to add multiple items</span>{/if}
				
				{if $showCBSA}
					<hr id="county_cbsa_spacer">

					<label>{if $multiselect_county_cbsa}Areas/Metroplexes/Regions{else}Area/Metroplex/Region{/if}</label>
					<select class="form-control{if $multiselect_county_cbsa} multiSelect{/if}" id="userCBSASelect" disabled="disabled" name="cbsaId{if $multiselect_county_cbsa}[]{/if}"{if $multiselect_county_cbsa} multiple="multiple"{/if}>
				    	<option value="">Choose Region</option>
					</select>
					{if $multiselect_county_cbsa}<span class="hint">Ctrl + click to add multiple items</span>{/if}
				 	
				{/if}
			</div>
	   </div>
	   <hr>

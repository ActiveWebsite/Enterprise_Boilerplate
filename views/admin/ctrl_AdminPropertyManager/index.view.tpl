{literal}
	<script type="text/javascript">
		jQuery(document).ready( function($){
			$('.guiDropDownControls .ui-button').click(function(e){
				e.preventDefault();
				$(this)
					.parent()
					.next()
					.css({
						'position':'absolute',
						'top':'25px',
						'right':'0px',
						'z-index':'9999'
					})
					.fadeIn("fast")
					.mouseleave(function(){
						var timer = setTimeout('jQuery(".aw-menu-drop-down").fadeOut("fast")', 300);
						$(this).mouseenter(function(){
							clearTimeout(timer);
						});
					});
			});
			$('.property-per-page-select').change(function() {
				$(this).parents('form').submit();
			});

			$('input[data-auto-complete="true"]').autocomplete({
				source: function (request, response) {
					var su = "/admin/quick_automls/address/false";
					$.ajax({
						url: su,
						type: 'POST',
						data: {
							address: request.term
						},
						success: function (data) {
							var txt = $(data).find('li');
							response($.map(txt, function (item) {
								return {
									label: $(item).text(),
									value: $(item).attr('id')
								}
							}));
						}
					});
				},
				focus: function (event, ui) {
					var ds;
					var el = $(this);
					var id = ui.item.value.split(',');
					var mlsprovider = el.data('mls-provider-field-name');

					// set the value of the field
					el.val(id[0]);

					// if there is an mls provider select find it and set its value
					if (mlsprovider) {
						ds = $(this).parents('table').find('select[name="' + mlsprovider + '"]');
						if (ds.length && id[1]) {
							$(ds).val(id[1]);
						}
					}

					return false;
				},
				select: function (event, ui) {
					var ds;
					var el = $(this);
					var id = ui.item.value.split(',');
					var mlsprovider = el.data('mls-provider-field-name');

					// set the value of the field
					el.val(id[0]);

					// if there is an mls provider select find it and set its value
					if (mlsprovider) {
						ds = $(this).parents('table').find('select[name="' + mlsprovider + '"]');
						if (ds.length && id[1]) {
							$(ds).val(id[1]);
						}
					}

					return false;
				},
				minLength: 2
			}).placeholder();
		});
	</script>
{/literal}
<div class="clearBoth">&nbsp;</div>
<div class="aw-admin-wrapper">
{if !$controller_obj->useNewLayout}
	{literal}
		<div id="helpDiv" style="float:right; height:20px;">
			<span class="ui-icon icon ui-icon-help"></span>
			<a class="helpLink" href="#" onclick="EntAdmin.Help({page:'25'}); return false;" >Help</a>
		</div>
	{/literal}
{/if}
	{if $show_active_sold_switch}
		<h1>{$section_title}</h1>
	{else}
		<h1>Property Manager</h1>
	{/if}
	<div style="float: right;">
		<form method="post" action="/{$controller_alias}{$filters_url_base}">
			Per Page:
			<select name="count" class="property-per-page-select">
				<option value="10"{if $page_manager->get_count() == 10} selected="selected"{/if}>10</option>
				<option value="20"{if $page_manager->get_count() == 20} selected="selected"{/if}>20</option>
				<option value="30"{if $page_manager->get_count() == 30} selected="selected"{/if}>30</option>
				<option value="40"{if $page_manager->get_count() == 40} selected="selected"{/if}>40</option>
				<option value="50"{if $page_manager->get_count() == 50} selected="selected"{/if}>50</option>
			</select>
			
		</form>
	</div>
	<div class="clearBoth">&nbsp;</div>
	<div class="AdminPaging floatLeft">
	{if $show_active_sold_switch}<a href="/{$controller_alias}/toggleIDXView">Switch Active/Sold</a>{/if}
	</div>
	<div class="AdminPaging floatRight">		
		{if $page_manager->get_prev_page_url() != false}
			<a href="{$page_manager->get_prev_page_url()}"><span class="ui-button-text-only">&lt; Prev</span></a> | 
		{/if}
		{assign var=urls value=$page_manager->get_page_url_array()}
		{foreach from=$urls item=show key=page}
			{if $show == 0}
				<span class="ui-button-text-only">{$page}</span> | 
			{elseif $show == 1}
				<a href="{$page_manager->get_page_url($page)}">{$page}</a> | 
			{else}
				<a href=""><span class="ui-button-text-only">...</span></a> | 
			{/if}
		{/foreach}
		{if $page_manager->get_next_page_url() != false}
			<a href="{$page_manager->get_next_page_url()}">Next &gt;</a>
		{/if}
	</div>
	<div class="clearBoth"></div>
	<form method="get" action="/{$controller_alias}/">
		<table class="ui-widget ui-widget-content aw-table-search-bar ui-helper-reset">
			<thead>
				<tr>
					<th>
						<div class="field fieldLeft">
							<label class="block">MLS Source:</label>
							<select name="mls_id" class="selectField select-box">
								<option value="">All Sources</option>
								{foreach from=$IDX_sources item=name key=value}
									<option value="{$value}"{if $value == $mls_id} selected="selected"{/if}>{$name}</option>
								{/foreach}
							</select>
						</div>
						<div class="field fieldRight">
							<label class="block">Office:</label>
							<select name="office" class="selectField select-box">
								<option value="">All Sources</option>
								{foreach from=$offices item=office}
									<option value="{$office.id}"{if $office.id == $persist_office} selected="selected"{/if}>{$office.name}</option>
								{/foreach}
							</select>
						</div>
						<div class="clearAll"></div>
						<div class="field fieldLeft noPaddingField">
							<label class="block">Address/MLS Number:</label>
							<input type="text" data-mls-provider-field-name="mls_id" title="Enter Address/MLS Number" data-auto-complete="true" placeholder="Enter Address/MLS Number" class="text-field" name="address" value="{$address}" size="70" />
						</div>
						<div class="field fieldRight noPaddingField submitFieldRightPaddingTop">
							<input type="submit" value="Search" class="ui-button ui-widget ui-state-default ui-corner-all smallButton"/>
						</div>
					</th>
				</tr>
			</thead>
		</table>
	</form>
	<table class="AdminDataTable ui-widget-content aw-table" cellpadding="0">
		<thead>
			<tr>
				<th>Overridden</th>
				<th class="{if $smarty.get.sort_idx_hide == '1'}SortDesc{elseif $smarty.get.sort_idx_hide == 'desc'}SortAsc{else}NoSort{/if}"><a href="/{$controller_alias}{$sort_url_base}{if $sort_url_base}&{else}?{/if}sort_idx_hide={if empty( $smarty.get.sort_idx_hide )}1{elseif $smarty.get.sort_idx_hide == 1}desc{/if}">Hidden</a></th>
				<th class="{if $smarty.get.sort_address == '1'}SortDesc{elseif $smarty.get.sort_address == 'desc'}SortAsc{else}NoSort{/if}"><a href="/{$controller_alias}{$sort_url_base}{if $sort_url_base}&{else}?{/if}sort_address={if empty( $smarty.get.sort_address )}1{elseif $smarty.get.sort_address == 1}desc{/if}">Street Address</a></th>
				<th class="{if $smarty.get.sort_mls_no == '1'}SortAsc{elseif $smarty.get.sort_mls_no == 'desc'}SortDesc{else}NoSort{/if}"><a href="/{$controller_alias}{$sort_url_base}{if $sort_url_base}&{else}?{/if}sort_mls_no={if empty( $smarty.get.sort_mls_no )}1{elseif $smarty.get.sort_mls_no == 1}desc{/if}">MLS Number</a></th>
				<th class="{if $smarty.get.sort_datasource == '1'}SortAsc{elseif $smarty.get.sort_datasource == 'desc'}SortDesc{else}NoSort{/if}"><a href="/{$controller_alias}{$sort_url_base}{if $sort_url_base}&{else}?{/if}sort_datasource={if empty( $smarty.get.sort_datasource )}1{elseif $smarty.get.sort_datasource == 1}desc{/if}">Datasource</a></th>
				<th>List Price</th>
				<th>Geocoded</th>
				<th>Views</th>
				<th>Photo Count</th>
				<th>Virtual Tour</th>
				<th>Files</th>
				<th>Videos</th>
				<th>Open House</th>
				<th>{if $show_add_btn}<a href="{$controller_alias}add_property">Add Property</a>{else}---{/if}</th>
			</tr>
		</thead>
		<tbody>

		{foreach item=property from=$properties}
			<tr class="{if $property.idx_hide}AdminDataTableHidden{cycle values="ui-widget-content,AdminDataTableEven" print=false}{else}{cycle values="ui-widget-content,AdminDataTableEven"}{/if}">
				<td align="center">
					{if $property.has_overrides}
						<span{if !$property.idx_hide} style="color: #FF0000; font-weight: bold;"{/if}>Yes</span>
					{else}
						No
					{/if}
				</td>
				<td align="center">{if $property.idx_hide}Yes{else}No{/if}</td>
				<td class="address">
					{$property.address}<br />
					{$property.city}, {$property.state} {$property.zip}
				</td>
				<td class="mls">{$property.property_id}</td>
				<td class="mls">{$property.data_source}</td>
				<td>{$property.list_price}</td>
				<td>{if $property.lat_long}Yes{else}No{/if}</td>
				<td>?</td>
				<td>{$property.photo_total}</td>
				<td>{if $property.virtual_tour_url}Tour{/if}</td>
				<td>{foreach from=$property.files item=file}{$file->getName()}<br/>{/foreach}</td>
				<td>{foreach from=$property.videos item=video}{$video->name}<br/>{/foreach}</td>
				<td>{$property.open_house.start_datetime|date_format:'%D'}</td>
				<td class="guiDropDownColumn">
					<div class="guiDropDownWrapper">
						<div class="guiDropDownControls ui-buttonset">
							<button class="ui-button ui-widget ui-state-default ui-button-text-only ui-corner-left"><span class="ui-button-text">Modify Options</span></button>
							{*<button class="ui-button ui-widget ui-state-default ui-button-icon-only ui-corner-right" title="Select an option"><span class="ui-button-icon-primary ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-text">Select an option</span></button>*}
						</div>
						<div class="aw-menu-drop-down ui-corner-all" style="display: none;">
							<ul>
								<li>Basics
									<ul>
										<li><a href="/property/{$property.company_property_id}/" target="_blank">Front End Page</a></li>
										<li><a href="/{$controller_alias}/property/{$property.company_property_id}/">Property Remarks</a></li>
										{if $property.is_ipw && ( $logged_in_type != 'realtor' && $logged_in_type != 'team') }
											<li><a class="aw-open-tab" href="/admin/ipw/ipw/{$property.company_property_id}/">Manage IPW</a></li>
										{/if}
										{if $showTimeshareBlock}
											<li><a href="/{$controller_alias}/timeshareBlocks/{$property.company_property_id}/">Timeshare Manager</a></li>
										{/if}
										{if $property.mls_id == $custom_mls_id}
										<li><a href="/{$controller_alias}/delete_property/{$property.company_property_id}/" class="confirm-action" title="Are You Sure You Want To Delete This Property?">Delete Property</a></li>
										{/if}
										{if !$property.idx_hide}
										<li><a href="/{$controller_alias}/toggle_hide/{$property.company_property_id}/" class="confirm-action" title="Are You Sure You Want To Hide This Property?">Hide</a></li>
										{else}
										<li><a href="/{$controller_alias}/toggle_hide/{$property.company_property_id}/">Unhide</a></li>
										{/if}
									</ul>
								</li>
								<li>Files/Photos
									<ul>
										<li><a href="/{$controller_alias}/files/{$property.company_property_id}/">Files</a></li>
										{if $photo_editing_allowed}<li><a href="/{$controller_alias}/photos/{$property.company_property_id}/">Photos</a></li>{/if}
										<li><a href="/{$controller_alias}/videos/{$property.company_property_id}/">Videos</a></li>
									</ul>
								</li>
								<li>Geographics
									<ul>
										<li><a href="/{$controller_alias}/location/{$property.company_property_id}/">Location</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</td>
			</tr>
		{/foreach}
		</tbody>
	</table>
	<div class="AdminPaging floatRight">
		{if $page_manager->get_prev_page_url() != false}
			<a href="{$page_manager->get_prev_page_url()}"><span class="ui-button-text-only">&lt; Prev</span></a> | 
		{/if}
		{assign var=urls value=$page_manager->get_page_url_array()}
		{foreach from=$urls item=show key=page}
			{if $show == 0}
				<span class="ui-button-text-only">{$page}</span> | 
			{elseif $show == 1}
				<a href="{$page_manager->get_page_url($page)}">{$page}</a> | 
			{else}
				<a href=""><span class="ui-button-text-only">...</span></a> | 
			{/if}
		{/foreach}
		{if $page_manager->get_next_page_url() != false}
			<a href="{$page_manager->get_next_page_url()}">Next &gt;</a> 
		{/if}
	</div>
	<div class="clearAll">&nbsp;</div>
	<div style="float: right;">
		<form method="post" action="/{$controller_alias}{$filters_url_base}">
			Per Page:
			<select name="count" class="property-per-page-select">
				<option value="10"{if $page_manager->get_count() == 10} selected="selected"{/if}>10</option>
				<option value="20"{if $page_manager->get_count() == 20} selected="selected"{/if}>20</option>
				<option value="30"{if $page_manager->get_count() == 30} selected="selected"{/if}>30</option>
				<option value="40"{if $page_manager->get_count() == 40} selected="selected"{/if}>40</option>
				<option value="50"{if $page_manager->get_count() == 50} selected="selected"{/if}>50</option>
			</select>
		</form>
	</div>
</div>

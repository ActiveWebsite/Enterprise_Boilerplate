{* 
	-------------------------------------------------------------------------------------------------
	THIS IS AN ADVANCED SEARCH FORM WHERE WE MULTIPLE PROPERTY TYPES THAT SWAP OUT FORM ELEMENTS
	-------------------------------------------------------------------------------------------------
*}
{* 
	---------------------------------------------------------
	DETERMIN THE PROPERTY TYPE WE HAVE
	THESE ARE JUST EXAMPLES YOU WILL HAVE YOUR OWN ID'S
	THIS IS AN EXAMPLE
	---------------------------------------------------------
*}
{if $search_narrowers.SV_Property_Type == '145' || $search_dict.terms.Property_Type.value == '145'}
    {* Residential *}
    {assign var=PT value=145}
{elseif $search_narrowers.SV_Property_Type == '146' || $search_dict.terms.Property_Type.value == '146'}
    {* Land/Lot *}
    {assign var=PT value=146}
{elseif $search_narrowers.SV_Property_Type == '147' || $search_dict.terms.Property_Type.value == '147'}
    {* Farms *}
    {assign var=PT value=147}
{elseif $search_narrowers.SV_Property_Type == '148' || $search_dict.terms.Property_Type.value == '148'}
    {* Multi-Family *}
    {assign var=PT value=148}
{elseif $search_narrowers.SV_Property_Type == '149' || $search_dict.terms.Property_Type.value == '149'}
    {* Commercial *}
    {assign var=PT value=149}
{else}
    {* DEFAULT TO RESIDENTIAL *}
    {assign var=PT value=145}
{/if}
{* 
	---------------------------------------------------------
	DETERMIN WE SHOULD USE A SAVE OR SEARCH BUTTON
	---------------------------------------------------------
*}
{if ($form_type && $form_type == 'saved') || ($cma_url && $cma_url != '') || $isMenuItemCreate || $isMenuItemEdit || $new_saved_search || ($saved_admin && $saved_admin == 1)}	
	{assign var=save_button value=true}
{else}
	{assign var=save_button value=false}
{/if}
{if !$using_new_admin_layout_view}
<head>
{/if}
	<script src="/js/search/jquery.fancySelect2.min.js"></script>
	{if $using_new_admin_layout_view}
		{* put code here that will need to go into the new admin layout *}
	{else}
		{* all other code that should not be loaded into the new admin layout goes here *}
		{if $save_button}
			<link rel="stylesheet" href="/css/search/advanced_search_admin.css">
		{/if}
		<link rel="stylesheet" href="/css/search/advanced_search.css">
		{* if using bootstrap add a build list with all the libraries you will need *}
		<script src="/js/buildlist.js?scripts=/js/search/jquery.formCounter.min.js,/js/jqueryui/components/autocomplete.min.js"></script>
		<script src="/js/min/search_app.min.js"></script>
	{/if}
	{literal}
		<script>
			jQuery(document).ready(function($) {
				var search_app = new ClientSearch('AdvancedSearchForm',{/literal} '{$PT}'{literal},{/literal} {if $save_button}true{else}false{/if}, {if $for_cma || $for_auto_cma}true{else}false{/if}{literal});
				search_app.initAdvancedSearch();
			});
		</script>
	{/literal}
{if !$using_new_admin_layout_view}
</head>
{/if}
<div class="advancedSearchForm">
	<h1>Advanced Search</h1>
	{if !$save_button}
		<form action="{$ACTION_URLS.search}url_search" method="post">
			<fieldset class="row-fluid">
				<div class="span10">
					<input type="text" class="span12" placeholder="Enter Address">
				</div>
				<div class="span2">
					{if $save_button}
						<input type="submit" title="Search" value="Save" class="btn btn-block">
					{else}
						<input type="submit" class="btn btn-block" value="Search" title="Search">							
					{/if}
				</div>
			</fieldset>
		</form>
		<div class="form-Seperator clearfix">
			<span>OR</span>
		</div>
	{/if}
	{if $isMenuItemCreate}
		<form id="AdvancedSearchForm" action="/admin/{$MenuSubmitAction}/create_search_item/{$MenuItemOwner->getType()}/{$MenuItemOwner->get_id()}/">
			<input type="hidden" name="MenuItemName" value="{$MenuItemName}">
			<input type="hidden" name="MenuItemParentId" value="{$MenuItemParentId}">
	{elseif $isMenuItemEdit}
		<form id="AdvancedSearchForm" action="/admin/{$MenuSubmitAction}/edit_search_item/{$MenuItemOwner->getType()}/{$MenuItemOwner->get_id()}/{$MenuItemId}/">
			<input type="hidden" name="MenuItemId" value="{$MenuItemId}">
	{elseif $form_type == 'saved'}
		{if $search_id && $search_id != -1}
			<form id="AdvancedSearchForm" action="/account/edit_search/save/{$search_id}">
		{else}
			<form id="AdvancedSearchForm" action="/account/edit_search/save/-1/">
		{/if}
	{elseif $for_auto_cma}
		<form id="AdvancedSearchForm" action="{$ACTION_URLS.local_root}/auto_cma_save_search/{$search_id}/"; onsubmit="return checkRequiredCMAFields();">	
	{elseif $for_cma && $search_dict && $search_id}
		<form id="AdvancedSearchForm" action="{$ACTION_URLS.local_root}/save_property_search/{$search_id}/"; onsubmit="return checkRequiredCMAFields();">	
	{elseif $for_cma}
		<form id="AdvancedSearchForm" action="{$ACTION_URLS.local_root}/create_property_search/"; onsubmit="return checkRequiredCMAFields();">	
	{elseif $admin}
		<form id="AdvancedSearchForm" action="{$ACTION_URLS.local_root}/save_search/{$search_id}/{$entity_id}">
	{else}
		<form id="AdvancedSearchForm" action="{$ACTION_URLS.search}url_search" method="post">
	{/if}
		<div class="main-property-type-list clearfix">
			<div class="row-fluid">
				<ul class="unstyled">
					<li class="span2">
						<label class="radio">
							<input type="radio" data-action="change-property-type" value="1" data-template="sample" checked="checked" name="Property_Type"{if $PT == 145} checked="checked"{/if}>
							Sample
						</label>
					</li>					
					<li class="span2">
						<label class="radio">
							<input type="radio" data-action="change-property-type" value="145" data-template="residential" checked="checked" name="Property_Type"{if $PT == 145} checked="checked"{/if}>
							Residential
						</label>
					</li>
					<li class="span2">
						<label class="radio">
							<input type="radio" data-action="change-property-type" value="146" data-template="land_lot" name="Property_Type"{if $PT == 146} checked="checked"{/if}>
							Land and Lots
						</label>
					</li>
					<li class="span2">
						<label class="radio">
							<input type="radio" data-action="change-property-type" data-template="farm" value="147" name="Property_Type"{if $PT == 147} checked="checked"{/if}>
							Farms
						</label>
					</li>
					<li class="span2">
						<label class="radio">
							<input type="radio" data-action="change-property-type" data-template="multi_family" value="148" name="Property_Type"{if $PT == 148} checked="checked"{/if}>
							Multifamily
						</label>
					</li>
					<li class="span2">
						<label class="radio">
							<input type="radio" data-action="change-property-type" data-template="commercial" value="149" name="Property_Type"{if $PT == 149} checked="checked"{/if}>
							Commercial
						</label>
					</li>
				</ul>
			</div>
		</div>
		<hr>
		<div id="advanced-search-width-wrapper" class="row-fluid">
			<div class="span9">
				<div class="row-fluid">
					<div id="dynamic-wrapper" class="span12">
						<div id="dynamic-content">
							{*
								LOAD THE CORRECT PROPERTY TYPE HERE BASED ON THE $PT. 
								YOU WILLUPDATE THE PATHS TO THE FILE INCLUDES AND THE ID'S FOR YOUR CLIENT
								THIS IS JUST AN EXAMPLE
							*}
							{*
							{if $PT == 145}
								{include file="$view_path/search_form_prop_types/residential.view.tpl"}
							{elseif $PT == 146}
								{include file="$view_path/search_form_prop_types/land_lot.view.tpl"}
							{elseif $PT == 147}
								{include file="$view_path/search_form_prop_types/farm.view.tpl"}
							{elseif $PT == 148}
								{include file="$view_path/search_form_prop_types/multi_family.view.tpl"}
							{elseif $PT == 149}
								{include file="$view_path/search_form_prop_types/commercial.view.tpl"}
							{else}
								{include file="$view_path/search_form_prop_types/residential.view.tpl"}
							{/if}
							*}
							{include file="$view_path/search_form_prop_types/sample.view.tpl"}
						</div>
					</div>
				</div>
				{* 
					PLACE ANY FIELDS  OR BLOCKS THAT DO NOT SWAP BASED ON PROPERTY TYPE OUTSIDE OF THE "dynamic-wrapper" DIV 
				*}			
				{* embed google map *}
				{if $for_cma || $for_auto_cma || $save_button}
					<div class="row-fluid">
						<div class="span12">
							{render_component component="SearchFormMap" search_dict=$search_dict distance_form=$distance_form search_config=$search_config}
						</div>
					</div>
				{/if}
				{* for the lcd component *}
				{if $lcd_views}
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="as_lcd">LCD Screen Views</label>
								<div class="controls">
									<select id="as_lcd" class="span12" title="Select LCD Template" name="LcdViews">
										{foreach from=$lcd_views item=lcd name=lcdLoop}
											<option value="{$lcd.id}"{if $smarty.foreach.lcdLoop.first} selected="selected"{/if}>{$lcd.name}</option>
										{/foreach}
									</select>
									<input type="hidden" name="view" value="showroomflash">
								</div>
							</div>
						</div>
					</div>
				{/if}
			</div>
			<div class="span3" id="form-counter-holder"></div>
		</div>
	</form>
</div>
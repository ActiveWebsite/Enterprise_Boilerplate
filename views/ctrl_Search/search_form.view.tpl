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
		<script src="/js/buildlist.js?scripts=/js/libs/jquery_ui/components/core.1.10.3.min.js,/js/libs/jquery_ui/components/menu.1.10.3.min.js,/js/libs/jquery_ui/components/autocomplete.1.10.3.min.js,/js/search/jquery.formCounter.min.js"></script>
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
	<div class="page-header">
		<h1>Advanced Search</h1>
	</div>
	{if !$save_button}
		<form action="{$ACTION_URLS.search}url_search" method="post">
			<fieldset class="row">
				<div class="col-sm-10">
					<input class="form-control" type="text" placeholder="Enter Address">
				</div>
				<div class="col-sm-2">
					{if $save_button}
						<input type="submit" title="Search" value="Save" class="btn btn-default btn-block">
					{else}
						<input type="submit" class="btn btn-primary btn-block" value="Search" title="Search">							
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
			<ul class="row">
				<li class="col-sm-2">
					<div class="radio bold">
						<label>
							<input type="radio" data-action="change-property-type" value="1" data-template="sample" name="Property_Type"{if !$PT || $PT == 145} checked="checked"{/if}>
							Sample
						</label>
					</div>
				</li>					
				<li class="col-sm-2">
					<div class="radio bold">
						<label>
							<input type="radio" data-action="change-property-type" value="145" data-template="residential" name="Property_Type"{if $PT == 145} checked="checked"{/if}>
							Residential
						</label>
					</div>
				</li>					
				<li class="col-sm-2">
					<div class="radio bold">
						<label>
							<input type="radio" data-action="change-property-type" value="146" data-template="land_lot" name="Property_Type"{if $PT == 146} checked="checked"{/if}>
							Land and Lots
						</label>
					</div>
				</li>					
				<li class="col-sm-2">
					<div class="radio bold">
						<label>
							<input type="radio" data-action="change-property-type" data-template="farm" value="147" name="Property_Type"{if $PT == 147} checked="checked"{/if}>
							Farms
						</label>
					</div>
				</li>					
				<li class="col-sm-2">
					<div class="radio bold">
						<label>
							<input type="radio" data-action="change-property-type" data-template="multi_family" value="148" name="Property_Type"{if $PT == 148} checked="checked"{/if}>
							Multifamily
						</label>
					</div>
				</li>					
				<li class="col-sm-2">
					<div class="radio bold">
						<label>
							<input type="radio" data-action="change-property-type" data-template="commercial" value="149" name="Property_Type"{if $PT == 149} checked="checked"{/if}>
							Commercial
						</label>
					</div>
				</li>					
			</ul>
		</div>
		<hr>
		<div id="advanced-search-width-wrapper" class="row">
			<div class="col-sm-9">
				<div id="dynamic-wrapper">
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
				{* 
					PLACE ANY FIELDS  OR BLOCKS THAT DO NOT SWAP BASED ON PROPERTY TYPE OUTSIDE OF THE "dynamic-wrapper" DIV 
				*}			
				{* embed google map *}
				{if $for_cma || $for_auto_cma || $save_button}
					{render_component component="SearchFormMap" search_dict=$search_dict distance_form=$distance_form search_config=$search_config}
				{/if}
				{* for the lcd component *}
				{if $lcd_views}
					<div class="row">
						<div class="col-sm-6 margin-bottom-15">
							<label for="as_lcd">LCD Screen Views</label>
							<select class="form-control" id="as_lcd" title="Select LCD Template" name="LcdViews">
								{foreach from=$lcd_views item=lcd name=lcdLoop}
									<option value="{$lcd.id}"{if $smarty.foreach.lcdLoop.first} selected="selected"{/if}>{$lcd.name}</option>
								{/foreach}
							</select>
							<input type="hidden" name="view" value="showroomflash">
						</div>
					</div>
				{/if}
			</div>
			<div class="col-sm-3" id="form-counter-holder"></div>
		</div>
	</form>
</div>
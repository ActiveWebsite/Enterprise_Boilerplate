{* 
	-----------------------------------------------------------------------
	THIS IS AN ADVANCED SEARCH FORM WHERE WE ONLY HAVE 1 PROPERTY TYPE
	-----------------------------------------------------------------------
*}
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
		<script src="/js/min/search_app.min.js"></script>
	{/if}
	{literal}
		{* if using bootstrap add a build list with all the libraries you will need *}
		<script src="/js/buildlist.js?scripts=/js/search/jquery.formCounter.min.js,/js/jqueryui/components/autocomplete.min.js"></script>
		<script>
			jQuery(document).ready(function($) {
				var search_app = new ClientSearch('AdvancedSearchForm',{/literal} {if $save_button}true{else}false{/if}, {if $for_cma || $for_auto_cma}true{else}false{/if}{literal});
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
						<input type="submit" title="Search" value="Save">
					{else}
						<input type="submit" class="btn" value="Search" title="Search">							
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
		<div id="advanced-search-width-wrapper" class="row-fluid">
			<div class="span9">
				{* load the form here! *}
				{include file="$view_path/search_form_prop_types/sample.view.tpl"}
				
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
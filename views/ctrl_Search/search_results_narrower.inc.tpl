<h2>Refine Search</h2>
<form id="refineSearchFormElement" class="advancedSearchForm" action="{$ACTION_URLS.search}url_search" method="post">
	{* 
		
		IF WE HAVE A SINGLE PROPERTY TYPE FORM USE THE FOLLOWING AS AN EXAMPLE:
	
	*}

	{* Load your single form here *}
	{* 
	{include file="$view_path/search_refine_prop_types/all.view.tpl"}
	{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/all.view.tpl")}
	*}

	{* working example *}
	{include file="$view_path/search_refine_prop_types/sample.view.tpl"}
	{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/sample.view.tpl")}

	{* Create persistence *}
	{foreach from=$search_narrowers.terms_list item=searchTerm}
		{if !in_array($searchTerm, $allUsedFields)}
			{assign var=pre value="SV_`$searchTerm`"}
			{if $search_narrowers.$pre}
				<input type="hidden" name="{$searchTerm}" value="{$search_narrowers.$pre}">
			{elseif $search_narrowers.$searchTerm}
				<input type="hidden" name="{$searchTerm}" value="{$search_narrowers.$searchTerm}">
			{/if}
		{/if}
	{/foreach}	
	{if $last_order_by}
		<input type="hidden" name="orderby" value="{$last_order_by}">
	{/if}

	{*

		IF WE HAVE MULTIPLE PROPERTY TYPES USE THE FOLLOWING AS AN EXAMPLE:

	*}

	{* Load the form based on property type *}
	{*
	{if $PT == '145'}
		{include file="$view_path/search_refine_prop_types/residential.view.tpl"}
		{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/residential.view.tpl")}
	{elseif $PT == '149'}
		{include file="$view_path/search_refine_prop_types/commercial.view.tpl"}
		{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/commercial.view.tpl")}
	{elseif $PT == '150'}
		{include file="$view_path/search_refine_prop_types/rentals.view.tpl"}
		{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/rentals.view.tpl")}
	{else}
		{include file="$view_path/search_refine_prop_types/residential.view.tpl"}
		{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/residential.view.tpl")}
	{/if}
	*}

	{* working example *}
	{include file="$view_path/search_refine_prop_types/sample.view.tpl"}
	{assign var=allUsedFields value=$search->getUsedFields("search_refine_prop_types/sample.view.tpl")}


	{* Create persistence *}
	{foreach from=$search_narrowers.terms_list item=searchTerm}
		{if !in_array($searchTerm, $allUsedFields)}
			{assign var=pre value="SV_`$searchTerm`"}
			{if $search_narrowers.$pre}
				<input type="hidden" name="{$searchTerm}" value="{$search_narrowers.$pre}">
			{elseif $search_narrowers.$searchTerm}
				<input type="hidden" name="{$searchTerm}" value="{$search_narrowers.$searchTerm}">
			{/if}
		{/if}
	{/foreach}	
	{if $last_order_by}
		<input type="hidden" name="orderby" value="{$last_order_by}">
	{/if}

	<input type="submit" value="Update Results" title="Update Results" class="btn btn-primary btn-block">
</form>
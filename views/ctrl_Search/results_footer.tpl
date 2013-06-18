<div class="row-fluid">
	<div class="span2">
		{if $is_account_user}
			<a href="{$ACTION_URLS.search}save_last_search/2" rel="nofollow" target="action_iframe" title="Save Search">Save this Search</a>
		{else}
			<a href="{$ACTION_URLS.account}" data-action="account-login" title="Login To Save Search">Save this Search</a>
		{/if}
	</div>
	<div class="span2">
		<a href="#" class="property-bin-toggle">Property Bin <span class="property-bin-count"></span></a>
	</div>
	<div class="span8 search-results-paging">
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
			<a href="{$page_manager_obj->get_first_page_url()}" title="First Page" class="search-results-paging-first">First</a>
		{/if}
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
			<a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1))}" class="search-results-paging-previous" title="Previous Page">Previous</a>
		{/if}
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false }<a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1))}" title="Page {$page_manager_obj->get_current_page_num(-1)}">{$page_manager_obj->get_current_page_num(-1)}</a> | {/if}<span class="search-results-paging-current">{$page_manager_obj->get_current_page_num()}</span>{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1)) ne false } | <a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1))}" title="Page {$page_manager_obj->get_current_page_num(1)}">{$page_manager_obj->get_current_page_num(1)}</a>{/if}{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) eq false && $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(2)) ne false} | <a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(2))}" title="Page {$page_manager_obj->get_current_page_num(2)}">{$page_manager_obj->get_current_page_num(2)}</a>{/if} of <a href="{$page_manager_obj->get_last_page_url()}" title="Last Page">{$page_manager_obj->get_total_pages()}</a>
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1)) ne false}
			<a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1))}" class="search-results-paging-next" title="Next Page">Next</a>
		{/if}
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(3)) ne false}
			<a href="{$page_manager_obj->get_last_page_url()}" title="Last Page" class="search-results-paging-last">Last</a>
		{/if}
	</div>
</div>

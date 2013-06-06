<div class="row-fluid">
	<form method="post" action="{$ACTION_URLS.search}" class="span3 margin-bottom-0">
		<label>Sort By:</label>
		<select class="SearchSortFields span12 margin-0">
			<option value="list_price"{if $last_order_by eq "list_price"} selected="selected"{/if}>Price (Low to High)</option>
			<option value="list_price/descending"{if $last_order_by eq "list_price/descending"} selected="selected"{/if}>Price (High to Low)</option>
			<option value="date_entered/descending"{if $last_order_by eq "date_entered/descending"} selected="selected"{/if}>Listing Date (Newest)</option>
			<option value="bedrooms_total/descending"{if $last_order_by eq "bedrooms_total/descending"} selected="selected"{/if}>Beds (High to Low)</option>
			<option value="bedrooms_total"{if $last_order_by eq "bedrooms_total"} selected="selected"{/if}>Beds (Low to High)</option>
			<option value="bathrooms_full/descending"{if $last_order_by eq "bathrooms_full/descending"} selected="selected"{/if}>Baths (High to Low)</option>
			<option value="bathrooms_full"{if $last_order_by eq "bathrooms_full"} selected="selected"{/if}>Baths (Low to High)</option>
			{if isset($search_narrowers.WKTDistancePoint)}
				<option value="geodistance"{if $last_order_by eq "geodistance"} selected="selected"{/if}>Distance</option>
			{/if}
		</select>
    </form>
	<form method="post" action="{$ACTION_URLS.search}" class="span2 margin-bottom-0">
		<label class="bold">Per Page:</label>
		<select class="PageCountNumber span12 margin-0">
			 <option value="12"{if $page_manager_obj->get_count() eq 12} selected="selected"{/if}>12</option>
			 <option value="24"{if $page_manager_obj->get_count() eq 24} selected="selected"{/if}>24</option>
			 <option value="36"{if $page_manager_obj->get_count() eq 36} selected="selected"{/if}>36</option>
			 <option value="48"{if $page_manager_obj->get_count() eq 48} selected="selected"{/if}>48</option>
		</select>        
	</form>
	<div class="span3">
		{if $is_account_user}
			<a href="{$ACTION_URLS.search}save_last_search/2" rel="nofollow" target="action_iframe" title="Save Search">Save this Search</a>
		{else}
			<a href="{$ACTION_URLS.account}" data-action="account-login" title="Login To Save Search">Save this Search</a>
		{/if}
	</div>
	<div class="span4 search-results-paging">
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
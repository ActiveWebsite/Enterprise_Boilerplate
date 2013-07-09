<div class="row">
	<form method="post" action="{$ACTION_URLS.search}" class="col-sm-3 col-lg-3 margin-bottom-0">
		<label class="bold margin-bottom-0">Sort By:</label>
		<select class="SearchSortFields margin-0">
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
    <form method="post" action="{$ACTION_URLS.search}" class="col-sm-2 col-lg-2 margin-bottom-0">
		<label class="bold margin-bottom-0">Per Page:</label>
		<select class="PageCountNumber margin-0">
			 <option value="12"{if $page_manager_obj->get_count() eq 12} selected="selected"{/if}>12</option>
			 <option value="24"{if $page_manager_obj->get_count() eq 24} selected="selected"{/if}>24</option>
			 <option value="36"{if $page_manager_obj->get_count() eq 36} selected="selected"{/if}>36</option>
			 <option value="48"{if $page_manager_obj->get_count() eq 48} selected="selected"{/if}>48</option>
		</select>        
	</form>
	<div class="col-sm-7 col-lg-7">
		<label class="block">&nbsp;</label>
		<ul class="pagination no-margin pull-right">
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
				<li><a href="{$page_manager_obj->get_first_page_url()}">First</a></li>
			{/if}
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
				<li><a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1))}">Prev</a></li>
			{/if}
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
				<li><a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1))}">{$page_manager_obj->get_current_page_num(-1)}</a></li>
			{/if}
			<li class="disabled"><span>{$page_manager_obj->get_current_page_num()}</span></li>
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1)) ne false }
				<li><a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1))}">{$page_manager_obj->get_current_page_num(1)}</a></li>
			{/if}
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) eq false && $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(2)) ne false}
				<li><a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(2))}">{$page_manager_obj->get_current_page_num(2)}</a></li>
			{/if}
			<li class="disabled"><span>...</span></li>
			<li><a href="{$page_manager_obj->get_last_page_url()}">{$page_manager_obj->get_total_pages()}</a></li>
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1)) ne false}
				<li><a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1))}">Next</a></li>
			{/if}
			{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(3)) ne false}
				<li><a href="{$page_manager_obj->get_last_page_url()}">Last</a></li>
			{/if}
		</ul>
	</div>
</div>

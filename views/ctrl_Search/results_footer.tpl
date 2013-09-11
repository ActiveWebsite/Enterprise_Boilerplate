<div class="row">
	<div class="col-sm-6 col-md-2">
		{if $is_account_user}
			<a href="{$ACTION_URLS.search}save_last_search/2" rel="nofollow" target="action_iframe" title="Save Search">Save Search</a>
		{else}
			<a href="{$ACTION_URLS.account}" data-action="account-login" title="Login To Save Search">Save Search</a>
		{/if}
	</div>
	<div class="col-sm-6 col-md-3">
		<a href="#" class="property-bin-toggle">Property Bin <span class="property-bin-count"></span></a>
	</div>
	<div class="col-sm-12 col-md-7">
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

<div class="row-fluid">
	<div class="span3 offset9 Paging">
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
			<a href="{$page_manager_obj->get_first_page_url()}" title="First Page" class="pagingFirst">First</a>
		{/if}
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false}
			<a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1))}" class="pagingPrev" title="Previous Page">Previous</a>
		{/if}
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) ne false }<a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1))}" title="Page {$page_manager_obj->get_current_page_num(-1)}">{$page_manager_obj->get_current_page_num(-1)}</a> | {/if}<span class="currentPage">{$page_manager_obj->get_current_page_num()}</span>{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1)) ne false } | <a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1))}" title="Page {$page_manager_obj->get_current_page_num(1)}">{$page_manager_obj->get_current_page_num(1)}</a>{/if}{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(-1)) eq false && $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(2)) ne false} | <a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(2))}" title="Page {$page_manager_obj->get_current_page_num(2)}">{$page_manager_obj->get_current_page_num(2)}</a>{/if} of <a href="{$page_manager_obj->get_last_page_url()}" title="Last Page">{$page_manager_obj->get_total_pages()}</a>
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1)) ne false}
			<a href="{$page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(1))}" class="pagingNext" title="Next Page">Next</a>
		{/if}
		{if $page_manager_obj->get_page_url($page_manager_obj->get_current_page_num(3)) ne false}
			<a href="{$page_manager_obj->get_last_page_url()}" title="Last Page" class="pagingLast">Last</a>
		{/if}
	</div>
</div>

<div class="row" id="site-search-page">
	<div class="col-sm-3 col-lg-3 site-sidebar hidden-print">
		<div class="site-search-sidebar-facets" id="sidebar-main-nav-list">
			<h2>Site Search Results</h2>
			{if $facets}
				{foreach from=$facets item=count key=facet}
					{if $count > 0}
						<ul class="nav nav-list">
							<li>
								<a href="?q={$current_term}&amp;f={$facet}">{$facet}{if $facet != $current_facet} <span class="facet-count">({$count})</span>{/if}</a>
								{if $facet == $current_facet}
									{foreach from=$sub_facets item=sub_count key=sub_facet}
										<ul>
											{if $sub_count > 0 && $sub_facet != $current_facet}
												<li>
													<a href="?q={$current_term}&amp;f={$current_facet}&amp;sf={$sub_facet}">{$sub_facet} <span class="facet-count">({$sub_count})</span></a>
												</li>
											{/if}
										</ul>
									{/foreach}
								{/if}
							</li>
						</ul>
					{/if}
				{/foreach}
			{/if}
		</div>
	</div>
	<div class="col-sm-9 col-lg-9">
		<ul class="breadcrumb">
			<li><a href="/" title="Home">Home</a></li>
			<li class="active">Site Search Results</li>
		</ul>
		<h1 class="page-heading">Site Search</h1>
		<form method="get" action="/{$controller_alias}/" class="row">
			<div class="col-sm-10 col-lg-10">
				<input type="search" name="q" value="" placeholder="Enter Search Term(s)">
			</div>
			<div class="col-sm-2 col-lg-2">
				<button type="submit" class="btn btn-primary btn-block">Search</button>
			</div>
		</form>
		<hr>
		{if $results}
			<ul class="breadcrumb site-search-current-terms">
				{if !$current_facet && !$current_sub_facet}
					<li class="site-search-remove-facet"><a href="/{$controller_alias}/">{$current_term|replace:'+':' '} <i class="icon icon-remove-circle"></i></a></li>
				{else}
					<li><a href="/{$controller_alias}/?q={$current_term}">{$current_term}</a></li>
				{/if}
				{if $current_facet}
					{if !$current_sub_facet}
						<li class="site-search-remove-facet"><a href="/{$controller_alias}/?q={$current_term}">{$current_facet|replace:'+':' '} <i class="icon icon-remove-circle"></i></a></li>
					{else}
						<li><a href="/{$controller_alias}/?q={$current_term}&amp;f={$current_facet}">{$current_facet|replace:'+':' '}</a></li>
					{/if}
				{/if}
				{if $current_sub_facet}
					<li class="site-search-remove-facet"><a href="/{$controller_alias}/?q={$current_term}&amp;f={$current_facet}">{$current_sub_facet|replace:'+':' '} <i class="icon icon-remove-circle"></i></a></li>
				{/if}
			</ul>
		{/if}
		{if $results}
			<div class="row">
				<div class="col-sm-5 col-lg-5">
					<p class="site-search-showing">Showing <strong>{$paging.offset} - {$paging.current_page_count}</strong> of <strong>{$paging.total_results|number_format}</strong> results.</p>
				</div>
				<div class="col-sm-7 col-lg-7">
					<ul class="pagination pagination-small pull-right no-margin">
						{if $paging.first}
							<li><a href="{$paging.first}" title="First Page">First</a></li>
						{/if}
						{if $paging.prev}
							<li><a href="{$paging.prev}" title="Previous Page">Previous</a></li>
						{/if}
						{if $paging.page_number_group}
							{foreach from=$paging.page_number_group item=page name=paging_loop}
								{if $paging.current_page == $page.page_number}
									<li class="active"><a href="{$page.url}" title="Page {$page.page_name}">{$page.page_name}</a></li>
								{else}
									<li><a href="{$page.url}" title="Page {$page.page_name}">{$page.page_name}</a></li>
								{/if}
							{/foreach}
						{/if}
						{if $paging.next}
							<li><a href="{$paging.next}" title="Next Page">Next</a></li>
						{/if}
						{if $paging.last}
							<li><a href="{$paging.last}" title="Last Page">Last</a></li>
						{/if}
					</ul>
				</div>
			</div>
			<hr>
		{/if}
		{if $results}
			{foreach from=$results key=index item=result name=result_loop}
				{if $result.type == "Content"}
					<div class="row site-search-item">						
						<div class="col-sm-2 col-lg-2">
							<a href="{$result.url}">{if $result.picUrl}<img class="img-responsive" src="{$result.picUrl}/maxwidth/126" alt="">{/if}</a>
						</div>
						<div class="col-sm-10 col-lg-10">
							<div class="site-search-item-top clearfix">
								<span class="site-search-score">Score: {$result.score}</span>
								<a class="site-search-item-title" href="{$result.url}">{$result.name}</a>
							</div>
							{if $result.bio}<p class="site-search-text">{$result.bio}</p>{/if}
						</div>
					</div>					
				{elseif $result.type == "Property"}
					<div class="row site-search-item">						
						<div class="col-sm-2 col-lg-2">
							<a href="{$result.url}">{if $result.picUrl}<img class="img-responsive" src="{$result.picUrl}/maxwidth/126" alt="">{/if}</a>
						</div>
						<div class="col-sm-10 col-lg-10">
							<div class="site-search-item-top clearfix">
								<span class="site-search-score">Score: {$result.score}</span>
								<a class="site-search-item-title" href="{$result.url}">{$result.name}</a>
							</div>
							{if $result.bio}<p class="site-search-text">{$result.bio}</p>{/if}
							<p>
								<strong>${$result.price|number_format}</strong>
								{if $result.beds} | {$result.beds|clean_bed_bath} Bed{/if}
								{if $result.baths} | {$result.baths|clean_bed_bath} Bath{/if}
								{if $result.sqFt} | {$result.sqFt|number_format} sqft{/if}
							</p>
						</div>
					</div>					
				{elseif $result.type == "Realtors And Teams"}
					<div class="row site-search-item">						
						<div class="col-sm-2 col-lg-2">
							<a href="{$result.url}">{if $result.picUrl}<img class="img-responsive" src="{$result.picUrl}/maxwidth/126" alt="">{/if}</a>
						</div>
						<div class="col-sm-10 col-lg-10">
							<div class="site-search-item-top clearfix">
								<span class="site-search-score">Score: {$result.score}</span>
								<a class="site-search-item-title" href="{$result.url}">{$result.name}</a>
							</div>
							{if $result.bio}<p class="site-search-text">{$result.bio}</p>{/if}
							{if $result.phoneNumbers}
								<p>
								{foreach from=$result.phoneNumbers name=phoneloop item=number key=type}
									<strong>{$type}</strong>: {$number}{if !$smarty.foreach.phoneloop.last}<br />{/if}
								{/foreach}
								</p>
							{/if}
						</div>
					</div>					
				{elseif $result.type == "Blog"}
					<div class="row site-search-item">						
						<div class="col-sm-2 col-lg-2">
							<a href="{$result.url}">{if $result.picUrl}<img class="img-responsive" src="{$result.picUrl}/maxwidth/126" alt="">{/if}</a>
						</div>
						<div class="col-sm-10 col-lg-10">
							<div class="site-search-item-top clearfix">
								<span class="site-search-score">Score: {$result.score}</span>
								<a class="site-search-item-title" href="{$result.url}">{$result.name}</a>
							</div>
							{if $result.bio}<p class="site-search-text">{$result.bio}</p>{/if}
							<p><strong><em>{$result.date}</em></strong></p>
						</div>
					</div>					
				{elseif $result.type == "Office"}
					<div class="row site-search-item">						
						<div class="col-sm-2 col-lg-2">
							<a href="{$result.url}">{if $result.picUrl}<img class="img-responsive" src="{$result.picUrl}/maxwidth/126" alt="">{/if}</a>
						</div>
						<div class="col-sm-10 col-lg-10">
							<div class="site-search-item-top clearfix">
								<span class="site-search-score">Score: {$result.score}</span>
								<a class="site-search-item-title" href="{$result.url}">{$result.name}</a>
							</div>
							{if $result.bio}<p class="site-search-text">{$result.bio}</p>{/if}
							{if $result.phoneNumbers}
								<p>
								{foreach from=$result.phoneNumbers name=phoneloop item=number key=type}
									<strong>{$type}</strong>: {$number}{if !$smarty.foreach.phoneloop.last}<br />{/if}
								{/foreach}
								</p>
							{/if}
						</div>
					</div>					
				{elseif $result.type == "Community"  || $result.type == "Communities"  || $result.type == "Neighborhoods"}
					<div class="row site-search-item">						
						<div class="col-sm-2 col-lg-2">
							<a href="{$result.url}">{if $result.picUrl}<img class="img-responsive" src="{$result.picUrl}/maxwidth/126" alt="">{/if}</a>
						</div>
						<div class="col-sm-10 col-lg-10">
							<div class="site-search-item-top clearfix">
								<span class="site-search-score">Score: {$result.score}</span>
								<a class="site-search-item-title" href="{$result.url}">{$result.name}</a>
							</div>
							{if $result.bio}<p class="site-search-text">{$result.bio}</p>{/if}
							<p><strong><em>{$result.date}</em></strong></p>
						</div>
					</div>					
				{/if}
				{if !$smarty.foreach.result_loop.last}<hr>{/if}				
			{/foreach}
		{else}
			<p>No Results Found{if $current_term} for <strong>{$current_term}</strong>{if $current_facet} in <strong>{$current_facet|replace:'+':' '}</strong>{/if}{if $current_sub_facet} -> <strong>{$current_sub_facet|replace:'+':' '}</strong>{/if}{/if}</p>
		{/if}
	</div>
</div>
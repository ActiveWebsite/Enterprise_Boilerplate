Breadcrumbs
===========

You should pretty much just leave the breadcrumbs alone. Obviously you can format them but we recommend that you don't.

If you need to do special breadcrumbs for a page use the render_layout_arguments option like so

	{render_layout_arguments var="render_page_breadcrumbs"}
		<ul class="breadcrumb">
			<li><a href="/" title="Home">Home</a> <span class="divider">&gt;</span></li>  
			<li>Custom Name</li>
		</ul>
	{/render_layout_arguments}
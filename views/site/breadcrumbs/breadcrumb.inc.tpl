<ul class="breadcrumb">
	<li><a href="/" title="Home">Home</a></li>  
	{if $TOP_LEVEL_PERSISTENCE_URI}
		<li><a href="{$TOP_LEVEL_PERSISTENCE_URI}" title="{$TOP_LEVEL_PERSISTENCE_NAME}">{$TOP_LEVEL_PERSISTENCE_NAME}</a></li>
	{/if}
	{if $controller_obj instanceOf ctrl_Something}
		<li class="active">{$SECOND_LEVEL_PERSISTENCE_NAME}</li>
	{elseif $controller_obj instanceOf ctrl_SomethingElse}
		{* do stuff here *}
	{else}
		{if $SECOND_LEVEL_PERSISTENCE_URI}
			{if $controller_obj->cms_page && $controller_obj->cms_page->uri != $TOP_LEVEL_PERSISTENCE_URI && $controller_obj->cms_page->uri != $SECOND_LEVEL_PERSISTENCE_URI}
				<li><a href="{$SECOND_LEVEL_PERSISTENCE_URI}" title="{$SECOND_LEVEL_PERSISTENCE_NAME}">{$SECOND_LEVEL_PERSISTENCE_NAME}</a></li>
			{elseif $controller_obj->called_controller->cms_page && !$controller_obj instanceOf ctrl_OpenHouse && $controller_obj->called_controller->cms_page->uri != $TOP_LEVEL_PERSISTENCE_URI && ($THIRD_LEVEL_PERSISTENCE_NAME || $THIRD_LEVEL_PERSISTENCE_NAME != '')}
				<li><a href="{$SECOND_LEVEL_PERSISTENCE_URI}" title="{$SECOND_LEVEL_PERSISTENCE_NAME}">{$SECOND_LEVEL_PERSISTENCE_NAME}</a></li>
			{else}
				<li class="active">{$SECOND_LEVEL_PERSISTENCE_NAME}</li>										
			{/if}
		{/if}
		{if $controller_obj->cms_page && $controller_obj->cms_page->uri != $TOP_LEVEL_PERSISTENCE_URI && $controller_obj->cms_page->uri != $SECOND_LEVEL_PERSISTENCE_URI}
			<li class="active">{$controller_obj->cms_page->name}</li>
		{elseif $controller_obj->called_controller->cms_page && $controller_obj->called_controller->cms_page->uri != $TOP_LEVEL_PERSISTENCE_URI && $controller_obj->called_controller->cms_page->uri != $SECOND_LEVEL_PERSISTENCE_URI}
			<li class="active">{$controller_obj->called_controller->cms_page->name}</li>
		{elseif $CURRENT_CMS_PAGE_LABEL && ($controller_obj->cms_page && ($controller_obj->cms_page->name != $CURRENT_CMS_PAGE_LABEL))}
			<li class="active">{$CURRENT_CMS_PAGE_LABEL}</li>
		{/if}
		{if $THIRD_LEVEL_PERSISTENCE_NAME}
			{if $THIRD_LEVEL_PERSISTENCE_URI}
				<li><a href="{$THIRD_LEVEL_PERSISTENCE_URI}" title="{$THIRD_LEVEL_PERSISTENCE_NAME}">{$THIRD_LEVEL_PERSISTENCE_NAME}</a></li>
			{else}
				<li class="active">{$THIRD_LEVEL_PERSISTENCE_NAME}</li>
			{/if}
		{/if}
		{if $FINAL_LEVEL_PERSISTENCE_NAME}
			{if $FINAL_LEVEL_PERSISTENCE_URI}
				<li><a href="{$FINAL_LEVEL_PERSISTENCE_URI}" title="{$FINAL_LEVEL_PERSISTENCE_NAME}">{$FINAL_LEVEL_PERSISTENCE_NAME}</a></li>
			{else}
				<li class="active">{$FINAL_LEVEL_PERSISTENCE_NAME}</li>
			{/if}
		{/if}
	{/if}
</ul>
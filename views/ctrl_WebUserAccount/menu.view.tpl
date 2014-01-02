<div id="web-user-account-menu">
	<ul class="nav nav-pills nav-justified">
		{foreach item=label key=url from=$menu name=accountMenu}
            <li{if ($controller_obj->URL.url_raw == $url) || (trim( $url, '/' ) != '' && strpos( $controller_obj->URL.url_raw, trim($url,'/') ) !== false && (strlen($controller_obj->URL.url_raw) - strlen($url.length)) < 3)} class="active"{elseif $CURRENT_CMS_PAGE_LABEL == $label} class="active"{elseif $controller_obj->URL.url_raw|replace:'/':'' == $url|replace:'/':''} class="active"{/if}>
                <a href="{$url}" title="{$label|replace:'Preferred':''|clean_for_attribute}">{$label|replace:'Preferred':''}</a>
            </li>
		{/foreach}
	</ul>
</div>
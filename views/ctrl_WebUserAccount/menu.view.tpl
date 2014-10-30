<nav class="navbar navbar-account" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#account-menu-nav">
			<span class="sr-only">Toggle navigation</span>
			<span class="upper gotham-light pull-left menu-text">{$account_area_brand_name} Menu <i class="icon icon-angle-down"></i></span>
			<span class="pull-right">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</span>
		</button>
	</div>
	<div class="collapse navbar-collapse" id="account-menu-nav">
		<ul class="nav navbar-nav">
			{foreach item=label key=url from=$menu name=accountMenu}
				<li{if ($controller_obj->URL.url_raw == $url) || (trim( $url, '/' ) != '' && strpos( $controller_obj->URL.url_raw, trim($url,'/') ) !== false && (strlen($controller_obj->URL.url_raw) - strlen($url.length)) < 3)} class="active"{elseif $CURRENT_CMS_PAGE_LABEL == $label} class="active"{elseif $controller_obj->URL.url_raw|replace:'/':'' == $url|replace:'/':''} class="active"{elseif $url == "/account/searches/" && $controller_obj->URL.url_raw|strpos:"edit_search"} class="active"{/if}>
					<a href="{$url}" title="{$label|clean_for_attribute}">{$label}</a>
				</li>
			{/foreach}
		</ul>
	</div>
</nav>
{*
non hamburger version
<div id="web-user-account-menu">
	<ul class="nav nav-pills nav-justified">
		{foreach item=label key=url from=$menu name=accountMenu}
            <li{if ($controller_obj->URL.url_raw == $url) || (trim( $url, '/' ) != '' && strpos( $controller_obj->URL.url_raw, trim($url,'/') ) !== false && (strlen($controller_obj->URL.url_raw) - strlen($url.length)) < 3)} class="active"{elseif $CURRENT_CMS_PAGE_LABEL == $label} class="active"{elseif $controller_obj->URL.url_raw|replace:'/':'' == $url|replace:'/':''} class="active"{/if}>
                <a href="{$url}" title="{$label|replace:'Preferred':''|clean_for_attribute}">{$label|replace:'Preferred':''}</a>
            </li>
		{/foreach}
	</ul>
</div>
*}
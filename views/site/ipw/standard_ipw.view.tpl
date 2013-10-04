<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{$SEO_ENGINE_OPTIMIZER->GetTitle()}</title>
		<meta name="keywords" content="{$SEO_ENGINE_OPTIMIZER->GetKeywords()}">
		<meta name="description" content="{$SEO_ENGINE_OPTIMIZER->GetDesc()}">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		{if $browser_info && $browser_info.browser == 'IE'}<meta http-equiv="X-UA-Compatible" content="IE=edge">{/if}
		{$SEO_ENGINE_OPTIMIZER->robots_tag()}
		{if $SITE_OWNER instanceof Company && $SITE_OWNER->get_config('Google Webmaster Tools Verify') != '0'}<meta name="google-site-verification" content="{$SITE_OWNER->get_config('Google Webmaster Tools Verify')}">{/if}
		{if $SITE_OWNER instanceof Company && $SITE_OWNER->get_config('Yahoo Site Explorer Verify') != '0'}<meta name="y_key" content="{$SITE_OWNER->get_config('Yahoo Site Explorer Verify')}">{/if}
		
		{if $fullStreetAddress}
			<meta property="og:title" content="{$site_owner_extended.fullStreetAddress|clean_for_attribute}">
		{/if}
		{if $site_owner_extended.photos && $site_owner_extended.photos[0]}
			<meta property="og:image" content="{$site_owner_extended.photos[0]}maxwidth/300">
		{/if}
		{if $site_owner_extended.remarks}
			<meta property="og:description" content="{$site_owner_extended.remarks|strip_tags|clean_for_attribute|truncate:300}">
		{/if}

		<link rel="canonical" href="{$HTTP_HOST}/property/{$company_property_id}/{$fullStreetAddress|clean_for_url}">

		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="/rss/">
		<link rel="shortcut icon" href="/images/favicon.ico">
		<link rel="stylesheet" href="/css/ipw_styles.min.css">
		<script src="/js/modernizer/modernizr.2.6.2.custom.js"></script>
		{$JQUERY_HEADER}
		{$PAGE_HEADER}
	</head>
	<body class="{$browser_info.browser_css_class}">
		
		<div class="navbar">
			<div class="container">
				<nav class="navbar navbar-default hidden-print">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a href="/" class="navbar-brand"><img src="http://placehold.it/166x50" alt=""></a>
					</div>
					<div class="collapse navbar-collapse navbar-main-collapse">
						<ul class="nav navbar-nav">
							{foreach from=$ROOT_SITE_MENU item=label key=url name=mainNavLoop}
								<li{if $controller_obj->cms_page->uri == $url || $url == $TOP_LEVEL_PERSISTENCE_URI || $controller_obj->called_controller->cms_page->uri == $url || ($url == '/' && $isHomePage)} class="active"{/if}>
									<a title="{$label|clean_for_attribute}" href="{$url}" {if strpos($url, 'http://') !== false}target="_blank"{/if}>{$label|replace:'& ':'&amp; '}</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</nav>
			</div>
		</div>

		{if $isHomePage}
			{$PAGE_YIELD}
		{else}
			<div class="row">
				<div class="col-sm-9 col-lg-9">
					{$PAGE_YIELD}
				</div>
				<div class="col-sm-3 col-lg-3">
					<h2>Sidebar</h2>
				</div>
			</div>
		{/if}

		<img src="/images/ajax-loader.gif" alt="Loading..." class="hidden">

		<script src="/js/min/actions.min.js"></script>

		{$PAGE_FOOTER}

		<span id="media-query-holder"></span>

		{$GA_CODE->getCode($SITE_OWNER)}
		{$GA_CODE->getjQueryGoalJS()}

		<!--[if lt IE 9]>
			<script src="/js/libs/twitter_bootstrap/respond/respond.min.js"></script>
			<script src="/js/libs/twitter_bootstrap/respond/ie-row-fix.js"></script>
		<![endif]-->
		<!--[if lt IE 10]>
			<script src="/js/search/jquery.placeholder-polyfill.min.js"></script>
		<![endif]-->
	</body>
</html>

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
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="/rss/">
		<link rel="shortcut icon" href="/images/favicon.ico">
		<link rel="stylesheet" href="/css/ipw_styles.min.css">
		<script src="/js/modernizer/modernizr.2.6.2.custom.js"></script>
		<!--[if lt IE 9]>
			<script src="/js/libs/twitter_bootstrap/respond/respond.min.js"></script>
		<![endif]-->
		{$JQUERY_HEADER}
		{$PAGE_HEADER}
	</head>
	<body class="{$browser_info.browser_css_class}">
		
		<div class="navbar">
			<div class="container">
				<div class="nav-collapse collapse">
					<ul class="nav navbar-nav" id="boojstrap-menu">
						{foreach from=$ROOT_SITE_MENU item=label key=url name=mainNavLoop}
							<li>
								<a {if $controller_obj->cms_page->uri == $url || $url == $TOP_LEVEL_PERSISTENCE_URI || $controller_obj->called_controller->cms_page->uri == $url || ($url == '/' && $isHomePage)}class="active"{/if} title="{$label|clean_for_attribute}" href="{$url}" {if strpos($url, 'http://') !== false}target="_blank"{/if}>{$label|replace:'& ':'&amp; '}</a>
							</li>
						{/foreach}
					</ul>
				</div>
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
		</div>

		{if $isHomePage}
			<div class="row">
				<div class="col-12">
					{$PAGE_YIELD}
				</div>
			</div>
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
		<script src="/js/libs/twitter_bootstrap/collapse.js"></script>	

		{$PAGE_FOOTER}

		<span id="media-query-holder"></span>

		{$GA_CODE->getCode($SITE_OWNER)}
		{$GA_CODE->getjQueryGoalJS()}
	</body>
</html>

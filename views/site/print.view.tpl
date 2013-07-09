<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>{$SEO_ENGINE_OPTIMIZER->GetTitle()}</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	{if $browser_info && $browser_info.browser == 'IE'}<meta http-equiv="X-UA-Compatible" content="IE=edge">{/if}
	<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/css/company_styles.min.css">
	<script src="/js/modernizer/modernizr.2.6.2.custom.js"></script>
	<!--[if lt IE 9]>
		<script src="/js/libs/twitter_bootstrap/respond/respond.min.js"></script>
	<![endif]-->
	{$PAGE_HEADER}
	{literal}
	<style>
		body {
			background: #fff;
			padding: 15px;
			margin: 0;
		}
	</style>
	{/literal}
</head>
<body onload="window.print();" class="{$browser_info.browser_css_class}">
	<div id="Wrapper">
		<div id="Header">
		
		</div>
		<div id="PrintWrapper">
			{$PAGE_YIELD}
		</div>
	</div>
	<div id="footerCopyright">
		<p>&copy;{$smarty.now|date_format:"%Y"} &lt;COMPANY NAME&gt;. All rights reserved.</p>
	</div>
	{$PAGE_FOOTER}
</body>
</html>
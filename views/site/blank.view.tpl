<!DOCTYPE html>
<html lang="en">
	<head>
		{if $browser_info && $browser_info.browser == 'IE'}<meta http-equiv="X-UA-Compatible" content="IE=edge">{/if}
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="/css/non_bootstrap_styles.min.css">
		<link rel="stylesheet" href="/css/company_styles.min.css">
		<script src="/js/modernizer/modernizr.2.6.2.custom.js"></script>
		{$JQUERY_HEADER}
		{$PAGE_HEADER}
		{literal}
		<style>
			body{
				padding:0;
				margin:0;
				background: #fff;
			}
		</style>
		{/literal}
		{if $browser_info && $browser_info.browser == 'IE' && $browser_info.version < 9}
			<script src="/js/libs/twitter_bootstrap/respond/respond.min.js"></script>
		{/if}
	</head>
	<body class="{$browser_info.browser_css_class}">
		{$PAGE_YIELD}
		{$PAGE_FOOTER}
		{literal}
		<script>
		jQuery(document).ready(function($) {
			if ($.fn.validate) {
				$('form.validate-form').each(function () {
					$(this).validate();
				});
			}
		});
		</script>
		{/literal}
		{if $browser_info && $browser_info.browser == 'IE' && $browser_info.version < 9}
			<script src="/js/libs/twitter_bootstrap/respond/ie-row-fix.js"></script>
		{/if}
		{if $browser_info && $browser_info.browser == 'IE' && $browser_info.version < 10}
			<script src="/js/search/jquery.placeholder-polyfill.min.js"></script>
		{/if}

		{$GA_CODE->getAnalyticsJSCode($SITE_OWNER)}
		<!-- override: BLANK VIEW -->
	</body>
</html>
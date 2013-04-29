<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    {if $browser_info && $browser_info.browser == 'IE'}<meta http-equiv="X-UA-Compatible" content="IE=edge">{/if}
	<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	{$JQUERY_HEADER}
	<link rel="stylesheet" href="/css/company_styles.min.css">
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
</head>
<body class="{$browser_info.browser_css_class}">
{$PAGE_YIELD}
{$PAGE_FOOTER}
{literal}
<script>
jQuery(document).ready(function($) {
	if ($.fn.validate) {
		$('form.validate-form').validate();
	}
});
</script>
{/literal}
<!-- override: BLANK VIEW -->
</body>
</html>
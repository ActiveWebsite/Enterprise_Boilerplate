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

        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <link rel="stylesheet" href="/css/ipw_styles.min.css">

        {$JQUERY_HEADER}

        {$PAGE_HEADER}
    </head>
    <body class="{$browser_info.browser_css_class}">

        {if $isHomePage}
            {$PAGE_YIELD}
        {else}
            <div class="row-fluid">
                <div class="span9">
                    {$PAGE_YIELD}
                </div>
                <div class="span3">

                </div>
            </div>
        {/if}

        <img src="/images/ajax-loader.gif" alt="Loading..." class="hidden">
        {* load any boojstrap libs *}
        {* load actions *}
        <script src="/js/actions.js"></script>
        {$PAGE_FOOTER}
        {$GA_CODE->getCode($SITE_OWNER)}
        {$GA_CODE->getjQueryGoalJS()}
    </body>
</html>

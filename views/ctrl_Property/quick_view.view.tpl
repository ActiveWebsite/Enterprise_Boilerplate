<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    {if $browser_info && $browser_info.browser == 'IE'}<meta http-equiv="X-UA-Compatible" content="IE=edge">{/if}
    <title>QuickView</title>
    <link rel="stylesheet" href="/css/non_bootstrap_styles.min.css">
    <link rel="stylesheet" href="/css/company_styles.min.css">
    {literal}
    <style>
        body{
            padding:0;
            margin:0;
            background: #fff;
            overflow: hidden;
        }
    </style>
    {/literal}
    {if $browser_info && $browser_info.browser == 'IE' && $browser_info.version < 9}
        <script src="/js/libs/twitter_bootstrap/respond/respond.min.js"></script>
    {/if}
</head>
<body>
<div id="quick-view-wrapper">
    <div class="row">
        <div class="col-sm-7">
            {if $photos}
                <div class="cycle-slideshow" data-cycle-log="false" data-cycle-center-horz="true" data-cycle-center-vert="true" data-cycle-swipe="true" data-cycle-timeout="0" data-cycle-prev="#qv-prev" data-cycle-next="#qv-next" data-cycle-loader="true" data-cycle-progressive="#qv-images">
                    {foreach from=$photos item=photo key=index}
                        {if $index < 3}
                            <img src="{$photo}/maxwidth/425/maxheight/280/" alt="">
                        {/if}
                    {/foreach}
                    <script id="qv-images" type="text/cycle">
                        {foreach from=$photos item=photo key=index}
                        {if $index > 3}<img src="{$photo}/maxwidth/425/maxheight/280" alt="">{/if}
                        {/foreach}
                    </script>
                </div>
                <div class="clearfix margin-top-5">
                    <a title="Previous Image" class="pull-left" id="qv-prev"><i class="icon icon-chevron-left"></i></a>
                    <a title="Next Image" class="pull-right" id="qv-next"><i class="icon icon-chevron-right"></i></a>
                </div>
            {/if}
        </div>
        <div class="col-sm-5">
            <h1>{$fullStreetAddress}</h1>
            <table class="quickview-data-table margin-bottom-30">
                <tbody>
                    {if $list_price}
                        <tr>
                            <td class="label-cell">List Price</td>
                            <td>{$list_price}</td>
                        </tr>
                    {/if}
                    <tr>
                        <td class="label-cell">MLS#</td>
                        <td>{$property_id}</td>
                    </tr>
                    {if $bedrooms_total && $bedrooms_total > 0}
                        <tr>
                            <td class="label-cell">Beds</td>
                            <td>{$bedrooms_total|clean_bed_bath}</td>
                        </tr>
                    {/if}
                    {if $bathrooms_total && $bathrooms_total > 0}
                        <tr>
                            <td class="label-cell">Baths</td>
                            <td>{$bathrooms_total|clean_bed_bath}</td>
                        </tr>
                    {/if}
                </tbody>
            </table>
            <div class="margin-bottom-30">
                <a class="btn btn-default" target="_parent" href="/property/{$company_property_id}/{$fullStreetAddress|clean_for_url}" title="View property at {$fullStreetAddress|clean_for_attribute}">Full Property Details &amp; Photos</a>
            </div>            
            {if $remarks}
                <p>{$remarks|strip_tags|truncate:300}</p>
            {/if}
        </div>
    </div>
</div>
<script src="/js/buildlist.js?scripts=/js/libs/jquery/jquery.js,/js/galleries/jquery.cycle2.swipe.min.js,/js/galleries/jquery.cycle2.min.js,/js/galleries/jquery.cycle2.center.min.js"></script>
{$GA_CODE->getAnalyticsJSCode($SITE_OWNER)}
</body>
</html>
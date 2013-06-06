<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    {if $browser_info && $browser_info.browser == 'IE'}<meta http-equiv="X-UA-Compatible" content="IE=edge">{/if}
    <title>QuickView</title>
    <link rel="stylesheet" href="/css/company_styles.min.css">
    <script src="/libs/booj-strap/lib/jquery.min.js"></script>
    <script>jQuery.noConflict();</script>
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
</head>
<body>
<div id="quick-view-wrapper">
    <div class="row-fluid">
        <div class="span7">
            {if $photos}
                <div class="gallery-widget" id="quick-view-gallery">
                    <div class="gallery-widget-main-photo-wrapper margin-bottom-30">
                        {foreach from=$photos item=photo key=index}
                            {if $index == 0}
                                <img src="{$photo}/maxwidth/375/maxheight/300" alt="Property Photo">
                            {/if}
                        {/foreach}
                    </div>
                    <ul class="gallery-widget-carousel">
                        {foreach from=$photos item=photo key=index}
                            <li><img src="{$photo}/crop/130,90" alt="Property Thumbnail"></li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
        <div class="span5">
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
                <a class="btn" target="_parent" href="/property/{$company_property_id}/{$fullStreetAddress|clean_for_url}" title="View property at {$fullStreetAddress|clean_for_attribute}">Full Property Details &amp; Photos</a>
            </div>            
            {if $remarks}
                <p>{$remarks|strip_tags|truncate:300}</p>
            {/if}
        </div>
    </div>
</div>
<script src="/js/buildlist.js?scripts=/js/carousels/jquery.jcarousel.min.js,/js/galleries/jquery.simpleCarouselGallery.2.0.min.js"></script>
{literal}
    <script>
        jQuery(window).load(function () {	
            setTimeout(function () {
                jQuery('#quick-view-gallery').simpleCarouselGallery({
                    animateHeight: true,
                    renderFullScreen: false,
                    expand_thumbs: false,
                    large_resize_method: '/maxwidth/375/maxheight/300',
                    thumb_resize_method: '/crop/130,90'
                });
            }, 500);
        });
    </script>
{/literal}
</body>
</html>
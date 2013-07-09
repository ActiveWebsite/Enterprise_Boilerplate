{if $community_association}
    <div class="row">
        <div class="col-sm-5 col-lg-5 margin-bottom-30">
            <h2><a href="{$ACTION_URLS.communities}{$community_association.community_dict.rebrand}/" title="View {$community_association.community_dict.name|clean_for_attribute}">{$community_association.community_dict.name}</a></h2>
            <div class="cms-page margin-bottom-30">
                {$community_association.community_dict.biography}
            </div>
            {if $community_association.zip && $community_association.state}
                <a class="btn btn-default fancybox" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="600" href="http://www.onboardnavigator.com/1.5/webcontent/OBWC_Results.aspx?AID={$smarty.const.ONBOARD_ID}&amp;Zip={$community_association.zip}&amp;State={$community_association.state}&amp;DataType=1">Learn More About This Community</a>
            {/if}
        </div>
        {if $community_association.photos.0}
            <div class="col-sm-7 col-lg-7">
                <img src="{$community_association.photos.0->getUrl()}/crop/460,304/quality/100" alt="Photo of {$community_association.community_dict.name|clean_for_attribute}">
            </div>
        {/if}
    </div>
{else}
    <p>We're sorry, but community information for this property could not be found.</p>
{/if}
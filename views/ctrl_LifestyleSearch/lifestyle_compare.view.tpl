<div id="communityCompareResultWrapper">
    <h3>{if $community_scores && isset($community_scores[0])} {$community_scores[0].area_name}{else}{$zip_code}{/if}</h3>
    {if $community_scores}
        <div class="row multi-columns-row">
            {foreach from=$community_scores item=attribute key=index}
                <div class="col-sm-6 col-md-6 col-lg-6 attributeWrapper clearfix">
                    <span class="attributeTitle">
                        {$attribute.pretty_name}
                        {if $attribute.label && $attribute.label == 'Urban / Dense Urban'}
                             <span class="attributeLabel">(Urban)</span>
                        {elseif $attribute.label && $attribute.label == 'Light Urban / City Feel'}
                             <span class="attributeLabel">(City Feel)</span>
                        {elseif $attribute.label && $attribute.label == 'Suburb / Small City'}
                             <span class="attributeLabel">(Suburb)</span>
                        {elseif $attribute.label && $attribute.label == 'Small Town'}
                             <span class="attributeLabel">(Small Town)</span>
                        {elseif $attribute.label && $attribute.label == 'Rural'}
                             <span class="attributeLabel">(Rural)</span>
                        {elseif $attribute.label && $attribute.label != 'na'}
                             <span class="attributeLabel">({$attribute.label})</span>
                        {/if}
                    </span>
                    {if $attribute.id == 'ATTR_043'}
                       ${$attribute.value|number_format}
                    {else}
                        <div class="attribute localCompare">
                            <div neighborhood="{$attribute.local_neighborhood_pct|replace:'0.1':'0'}" zip="{$attribute.local_zip_code_pct|replace:'0.1':'0'}" census="{$attribute.local_cencus_area_pct|replace:'0.1':'0'}" class="myCompareLocalAttributeValue attributeValue{if $attribute.local_neighborhood_pct > 99} attributeFullValue{/if}" style="width:{if $attribute.local_neighborhood_pct > 100}100{else}{$attribute.local_neighborhood_pct|replace:'0.1':'0'}{/if}%;"></div>
                        </div>
                        {if $attribute.national_pct != 'NA'}
                            <div class="attribute nationalCompare" style="display:none;">
                                <div class="attributeValue{if $attribute.national_pct > 99} attributeFullValue{/if}" style="width:{$attribute.national_pct|replace:'0.1':'0'}%;"></div>
                            </div>
                        {/if}
                        <div class="attribute myCommunityCompare" style="display:none;">
                            <div attribute="{$attribute.id}" value="{$attribute.value}" class="myCommunityCompareAttributeValue attributeValue" style="width:0%;"></div>
                        </div>
                    {/if}
                </div>
            {/foreach}
        </div>
    {else}
        <div class="alert alert-danger">We could not find any scores for the zip code "{$zip_code}"</div>
    {/if}
</div>
<div id="lifestyle-search-page">
	<div class="page-header clearfix">
	    <div class="lifestyle-social clearfix">
		   	<div class="fbLike">
		   		<iframe src="http://www.facebook.com/plugins/like.php?href={$HTTP_HOST}{$controller_alias}&amp;width=90&amp;action=like&amp;colorscheme=light&amp;height=20&amp;layout=button_count" scrolling="no" frameborder="0"{if $browser_info.browser == "IE"} allowTransparency="true"{/if}></iframe>
		   	</div>
			<a href="/popup/contact/send_properties_and_searches_form/u/subject/3/?label=Lifestyle Search&amp;referring_url={$HTTP_HOST}{$controller_alias}" target="_blank" class="fancybox pull-right margin-right-15" data-fancybox-type="iframe" data-fancybox-width="{$sendfriend_lb_size.width}" data-fancybox-height="{$sendfriend_lb_size.height}" rel="nofollow" title="Send to Friend"><i class="icon icon-envelope"></i> Send to Friend</a>
			<a href="/popup{$ACTION_URLS.contact}?lifestyleSearch=true" target="_blank" rel="nofollow" class="fancybox pull-right margin-right-15" data-fancybox-type="iframe" data-fancybox-width="{$feedback_lb_size.width}" data-fancybox-height="{$feedback_lb_size.height}" title="Feedback"><i class="icon icon-comment-alt"></i> Feedback</a>
	    </div>
	    <h1>Lifestyle Search</h1>
		<p>
			{if $site_owner_states && count($site_owner_states) > 1}
				What state, county or general area do you want to live in?
			{else}
				Our Lifestyle Search defaults to the {foreach from=$site_owner_states item=state_name key=state_id}{$state_name}{/foreach} area. To choose a more specific
				location, select a county{if $showCBSA} or metro area{/if} from the list{if $showCBSA}s{/if} below.
			{/if}
		</p>
	</div>
    {if $onboard_error}
		<div class="alert alert-danger">This service is temporarily unavailable.</div>
    {else}
		{include file=$index_header_path}
		<hr>
		<div class="row multi-columns-row">
			{math equation="(x-1) % 2" assign=even_attributes x=$filters|@count}
			{foreach from=$filters key=index item=filter  name=filterLoop}
				{if $filter.filter_id == 'ATTR_043'}
					<input type="hidden" value="{$filter.filter_id}" name="Filter_Name[]">
					<input type="hidden" value="{$filter.type}" name="{$filter.filter_id}_Type">
					<input type="hidden" value="{$filter.range}" name="{$filter.filter_id}_Range">
					<input class="filterValueField" type="hidden" value="0,15" name="{$filter.filter_id}_Value">
				{else}
					<div class="col-sm-6 col-md-6 col-lg-6 filter {if $filter.type == 1} type-1{elseif $filter.type == 2} type-2{/if} filter-{$filter.filter_id} margin-bottom-30 margin-top-30">
					    <div class="row">
							{if $filter.icon}
								{if $filter.filter_id == 'ATTR_044'}
									<div class="col-xs-2">
										<span id="densityIcon" class="filterIcon filterIcon_ATTR_046">&nbsp;</span>
									</div>
								{else}	
									<div class="col-xs-2">				   
										<span class="filterIcon filterIcon_{$filter.filter_id}">&nbsp;</span>
									</div>
								{/if}
							{/if}
							<div class="col-xs-10{if $filter.filter_id == 'ATTR_022'} bump-needs{/if}">
								<h4 class="margin-bottom-5">{$filter.title}</h4>
								<p class="filterDescription{if $filter.filter_id == 'ATTR_043'} tallFilterDescription{/if}">{$filter.description}</p>
								{if $filter.filter_id == 'ATTR_044'}
									<ul class="list-float">
									<li>
										<div class="radio">
											<label title="Classified as those areas with &gt;= 20,000 people per square mile.">
												<input title="Classified as those areas with &gt;= 20,000 people per square mile." type="radio" onclick="swapDensityLogo(this,'ATTR_044');" name="Density" value="ATTR_044">
												Urban
											</label>
										</div>
									</li>
									<li>
										<div class="radio">
											<label title="Classified as those areas with &gt;= 4,000 and &lt;20,000 people per square mile.">
												<input title="Classified as those areas with &gt;= 4,000 and &lt;20,000 people per square mile." type="radio" onclick="swapDensityLogo(this,'ATTR_045');" name="Density" value="ATTR_045">
												Light Urban
											</label>
										</div>
									</li>
									<li>
										<div class="radio">
											<label title="Classified as those areas with &gt;= 1,000 and &lt;4,000 people per square mile. ">
												<input title="Classified as those areas with &gt;= 1,000 and &lt;4,000 people per square mile. " type="radio" onclick="swapDensityLogo(this,'ATTR_046');" name="Density" value="ATTR_046" checked="checked">
												Suburb
										</label>
										</div>
									</li>
									<li>
										<div class="radio">
											<label title="Classified as those areas with &gt;= 50 and &lt;1,000 people per square mile.">
												<input title="Classified as those areas with &gt;= 50 and &lt;1,000 people per square mile." type="radio" onclick="swapDensityLogo(this,'ATTR_047');" name="Density" value="ATTR_047">
												Small Town
											</label>
										</div>
									</li>
									<li>
										<div class="radio">
											<label title="Classified as those areas with &lt;50 people per square mile.">
												<input title="Classified as those areas with &lt;50 people per square mile." type="radio" onclick="swapDensityLogo(this,'ATTR_048');" name="Density" value="ATTR_048">
												Rural
											</label>
										</div>
									</li>
						 		{/if}
						 	</div>
						</div>
						<div class="sliderWrapper">
							<div class="slider_track_wrapper clearfix">
								<div class="slider_track{if $filter.type == 2} slider_track_2{/if}"></div>
								<span class="filterMaxLabel">{$filter.max_label}</span>
								<span class="filterMinLabel">{$filter.min_label}</span>
							</div>
						</div>
						<input type="hidden" value="{$filter.filter_id}" name="Filter_Name[]">
						<input type="hidden" value="{$filter.type}" name="{$filter.filter_id}_Type">
						<input type="hidden" value="{$filter.range}" name="{$filter.filter_id}_Range">
						<input class="filterValueField" type="hidden" value="{$filter.value}" name="{$filter.filter_id}_Value">
				    </div>
				{/if}
			{/foreach}
		</div>
		<div class="searchButtonBottom text-center">
			<input type="submit" name="Submit" value="Search" class="btn btn-primary">
		</div>
		</form>		
    {/if}
</div>
<footer{if $smarty.const.NEW_FOOTER_PARSE_STRING === true}args{/if}>
	<div id="sliderInfoBubble" style="display:none;"><div id="sliderInfoInner"></div></div>
	<img src="/images/system/lifestyle_search/bubble.png" alt="" style="display:none;">
	<img src="/images/system/lifestyle_search/bubble_small.png" alt="" style="display:none;">
	<script src="/js/buildlist.js?scripts=/js/libs/jquery_ui/components/core.1.10.3.min.js,/js/libs/jquery_ui/components/mouse.1.10.3.min.js,/js/libs/jquery_ui/components/slider.1.10.3.min.js"></script>

	<script src="/js/lifestyle_search/jquery.lifestyle_search.min.js"></script>
	{literal}
	<script>
		var lifestyleSlidersObj, lifestyleLocationsObj;
		jQuery(document).ready(function($) {
			lifestyleSlidersObj = $('#lifestyle-search-page').lifestyleSliders().data('lifestyleSliders');
			lifestyleLocationsObj = $('#lifestyle-search-page').lifestyleLocations().data('lifestyleLocations');
			{/literal}
			{if $default_county}
				lifestyleLocationsObj.setCounty('{$default_county}');
			{/if}
			{if $default_cbsa}
				lifestyleLocationsObj.setCBSA('{$default_cbsa}');
			{/if}
			{literal}
			lifestyleLocationsObj.getCountyCBSA('#userStateSelect');
		});
		function swapDensityLogo(_rb, _attr) {
			if (_rb.checked) {
				jQuery('#densityIcon')[0].className = 'filterIcon filterIcon_' + _attr;
			}
		}
	</script>
	{/literal}
</footer{if $smarty.const.NEW_FOOTER_PARSE_STRING === true}args{/if}>
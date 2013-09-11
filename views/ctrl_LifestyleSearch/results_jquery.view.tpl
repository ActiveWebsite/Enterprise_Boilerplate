 <head>
 	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css">
	<link rel="stylesheet" href="/css/lifestyle_search/lifestyle.css">
</head>
<div id="controllerWrapper" class="initialSearchPage">
	<div id="fb_link_wrapper">
	   	<div class="fbLike"><iframe src="http://www.facebook.com/plugins/like.php?href={$HTTP_HOST}{$controller_alias}&amp;width=90&amp;action=like&amp;colorscheme=light&amp;height=20&amp;layout=button_count"{if $browser_info.browser == "IE"} allowTransparency="true"{/if}></iframe></div>
		<a href="/popup/contact/send_properties_and_searches_form/u/subject/3/?label=Lifestyle%20Search&amp;referring_url={$HTTP_HOST}{$controller_alias}" target="_blank" data-fancybox-type="iframe" data-fancybox-width="{$sendfriend_lb_size.width}" data-fancybox-height="{$sendfriend_lb_size.height}" class="fancybox iframe fancy-width-{$sendfriend_lb_size.width} fancy-height-{$sendfriend_lb_size.height} mailIcon" rel="nofollow" title="Send to Friend">Send to Friend</a>
		<a href="/popup{$ACTION_URLS.contact}?lifestyleSearch=true" target="_blank" rel="nofollow" data-fancybox-type="iframe" data-fancybox-width="{$feedback_lb_size.width}" data-fancybox-height="$feedback_lb_size.height}" class="fancybox iframe fancy-width-{$feedback_lb_size.width} fancy-height-{$feedback_lb_size.height} feedbackIcon" title="Feedback">Feedback</a>
     </div>
	<h1>Lifestyle Search Results</h1>
	<div class="clearAll">&nbsp;</div>
	{if isset($results.communities) && ($results.communities.neighborhood || $results.communities.zip_code || $results.communities.census_place)}
		<div id="lifestyle_compare">
			<ul id="compareDataBlock" class="list-inline">
				<li><strong>Compare to:</strong></li>
				<li><a href="#" title="Compare my area to the local data" class="compareButtons myCommunityCompareButton">My Area Data</a></li>
				<li class="listborder"><a href="#" class="compareButtons localCompareButton active_view" title="Compare to {foreach from=$site_owner_states item=state_name key=state_id}{if $results.selected_state == $state_id}{$state_name}{/if}{/foreach} data">{foreach from=$site_owner_states item=state_name key=state_id}{if $results.selected_state == $state_id}{$state_name}{/if}{/foreach} Data</a></li>
				<li class="listborder"><a href="#" title="Compare locations to national data" class="compareButtons nationalCompareButton">National Data</a></li>
			</ul>
			<h2 title="Click to compare where you live now" id="openCompareButton" class="compareClosed" style="display:none;">Hide Your Area</h2>
			
			<div class="clearAll">&nbsp;</div>
			
			<div id="compareElements" class="clearfix" style="display:none;">
				<div id="compareFormWrapper">
					<form method="post" class="form-inline" id="compareCommunityForm" action="{$controller_alias}compare">
						<div class="form-group">
							<label for="user_zip_field">Zip Code</label>
							<input id="user_zip_field" title="Enter your current Zip Code" type="text" class="form-control" value="" name="user_zip" style="width: 200px;">
						</div>
						<input type="submit" class="btn btn-primary" value="Compare">
						{if $results.attribute_maxes}
							{if $results.attribute_maxes.neighborhood}
								<input type="hidden" name="attributeOrder" value="{foreach name=maxlist from=$results.attribute_maxes.neighborhood item=attribute}{$attribute.id}{if !$smarty.foreach.maxlist.last}|{/if}{/foreach}">
							{elseif $results.attribute_maxes.zip_code}
								<input type="hidden" name="attributeOrder" value="{foreach name=maxlist from=$results.attribute_maxes.zip_code item=attribute}{$attribute.id}{if !$smarty.foreach.maxlist.last}|{/if}{/foreach}">
							{elseif $results.attribute_maxes.census_place}
								<input type="hidden" name="attributeOrder" value="{foreach name=maxlist from=$results.attribute_maxes.census_place item=attribute}{$attribute.id}{if !$smarty.foreach.maxlist.last}|{/if}{/foreach}">
							{/if}
							<input type="hidden" name="neighborhoodMaxes" value="{foreach name=maxlist from=$results.attribute_maxes.neighborhood item=attribute}{$attribute.id}|{$attribute.max}{if !$smarty.foreach.maxlist.last}|{/if}{/foreach}">
							<input type="hidden" name="zipCodeMaxes" value="{foreach name=maxlist from=$results.attribute_maxes.zip_code item=attribute}{$attribute.id}|{$attribute.max}{if !$smarty.foreach.maxlist.last}|{/if}{/foreach}">
							<input type="hidden" name="censusPlaceMaxes" value="{foreach name=maxlist from=$results.attribute_maxes.census_place item=attribute}{$attribute.id}|{$attribute.max}{if !$smarty.foreach.maxlist.last}|{/if}{/foreach}">
						{/if}
					</form>
				</div>
				<div id="compareResult" style="display:none;"></div>
			</div>
		</div>

		<div id="lifestyle_tabs" class="tabClass relative">
			
			<div id="modifySearch">
				<h2 id="modifySearchBtn" title="Click to modify your Lifestyle Search" class="modifySearchTriggerClass modifyClosed">Modify Lifestyle Search</h2>
			</div>

			<ul class="nav nav-tabs">
				{if $results.communities.neighborhood}<li class="active"><a href="#Neighborhoods" title="Open list tab">Neighborhoods ({$results.communities.neighborhood|@count})</a></li>{/if}
				{if $results.communities.zip_code}<li><a href="#Zip_Code" title="Open list tab">Zip Codes ({$results.communities.zip_code|@count})</a></li>{/if}
				{if $results.communities.census_place}<li><a href="#Census_Place" title="Open list tab">Census Areas ({$results.communities.census_place|@count})</a></li>{/if}
			</ul>

			<div class="tab-content">
				{if $results.communities.neighborhood}
					<div id="Neighborhoods" class="tab-pane active">
						<div class="orderDiv">
							<label>Sort By:</label>
							<select list="neigborhood_list" class="form-control lifestyleSortSelect" name="sort" style="width:auto;">
								<option value="Relevance">Relevance</option>
								{if $results.sort_filters}
									{foreach from=$results.sort_filters item=filter key=filter_id}
									    <option value="{$filter_id}">{$filter.name}</option>
									{/foreach}
								{/if}
							</select>
						</div>

						<hr>

						<div id="resultListWrapper1">
							<ul class="listViewResults" id="neigborhood_list">
								{foreach from=$results.communities.neighborhood name=main_community_loop item=community key=index}
									<li id="community_item_{$index}" class="sortableListElement onboardCommunity clearfix">
										<input type="hidden" name="Relevance[]" value="{$community.score}">

										<h2>
											<span class="rankNumber">#{$community.type_rank}</span>
											{if $community.neighborhood_info && isset($community.neighborhood_info.hood_name) && isset($community.neighborhood_info.market_name)}
												{$community.neighborhood_info.hood_name|lower|capitalize}{$cityStateFormat}{$community.neighborhood_info.market_name|lower|capitalize}, {$community.state_abbr}
											{else}
												{$community.name}
											{/if}
										</h2>
										<div class="row">
											{foreach from=$community.attributes name=attribute_loop item=attribute key=attribute_value}
												<div class="col-sm-6 attributeWrapper clearfix">
													<span class="attributeTitle">{$attribute.pretty_name}
														{if $attribute.label == 'Urban / Dense Urban'}
															<span class="attributeLabel">(Urban)</span>
														{elseif $attribute.label == 'Light Urban / City Feel'}
															<span class="attributeLabel">(Light Urban)</span>
														{elseif $attribute.label == 'Suburb / Small City'}
															<span class="attributeLabel">(Suburb)</span>
														{elseif $attribute.label == 'Small Town'}
															<span class="attributeLabel">(Small Town)</span>
														{elseif $attribute.label == 'Rural'}
															<span class="attributeLabel">(Rural)</span>
														{elseif $attribute.label != 'na'}
															<span class="attributeLabel">({$attribute.label})</span>
														{/if}
													</span>
													{if $attribute.id == 'ATTR_043'}
													   ${$attribute.value|number_format}
													{else}
														<div class="attribute localCompare">
															<div attribute="{$attribute.id}" max="{$attribute.max}" class="compareForMax attributeValue{if $attribute.local_pct > 99} attributeFullValue{/if}" style="width:{$attribute.local_pct|replace:'0.1':'0'}%;"></div>
														</div>
														{if $attribute.national_pct != 'NA'}
															<div class="attribute nationalCompare" style="display:none;">
																<div class="attributeValue{if $attribute.national_pct > 99} attributeFullValue{/if}" style="width:{$attribute.national_pct|replace:'0.1':'0'}%;"></div>
															</div>
														{/if}
														<div class="attribute myCommunityCompare" style="display:none;">
															<div attribute="{$attribute.id}" value="{$attribute.value}" max="{$attribute.max}" class="myCommunityAttributeValue attributeValue" style="width:0%;"></div>
														</div>
													{/if}
													<input type="hidden" name="{$attribute.id}[]" value="{$attribute.scr}">
												</div>												
											{/foreach}
										</div>
										{include file=$neighborhood_path}
									</li>
								{/foreach}
							</ul>
						</div>
					</div>
				{/if}
				{if $results.communities.zip_code}
					<div id="Zip_Code" class="tab-pane">
						<div class="orderDiv">
							<label>Sort By:</label>
							<select list="zip_code_list" class="form-control lifestyleSortSelect" name="sort" style="width:auto;">
								<option value="Relevance">Relevance</option>
								{if $results.sort_filters}
									{foreach from=$results.sort_filters item=filter key=filter_id}
									    <option value="{$filter_id}">{$filter.name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						
						<hr>

						<div id="resultListWrapper2">
							<ul class="listViewResults" id="zip_code_list">
								{foreach from=$results.communities.zip_code name=main_community_loop item=community key=index}
									<li id="zipcode_item_{$index}" class="sortableListElement onboardCommunity clearfix">
										<input type="hidden" name="Relevance[]" value="{$community.score}">
										<h2><span class="rankNumber">#{$community.type_rank}</span>{$community.name}</h2>
										<div class="row">
											{foreach from=$community.attributes name=attribute_loop item=attribute key=attribute_value}
												<div class="col-sm-6 attributeWrapper clearfix">
													<span class="attributeTitle">{$attribute.pretty_name}
														{if $attribute.label == 'Urban / Dense Urban'}
															<span class="attributeLabel">(Urban)</span>
														{elseif $attribute.label == 'Light Urban / City Feel'}
															<span class="attributeLabel">(Light Urban)</span>
														{elseif $attribute.label == 'Suburb / Small City'}
															<span class="attributeLabel">(Suburb)</span>
														{elseif $attribute.label == 'Small Town'}
															<span class="attributeLabel">(Small Town)</span>
														{elseif $attribute.label == 'Rural'}
															<span class="attributeLabel">(Rural)</span>
														{elseif $attribute.label != 'na'}
															<span class="attributeLabel">({$attribute.label})</span>
														{/if}
													</span>
													{if $attribute.id == 'ATTR_043'}
													   ${$attribute.value|number_format}
													{else}
														<div class="attribute localCompare">
															<div attribute="{$attribute.id}" max="{$attribute.max}" class="compareForMax attributeValue{if $attribute.local_pct > 99} attributeFullValue{/if}" style="width:{$attribute.local_pct|replace:'0.1':'0'}%;"></div>
														</div>
														{if $attribute.national_pct != 'NA'}
															<div class="attribute nationalCompare" style="display:none;">
																<div class="attributeValue{if $attribute.national_pct > 99} attributeFullValue{/if}" style="width:{$attribute.national_pct|replace:'0.1':'0'}%;"></div>
															</div>
														{/if}
														<div class="attribute myCommunityCompare" style="display:none;">
															<div attribute="{$attribute.id}" value="{$attribute.value}" max="{$attribute.max}" class="myCommunityAttributeValue attributeValue" style="width:0%;"></div>
														</div>
													{/if}
													<input type="hidden" name="{$attribute.id}[]" value="{$attribute.scr}">
												</div>												
											{/foreach}
										</div>
										{include file=$zip_code_path}
									</li>
								{/foreach}
							</ul>
						</div>
					</div>
				{/if}
				{if $results.communities.census_place}
					<div id="Census_Place" class="tab-pane">
						<div class="orderDiv">
							<label>Sort By:</label>
							<select list="census_area_list" class="form-control lifestyleSortSelect" name="sort" style="width:auto;">
								<option value="Relevance">Relevance</option>
								{if $results.sort_filters}
									{foreach from=$results.sort_filters item=filter key=filter_id}
									    <option value="{$filter_id}">{$filter.name}</option>
									{/foreach}
								{/if}
							</select>
						</div>

						<hr>

						<div id="resultListWrapper3">
							<ul class="listViewResults" id="census_area_list">
								{foreach from=$results.communities.census_place name=main_community_loop item=community key=index}
									<li id="census_area_item_{$index}" class="sortableListElement onboardCommunity clearfix">
										<input type="hidden" name="Relevance[]" value="{$community.score}">
										<h2><span class="rankNumber">#{$community.type_rank}</span>{$community.name}</h2>
										<div class="row">
											{foreach from=$community.attributes name=attribute_loop item=attribute key=attribute_value}
												<div class="col-sm-6 attributeWrapper clearfix">
													<span class="attributeTitle">{$attribute.pretty_name}
														{if $attribute.label == 'Urban / Dense Urban'}
															<span class="attributeLabel">(Urban)</span>
														{elseif $attribute.label == 'Light Urban / City Feel'}
															<span class="attributeLabel">(Light Urban)</span>
														{elseif $attribute.label == 'Suburb / Small City'}
															<span class="attributeLabel">(Suburb)</span>
														{elseif $attribute.label == 'Small Town'}
															<span class="attributeLabel">(Small Town)</span>
														{elseif $attribute.label == 'Rural'}
															<span class="attributeLabel">(Rural)</span>
														{elseif $attribute.label != 'na'}
															<span class="attributeLabel">({$attribute.label})</span>
														{/if}
													</span>
													{if $attribute.id == 'ATTR_043'}
													   ${$attribute.value|number_format}
													{else}
														<div class="attribute localCompare">
															<div attribute="{$attribute.id}" max="{$attribute.max}" class="compareForMax attributeValue{if $attribute.local_pct > 99} attributeFullValue{/if}" style="width:{$attribute.local_pct|replace:'0.1':'0'}%;"></div>
														</div>
														{if $attribute.national_pct != 'NA'}
															<div class="attribute nationalCompare" style="display:none;">
																<div class="attributeValue{if $attribute.national_pct > 99} attributeFullValue{/if}" style="width:{$attribute.national_pct|replace:'0.1':'0'}%;"></div>
															</div>
														{/if}
														<div class="attribute myCommunityCompare" style="display:none;">
															<div attribute="{$attribute.id}" value="{$attribute.value}" max="{$attribute.max}" class="myCommunityAttributeValue attributeValue" style="width:0%;"></div>
														</div>
													{/if}
													<input type="hidden" name="{$attribute.id}[]" value="{$attribute.scr}">
												</div>												
											{/foreach}
										</div>
										{include file=$census_area_path}
									</li>
								{/foreach}
							</ul>
						</div>
					</div>
				{/if}
			</div>
		</div>
	{else}
		<p>
			We were unable to locate any areas based on your lifestyle filters. <a href="#" id="modifySearchBtn" class="modifySearchTriggerClass" title="Modify your lifestyle search">Modify your lifestyle search</a> or
			go back to the <a href="{$controller_alias}" title="Lifestyle Search page">Lifestyle Search Page</a>.
		</p>
	{/if}
</div>
<footer{if $smarty.const.NEW_FOOTER_PARSE_STRING === true}args{/if}>
	<div id="modifySearchForm" class="clearfix">
		<h2 class="modifySearchTriggerClass" title="Click to modify your Lifestyle Search">Modify Lifestyle Search</h2>
		<form method="post" id="filterForm" action="{$controller_alias}search">
			<fieldset>
				{include file=$refine_header_path}
				{if $filters}
					{foreach from=$filters key=index item=filter}
						{if $filter.filter_id == 'ATTR_043'}
							<input type="hidden" value="{$filter.filter_id}" name="Filter_Name[]">
							<input type="hidden" value="{$filter.type}" name="{$filter.filter_id}_Type">
							<input type="hidden" value="{$filter.range}" name="{$filter.filter_id}_Range">
							<input class="filterValueField" type="hidden" value="0,15" name="{$filter.filter_id}_Value">
						{else}
							<div class="filter{if $filter.type == 1} type-1{elseif $filter.type == 2} type-2{/if}">
								<div class="filterPadding clearfix">
								    <h5>{$filter.title}</h5>
									{if $filter.filter_id == 'ATTR_044'}
										<p class="filterExtra">
											<label>Area Type:</label>
											<select class="form-control" name="Density">
												<option value="ATTR_044"{if $results.density == 'ATTR_044'} selected="selected"{/if}>Urban</option>
												<option value="ATTR_045"{if $results.density == 'ATTR_045'} selected="selected"{/if}>Light Urban</option>
												<option value="ATTR_046"{if $results.density == 'ATTR_046'} selected="selected"{/if}>Suburb</option>
												<option value="ATTR_047"{if $results.density == 'ATTR_047'} selected="selected"{/if}>Small Town</option> 
												<option value="ATTR_048"{if $results.density == 'ATTR_048'} selected="selected"{/if}>Rural</option>
											</select>
										</p>
									{/if}
									<div class="sliderWrapper">
										<div class="slider_track_wrapper clearfix">
											<div class="slider_track">
												<span class="slider_highlight"></span>
												<span class="slider_handle"></span>
												{if isset($filter.type) && $filter.type == 2}<span class="slider_handle slider_handle_2"></span>{/if}
											</div>
										</div>
										<span class="filterMaxLabel">{$filter.max_label}</span>
										<span class="filterMinLabel">{$filter.min_label}</span>
									</div>
									<input type="hidden" value="{$filter.filter_id}" name="Filter_Name[]">
									<input type="hidden" value="{$filter.type}" name="{$filter.filter_id}_Type">
									<input type="hidden" value="{$filter.range}" name="{$filter.filter_id}_Range">
									<input class="filterValueField" type="hidden" value="{$results.filters[$filter.filter_id].value}" name="{$filter.filter_id}_Value">
								</div>
							</div>
						{/if}
					{/foreach}
				{/if}
				<hr>
				<div class="searchButtonBottom text-center">
					<input type="submit" id="lifestyleSubmitSearchBtn" src="/images/lifestyle/search_transparent.png" class="sendBtn btn btn-primary" value="Search" name="Search" value="Search">
				</div>
			</fieldset>
		</form>
	</div>
	<div id="lifestyle_map_lightbox" style="display:none;">
		<div id="lifestyle_map_wrapper">
		    <div id="lifestyle_map"></div>
		    <div id="lifestyle_map_overlay" style="display:none;">
			  <div><img src="/images/system/map_loading.gif" alt="Loading..."></div>
		    </div>
		</div>
	</div>
	<div id="sliderInfoBubble" style="display:none;"><div id="sliderInfoInner"></div></div>
	<div id="attributeBubble" style="display:none;"><div id="attributeBubbleInner"></div></div>
	<img src="/images/system/lifestyle_search/bubble.png" alt="" style="display:none;">
	<img src="/images/system/lifestyle_search/bubble_small.png" alt="" style="display:none;">
	
 	<script src="/js/buildlist.js?scripts=/js/libs/jquery_ui/components/core.1.10.3.min.js,/js/libs/jquery_ui/components/mouse.1.10.3.min.js,/js/libs/jquery_ui/components/slider.1.10.3.min.js"></script>
	<script src="http://maps.google.com/maps/api/js?v=3.13&amp;sensor=false"></script>
	<script src="/js/lib/markerwithlabel_packed.js"></script>
	<script src="/js/lifestyle_search/jquery.lifestyle_search.min.js"></script>
	<script>
	{literal}
		var lifestyleSlidersObj,
			lifestyleResultsObj,
			lifestyleLocationsObj,
			lifestyleTabObj;
		jQuery(document).ready(function($) {
			lifestyleTabObj = $('#lifestyle_tabs').jtabs({
				bootstrapMode: true
			}).data('jtabs');

			lifestyleSlidersObj = $('#controllerWrapper').lifestyleSliders().data('lifestyleSliders');
			lifestyleResultsObj = $('#controllerWrapper').lifestyleResults({
				defaultLat: '{/literal}{$site_owner_lat}{literal}',
				defaultLong: '{/literal}{$site_owner_long}{literal}',
				getPropertiesWithMap: {/literal}{if $getPropertiesWithMap}true{else}true{/if}{literal},
				search_url: '{/literal}{$ACTION_URLS.search}{literal}',
				property_icon: '{/literal}{$smarty.const.APP_PIC_URL}{literal}/maps/icon/new/n/m/',
				host: '{/literal}{if strpos($HTTP_HOST, ".vlmc") !== false}http://www.hasson.com/{else}{$HTTP_HOST}{/if}{literal}'
			}).data('lifestyleResults');
			lifestyleLocationsObj = $('#controllerWrapper').lifestyleLocations().data('lifestyleLocations');
			lifestyleLocationsObj.setCounty('{/literal}{$results.selected_county}{literal}');
			lifestyleLocationsObj.setCBSA('{/literal}{$results.selected_cbsa}{literal}')
			lifestyleLocationsObj.getCountyCBSA($('#userStateSelect'));
		});
	{/literal}
	</script>
</footer{if $smarty.const.NEW_FOOTER_PARSE_STRING === true}args{/if}>
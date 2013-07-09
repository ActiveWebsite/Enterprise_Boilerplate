<div class="relative">
	{render_dropin dropin="SlideShowNav" fallback="true"}
	{render_component component="QuickSearch"}
</div>
<div class="row margin-top-30 tabClass">
	<div class="col-lg-9" id="home-page-tabs">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab-1">Tab 1</a></li>
			{if $SITE_OWNER instanceof Realtor}
				{if $site_owner_extended.biography || $site_owner_extended.realtor_info.Spoken_Languages != '' || $site_owner_extended.realtor_info.Designations != ''}
					<li><a href="#about-tab">About Me</a></li>
				{/if}
			{elseif $SITE_OWNER instanceof EntityTeam}
				{if $site_owner_extended.biography || $site_owner_extended.team_info.Spoken_Languages != '' || $site_owner_extended.team_info.Designations != ''}
					<li><a href="#about-tab">About Us</a></li>
				{/if}
			{/if}
			{if $site_owner_extended.testimonials}
				<li><a href="#testimonials-tab">Testimonials</a></li>
			{/if}
			{if ($SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Blog_Feed_Url && $site_owner_extended.realtor_info.Blog_Feed_Url != '') || ($site_owner_extended.team_info.Blog_Feed_Url && $site_owner_extended.team_info.Blog_Feed_Url != '')}
				<li><a href="#blog-tab">{if $SITE_OWNER instanceof Realtor}My{else}Our{/if} Blog</a></li>
			{/if}
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab-1"></div>
			{if ($SITE_OWNER instanceof Realtor && $site_owner_extended.biography) || ($SITE_OWNER instanceof Realtor && $site_owner_extended.bios) || ($SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Spoken_Languages) || ($SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Designations) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.biography) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.bios) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.team_info.Spoken_Languages) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.team_info.Designations)}
				<div class="tab-pane" id="about-tab">
					<div class="row">
						{if $site_owner_extended.biography}
							<div class="col-lg-9">{$site_owner_extended.biography}</div> {* NP-300 Removed Truncation, if they want it back, use this: |truncate:2075 *}
						{/if}
						<div class="col-lg-3">
							{if $site_owner_extended.realtor_info.Designations}
								<h3>Designations</h3>
								<ul>
									<li>{$site_owner_extended.realtor_info.Designations|replace:',':'</li><li>'}</li>
								</ul>
							{elseif $site_owner_extended.team_info.Designations}
								<h3>Designations</h3>
								<ul>
									<li>{$site_owner_extended.team_info.Designations|replace:',':'</li><li>'}</li>
								</ul>
							{/if}
							{if $site_owner_extended.realtor_info.Spoken_Languages}
								<h3>Languages</h3>
								<ul>
									<li>{$site_owner_extended.realtor_info.Spoken_Languages|replace:',':'</li><li>'}</li>
								</ul>
							{elseif $site_owner_extended.team_info.Spoken_Languages}
								<h3>Languages</h3>
								<ul>
									<li>{$site_owner_extended.team_info.Spoken_Languages|replace:',':'</li><li>'}</li>
								</ul>
							{/if}
						</div>
					</div>
				</div>
			{/if}
			{if $site_owner_extended.testimonials}
				<div class="tab-pane" id="testimonials-tab">
					{foreach from=$site_owner_extended.testimonials item=testimonial key=index}
						<blockquote>
							<p>{$testimonial.comment}</p>
							<small>{$testimonial.date|date_format} by <cite title="{$testimonial.name}">{$testimonial.name}</cite></small>
						</blockquote>
					{/foreach}
				</div>
			{/if}
			{if ($SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Blog_Feed_Url && $site_owner_extended.realtor_info.Blog_Feed_Url != '') || ($site_owner_extended.team_info.Blog_Feed_Url && $site_owner_extended.team_info.Blog_Feed_Url != '')}
				<div class="tab-pane" id="blog-tab">
					{if $SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Blog_Feed_Url && $site_owner_extended.realtor_info.Blog_Feed_Url != ''}
						{render_dropin dropin="FeedReader" Feed=$site_owner_extended.realtor_info.Blog_Feed_Url blogURL=$site_owner_extended.realtor_info.Blog_URL view="agent_homepage" Count="4"}
					{elseif $site_owner_extended.team_info.Blog_Feed_Url && $site_owner_extended.team_info.Blog_Feed_Url != ''}
						{render_dropin dropin="FeedReader" Feed=$site_owner_extended.team_info.Blog_Feed_Url blogURL=$site_owner_extended.team_info.Blog_URL view="agent_homepage" Count="4"}
					{/if}
				</div>
			{/if}
		</div>
	</div>
	<div class="col-lg-3">
		<div class="homepage-well">
			{render_component component="Account"}
		</div>
	</div>
</div>
<div class="row margin-top-30">
	<div class="col-sm-6 col-lg-3 margin-bottom-30">
		<div class="homepage-well">
			<h3>Featured Communities</h3>
			{render_component component="FeaturedCommunity" count=4}
		</div>
	</div>
	<div class="col-sm-6 col-lg-3 margin-bottom-30">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="col-sm-6 col-lg-3 margin-bottom-30">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="col-sm-6 col-lg-3">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
</div>
<footerargs>
{* load the scripts that you need that are not already on the page *}
<script src="/js/buildlist.js?scripts=/js/galleries/jquery.cycle2.min.js,/js/carousels/jquery.jcarousel.min.js"></script>
{literal}
<script>
jQuery(document).ready(function($) {
	// build tabs
	$('#home-page-tabs').jtabs({
		bootstrapMode:true,
		openCallback: function(obj, num, trigger, tab) {
			var ref = $(trigger).find('a').attr('href');
			//<![CDATA[
			switch(ref) {
				case '#tab-1':
					_lazyLoadComponent('tab-1','PropertySearch/?search_url={/literal}Listing_Agent/{if $site_owner_extended.rebrand}{$site_owner_extended.rebrand}{/if}{literal}&results=8&alternateView=PropertySearchResult');
					break;
			}
			//]]>
		}
	});
});
</script>
{/literal}
</footerargs>
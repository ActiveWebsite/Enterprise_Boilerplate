<div id="home-page-gallery-quick-search">
	<div class="row-fluid">
		<div class="span12 hidden-phone">
			{render_dropin dropin="SlideShowNav" fallback=true}
		</div>
	</div>
	<div class="row-fluid">
		<div class="span3" id="home-page-quick-search">
			{render_component component="QuickSearch"}
		</div>
	</div>
</div>
<hr>
<div class="row-fluid">
	<div class="span9" id="home-page-tabs">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab_1">Tab 1</a></li>
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
			<div class="tab-pane active" id="tab_1">
				{render_component component="PropertySearch" search_url="Min_Price/300000/" results="8" alternateView="PropertySearchResult"}
			</div>
			{if ($SITE_OWNER instanceof Realtor && $site_owner_extended.biography) || ($SITE_OWNER instanceof Realtor && $site_owner_extended.bios) || ($SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Spoken_Languages) || ($SITE_OWNER instanceof Realtor && $site_owner_extended.realtor_info.Designations) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.biography) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.bios) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.team_info.Spoken_Languages) || ($SITE_OWNER instanceof EntityTeam && $site_owner_extended.team_info.Designations)}
				<div class="tab-pane" id="about-tab">
					<div class="row-fluid">
						{if $site_owner_extended.biography}
							<div class="span9">{$site_owner_extended.biography}</div> {* NP-300 Removed Truncation, if they want it back, use this: |truncate:2075 *}
						{/if}
						<div class="span3">
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
					{render_component order="descending" view="white" component="EntityTestimonial"}
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
	<div class="span3">
		<div class="well">
			{render_component component="Account"}
		</div>
	</div>
</div>
<hr>
<div class="row-fluid">
	<div class="span3">
		<div class="well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="span3">
		<div class="well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="span3">
		<div class="well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="span3">
		<div class="well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
</div>

<footerargs>
{* load the scripts that you need that are not already on the page *}
<script src="/js/buildlist.js?scripts=/js/tabs/jquery.jtabs.min.js,/js/galleries/jquery.cycle.js"></script>
{literal}
<script>
jQuery(document).ready(function($) {
	// build tabs
	$('#home-page-tabs').jtabs({
		bootstrapMode:true,
		openCallback: function(obj, num, trigger, tab) {
			var ref = $(trigger).find('a').attr('href');
			switch(ref)
			{
				case '#tab_1':
				case '#tab_2':
				case '#tab_3':
				case '#tab_4':
				break;
			}
		}
	});
	// homepage slideshow
	$('#home-page-gallery').cycle({
		pause: 1,
		pager: '#home-page-gallery-pager'
	});

});
</script>
{/literal}
</footerargs>
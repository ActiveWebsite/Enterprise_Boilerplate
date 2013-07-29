<div class="relative">
	{render_dropin dropin="SlideShowNav"}
	{render_component component="QuickSearch"}
</div>
<div class="row margin-top-30">
	<div class="col-lg-9 tabClass" id="home-page-tabs">
		<ul class="nav nav-tabs hidden-sm">
			<li class="active"><a href="#tab-1">This would be Tab 1</a></li>
			<li><a href="#tab-2">This would be Tab 2</a></li>
			<li><a href="#tab-3">This would be Tab 3</a></li>
			<li><a href="#tab-4">This would be Tab 4</a></li>
			<li><a href="#tab-5">This would be Tab 5</a></li>
		</ul>
		<div class="tab-content">
			<div class="inner-tab-trigger visible-sm"><a href="#tab-1" data-action="openTab">This would be Tab 1</a></div>
			<div class="tab-pane active" id="tab-1"></div>
			
			<div class="inner-tab-trigger visible-sm"><a href="#tab-2" data-action="openTab">This would be Tab 2</a></div>
			<div class="tab-pane" id="tab-2"></div>
			
			<div class="inner-tab-trigger visible-sm"><a href="#tab-3" data-action="openTab">This would be Tab 3</a></div>
			<div class="tab-pane" id="tab-3">
				tab 3
			</div>
			
			<div class="inner-tab-trigger visible-sm"><a href="#tab-4" data-action="openTab">This would be Tab 4</a></div>
			<div class="tab-pane" id="tab-4">
				tab 4
			</div>
			
			<div class="inner-tab-trigger visible-sm"><a href="#tab-5" data-action="openTab">This would be Tab 5</a></div>
			<div class="tab-pane" id="tab-5">
				tab 5
			</div>
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
<script src="/js/buildlist.js?scripts=/js/galleries/jquery.cycle2.swipe.min.js,/js/galleries/jquery.cycle2.min.js,/js/carousels/jquery.jcarousel.min.js"></script>
{literal}
<script>
jQuery(document).ready(function($) {
	// build tabs
	var extraTriggers = $('a[data-action="openTab"]');
	var tabobj = $('#home-page-tabs').jtabs({
		bootstrapMode:true,
		openCallback: function(obj, num, trigger, tab) {
			var ref = $(trigger).find('a').attr('href');
			extraTriggers.removeClass('active');
			extraTriggers.filter('[href="' + ref + '"]').addClass('active');
			
			//<![CDATA[
			switch(ref) {
				case '#tab-1':
					_lazyLoadComponent('tab-1','PropertySearch/?search_url=Min_Price/300000/&results=8&alternateView=PropertySearchResult');
					break;
				case '#tab-2':
					_lazyLoadComponent('tab-2','PropertySearch/?search_url=Min_Price/400000/&results=8&alternateView=PropertySearchResult');
					break;
				case '#tab-3':
					_lazyLoadComponent('tab-3','PropertySearch/?search_url=Min_Price/500000/&results=8&alternateView=PropertySearchResult');
					break;
			}
			//]]>
		}
	}).data('jtabs');

	

	extraTriggers.on('click', function(e) {
		e.preventDefault();
		var el = $(this);
		tabobj.OpenByHref(el.attr('href'));
	});
});
</script>
{/literal}
</footerargs>
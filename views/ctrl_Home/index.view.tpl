<div id="home-page-gallery-quick-search">
	<div class="row-fluid">
		<div class="span12 hidden-phone">
			{render_dropin dropin="SlideShowNav"}
		</div>
	</div>
	<div class="row-fluid">
		<div class="span3" id="home-page-quick-search">
			{render_component component="QuickSearch"}
		</div>
	</div>
</div>
<div class="row-fluid margin-top-30">
	<div class="span9" id="home-page-tabs">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab-1">Tab 1</a></li>
			<li><a href="#tab-2">Tab 2</a></li>
			<li><a href="#tab-3">Tab 3</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab-1"></div>
			<div class="tab-pane" id="tab-2"></div>
			<div class="tab-pane" id="tab-3"></div>
		</div>
	</div>
	<div class="span3">
		<div class="homepage-well">
			{render_component component="Account"}
		</div>
	</div>
</div>
<div class="row-fluid margin-top-30">
	<div class="span3">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="span3">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="span3">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
	<div class="span3">
		<div class="homepage-well">
			<h3>Section</h3>
			<p>You Can put something in the block</p>
		</div>
	</div>
</div>
<footerargs>
{* load the scripts that you need that are not already on the page *}
<script src="/js/buildlist.js?scripts=/js/tabs/jquery.jtabs.min.js,/js/galleries/jquery.cycle.js,/js/carousels/jquery.jcarousel.min.js"></script>
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
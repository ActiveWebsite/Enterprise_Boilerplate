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
<hr>
<div class="row-fluid">
	<div class="span9" id="home-page-tabs">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab_1">Tab 1</a></li>
			<li><a href="#tab_2">Tab 2</a></li>
			<li><a href="#tab_3">Tab 3</a></li>
			<li><a href="#tab_4">Tab 4</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab_1">
				{render_component component="PropertySearch" search_url="Min_Price/300000/" results="8" alternateView="PropertySearchResult"}
			</div>
			<div class="tab-pane" id="tab_2">
				<p>I am tab 2 content<br><br><br><br><br><br><br><br><br></p>
			</div>
			<div class="tab-pane" id="tab_3">
				<p>I am tab 3 content<br><br><br><br><br><br><br><br><br></p>
			</div>
			<div class="tab-pane" id="tab_4">
				<p>I am tab 4 content<br><br><br><br><br><br><br><br><br></p>
			</div>
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
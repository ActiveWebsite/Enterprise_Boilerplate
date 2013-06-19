#News

If the uri for this page is something other than /news/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Press Releases', 'ctrl_News', array('controller'=>'press_releases'));

LESS for all views in this folder are located in `client_side/less/news/news.less`

*Be sure to remove any sections that you are not using. When removing section remember to remove any associated JS files, JS code, and LESS.
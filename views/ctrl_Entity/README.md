#Offices

The first step is to set the correct uri for the page if it is something other than /offices/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Our Offices', 'ctrl_Office', array('controller'=>'out_offices'));

*Be sure to remove any sections that you are not using. When removing section remember to remove any associated JS files, JS code, and LESS.

#Offices Index

LESS for this view located in `client_side/less/office/office.less`

#Offices Bio

LESS for this view located in `client_side/less/office/office.less`
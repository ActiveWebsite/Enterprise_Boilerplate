#Developments

The first step is to set the correct uri for the page if it is something other than /developments/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Neighborhoods', 'ctrl_Developments', array('controller'=>'neighborhoods'));

*Be sure to remove any sections that you are not using. When removing section remember to remove any associated JS files, JS code, and LESS.

#Developments Index

LESS for this view located in `client_side/less/developments/developments.less`

#Developments Bio

LESS for this view is located in `client_side/less/developments/developments.less`
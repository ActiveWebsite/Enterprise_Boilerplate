#Community

The community controller can be setup many different ways. It may have nested communities, categories, community landing pages etc...

The first step is to set the correct uri for the page if it is something other than /community/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Our Communities', 'ctrl_Communities', array('controller'=>'our_communities'));

*Be sure to remove any sections that you are not using. When removing section remember to remove any associated JS files, JS code, and LESS.

#Community Index

Communities can get pretty crazy so be sure to check with R&D about the best way to build out your layout for the index.

LESS for this view located in `client_side/less/community/community_index.less`

#Community Bio

LESS for this view is located in `client_side/less/community/community_bio.less`
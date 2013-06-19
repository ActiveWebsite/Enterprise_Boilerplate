#Realtor Controller

If the uri for this page is something other than /realtor/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Agents', 'ctrl_Realtor', array('controller'=>'agents'));

*Be sure to remove any sections that you are not using. When removing section remember to remove any associated JS files, JS code, and LESS.

We have provided you with some controller overrides in `actions/ctrl_Realtor.action.php` to build out many of the most common features. These should be reviewed by DEV when starting the client to 
determine what items should be added/removed.

#Agent Roster

The LESS for the roster/index is in `client_side/less/realtor/roster.less`

#Realtor/Team Bio

The Less for the bio pages is in `client_side/less/realtor/agent_bio.less`
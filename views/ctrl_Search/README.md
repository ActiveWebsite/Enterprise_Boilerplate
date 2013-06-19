#Search

If the uri for this page is something other than /search/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Advanced Search', 'ctrl_Search', array('controller'=>'advanced_search'));

The CSS for these views are in `client_side/css/search/advanced_search.css` and `client_side/css/search/advanced_search_admin.css`

The css in not in LESS because the admin panel can't process it.

You can use the Form Builder located on boojlabs to build out your fields. Talk with R&D about how to setup the js to make your form work correctly based on the clients business rules.
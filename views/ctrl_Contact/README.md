#Contact Page

The `contact_form.view.tpl` is the contact page for the site.

If the uri for this page is something other than /contact/, You need to set the site rule for it in `site.rules.php`.

	$siteRules[] = SwitchBoard::BuildPattern('Contact Us', 'ctrl_Contact', array('controller'=>'contact_us'));

LESS for this view is located in `client_side/less/contact/contact.less`

*Be sure to remove any sections that you are not using. When removing section remember to remove any associated JS files, JS code, and LESS.

#Contact Popup

Contains the view for all contact popups on the site.

LESS for this view is located in `client_side/less/web_user_account/web_user_account.less`

#Error.view.tpl

This file is used as the succes/error message when submitting a popup form. It uses the Bootstrap's alert blocks for style

##Validation For Contact Forms

*[Validation Documentation](http://boojlabs.activewebsite.com/documentation/view/64)
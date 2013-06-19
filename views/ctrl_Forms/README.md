#Request Info Form

This is used to request info about a property.

LESS for this view is located in `client_side/less/web_user_account/web_user_account.less`

#Schedule Showing Form

This is used to schedule a showing for a property.

LESS for this view is located in `client_side/less/web_user_account/web_user_account.less`

##Validation For Contact Forms

*[Validation Documentation](http://boojlabs.activewebsite.com/documentation/view/64)

#Other Types of Forms

You can create any other custom forms in this folder such as a feedback form.

To do this, Simply create a new file like `feedback_form.view.tpl`. 

In this new template make a form like so:

	<form action="/forms/" class="validate-form" method="post">
		..fields
		<input type="hidden" value="feedback" name="form_type">
		<input type="submit" value="Send">
	</form>

*note the `name="form_type"` hidden input. This should reflect the type of form.

To use this form simply make a lightbox link like so:
	
	<a href="/popup/forms/display/feedback_form/" title="Feedback" class="fancybox" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="765">Feedback</a>
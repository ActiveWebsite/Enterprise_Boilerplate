{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li class="active">Forgot Password</li>
    </ul>
{/render_layout_arguments}
<div class="page-header web-user-account-header">
	<h1>Forgot Password</h1>
	<p class="lead">
		If you have forgotten your account password, you can reset it by filling in your email address below. A new password will be generated and emailed to you.
	</p>
</div>
<form class="validate-form" action="/{$controller_alias}/send_forgotten_password/" method="post">
    <fieldset>
        <div class="form-group">
            <label for="email_address">Email Address</label>
           	<input class="form-control required" placeholder="Enter email address" name="email_address" value="" type="email">
        </div>
        <div class="form-group">
        	<input type="submit" class="btn btn-success" name="Submit" value="Send">
        </div>
        <p><strong>* A New Password Will Be Sent To Your Email Address</strong></p>
	</fieldset>	
</form>
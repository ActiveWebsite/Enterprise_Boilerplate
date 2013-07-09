{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li>Forgot Password</li>
    </ul>
{/render_layout_arguments}

<div id="web-user-account-header">
	<h1>Forgot Password</h1>
	<p class="lead">
		If you have forgotten your account password, you can reset it by filling in your email address below. A new password will be generated and emailed to you.
	</p>
</div>
{if $messages->isMsgs() === true}
	{if $messages->isErrors() === true}
		 <div class="alert alert-danger alert-block">
			<strong>Error:</strong><br>
			{$messages->getErrors(true)}
		</div>
	{/if}
	{if $messages->isAlerts() === true}
		<div class="alert alert-info alert-block">
			<strong>Alert:</strong><br>
			{$messages->getAlerts(true)}
		</div>
	{/if}
	{if $messages->isNormals() === true}
		<div class="alert alert-success alert-block">
			<strong>Message:</strong><br>
			{$messages->getNormal(true)}
		</div>
	{/if}
{/if}
<form class="form-horizontal validate-form" action="/{$controller_alias}/send_forgotten_password/" method="post">
    <fieldset>
        <div class="row">
            <label class="col-sm-2 col-lg-2 control-label" for="email_address">Email Address</label>
            <div class="col-sm-10 col-lg-10">
            	<input class="required" placeholder="Enter email address" name="email_address" value="" type="email">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-10 col-lg-10 col-offset-2">
                <button type="submit" class="btn btn-success">Send</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-10 col-lg-10 col-offset-2">
            	<p class="bold">* A New Password Will Be Sent To Your Email Address</p>
            </div>
        </div>
	</fieldset>	
</form>
{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a> <span class="divider">&gt;</span></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a> <span class="divider">&gt;</span></li>
        <li>Forgot Password</li>
    </ul>
{/render_layout_arguments}

<div id="web-user-account-header">
	<h1>Forgot Password</h1>
	<p>
		If you have forgotten your account password, you can reset it by filling in your email address below. A new password will be generated and emailed to you.
	</p>
</div>
{if $messages->isMsgs() === true}
	{if $messages->isErrors() === true}
		 <div class="alert alert-error alert-block">
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
        <div class="control-group">
            <label class="control-label" for="email_address">Email Address</label>
            <div class="controls">
                <input class="input-xxlarge required" placeholder="Enter email address" name="email_address" id="email_address" value="" type="email">
            </div>
        </div>
        <div class="form-actions">
			<input type="submit" class="btn btn-primary" value="Send">
		</div>
	</fieldset>
	<p class="bold">* A New Password Will Be Sent To Your Email Address</p>
</form>
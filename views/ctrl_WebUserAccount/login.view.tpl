{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li>{$account_area_brand_name}</li>
    </ul>
{/render_layout_arguments}
<div class="page-header web-user-account-header">
	<h1>Login to {$account_area_brand_name}</h1>
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
<div class="row">
	<div class="col-lg-6">
		<div class="well account-well">
			<h2 class="margin-bottom-10">I want to login using my {$account_area_brand_name} account</h2>
			<form method="post" class="validate-form" action="/{$controller_alias}/login/">
				<fieldset>
					<div class="row">
						<div class="col-lg-12">
							<label class="block bold">Email</label>
							<input name="username" class="col-lg-12 required" type="email">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<label class="block bold">Password</label>
							<input name="password" class="col-lg-12 required" type="password">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<a class="pull-right" href="/{$controller_alias}/forgot_password/">I've forgotten my password</a>
							<input type="submit" name="btn" value="Log In" class="loginButton btn btn-primary">
						</div>
					</div>
				</fieldset>		
			</form>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="well account-well">
			<h2 class="margin-bottom-10">I want to create a {$account_area_brand_name}</h2>
			<p><strong>Whether you're a buyer or seller, you can save time and simplify the process.</strong></p>
			<ul>
				<li class="margin-bottom-10">Customize searches for residential properties to know when new properties that fit your search criteria come on the market or when prices change</li>
				<li class="margin-bottom-10">Share properties with your Realtor, family and friends</li>
				<li class="margin-bottom-10">Our search capability includes MLS listings throughout your area so you have access to thousands of properties</li>
				<li class="margin-bottom-10">New listings appear in our search engine within 24 hours of being entered into the MLS system</li>
			</ul>
			<p><a href="{$ACTION_URLS.account}signup/" title="Register" class="btn btn-primary">Register</a></p>
		</div>
	</div>
</div>
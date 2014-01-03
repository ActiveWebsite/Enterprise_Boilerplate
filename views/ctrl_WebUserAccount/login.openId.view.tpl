{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li class="active">{$account_area_brand_name}</li>
    </ul>
{/render_layout_arguments}
<div class="page-header web-user-account-header">
	<h1>Login to {$account_area_brand_name}</h1>
</div>
<div class="row">
	<div class="col-sm-6">
		<div class="account-well">
			{render_dropin dropin="OpenId"}
			<h2>I want to login using my {$account_area_brand_name} account</h2>
			<form method="post" class="validate-form" action="/{$controller_alias}/login/" autocomplete="off">
				<fieldset class="clearfix">
					<div class="form-group">
						<label class="block bold">Email</label>
						<input name="username" class="form-control required email" type="email">
					</div>
					<div class="form-group">
						<label class="block bold">Password</label>
						<input name="password" class="form-control required" type="password">
					</div>
					<a class="pull-left" href="/{$controller_alias}/forgot_password/">I've forgotten my password</a>
					<input type="submit" class="btn btn-success pull-right" name="Submit" value="Log In">
				</fieldset>		
			</form>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="account-well">
			<h2>I want to create a {$account_area_brand_name}</h2>
			<p><strong>Whether you're a buyer or seller, you can save time and simplify the process.</strong></p>
			<ul>
				<li class="margin-bottom-10">Customize searches for residential properties to know when new properties that fit your search criteria come on the market or when prices change</li>
				<li class="margin-bottom-10">Share properties with your Realtor, family and friends</li>
				<li class="margin-bottom-10">Our search capability includes MLS listings throughout your area so you have access to thousands of properties</li>
				<li class="margin-bottom-10">New listings appear in our search engine within 24 hours of being entered into the MLS system</li>
			</ul>
			<p><a href="{$ACTION_URLS.account}signup/" title="Register" class="btn btn-default">Register</a></p>
		</div>
	</div>
</div>
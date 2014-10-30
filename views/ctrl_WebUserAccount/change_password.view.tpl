{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li class="active">Change Your Password</li>
    </ul>
{/render_layout_arguments}
{$PAGE_MENU}
<div class="page-header web-user-account-header">
	<h1>Change Your Password</h1>
</div>
{if $error}
	<div class="alert alert-danger alert-block">{$error}</div>
{/if}
<form method="POST" class="form-horizontal validate-form" action="{$change_pw_url}">
	<div class="form-group">
		<label for="input-01" class="col-sm-2 control-label">Old Password</label>
		<div class="col-sm-10">
			<input id="input-01" type="password" name="old_password" placeholder="Enter Old Password" class="form-control" required>
		</div>
	</div>
	<div class="form-group">
		<label for="input-02" class="col-sm-2 control-label">New Password</label>
		<div class="col-sm-10">
			<input id="input-02" type="password" name="new_password" placeholder="Enter New Password" class="form-control" required>
		</div>
	</div>
	<div class="form-group">
		<label for="input-03" class="col-sm-2 control-label">Confirm Password</label>
		<div class="col-sm-10">
			<input id="input-03" data-rule-equalTo="#input-02" data-msg-equalTo="Your passwords do not match." type="password" name="confirm_password" placeholder="Confirm New Password" class="form-control" required>
		</div>
	</div>
    <div class="form-group margin-bottom-0">
        <label class="col-sm-2 control-label hidden-xs">&nbsp;</label>
        <div class="col-sm-10">
			<input type="submit" class="btn btn-primary" value="Change Password">
		</div>
	</div>
</form>
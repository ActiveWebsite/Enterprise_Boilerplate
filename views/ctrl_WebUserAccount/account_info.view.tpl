{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li class="active">Account Details</li>
    </ul>
{/render_layout_arguments}

{$PAGE_MENU}
<div class="page-header web-user-account-header">
    <h1>Account Details</h1>
    <p class="lead">After editing the fields below, click Save to update your information.</p>
</div>
<form class="form-horizontal validate-form" action="{$ACTION_URLS.local_root}/update/" method="post">
    <fieldset>
        <legend>Account Login Information</legend>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="email">Email Address</label>
            <div class="col-sm-10">
                <input class="form-control" name="email" id="email" value="{$user_dict.email}" type="email" disabled="disabled">
            </div>
        </div>
        {if $show_password_change_fields}
            <div class="form-group">
                <label class="col-sm-2 control-label" for="password">Password</label>
                <div class="col-sm-10">
                    <input class="form-control" name="password" id="password" type="password">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="password2">Confirm Password</label>
                <div class="col-sm-10">
                    <input class="form-control" name="password2" id="password2" type="password">
                </div>
            </div>
        {/if}
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <input type="submit" class="btn btn-success" name="Submit" value="Save">
            </div>
        </div>
    </fieldset>

    <fieldset class="margin-top-30">
        <legend>Contact Information</legend>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="first_name">First Name</label>
            <div class="col-sm-10">
                <input class="form-control" name="first_name" id="first_name" value="{$user_dict.fname}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="last_name">Last Name</label>
            <div class="col-sm-10">
                <input class="form-control" name="last_name" id="last_name" value="{$user_dict.lname}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="Street_Address">Street Address</label>
            <div class="col-sm-10">
                <input class="form-control" name="Street_Address" id="Street_Address" value="{$user_dict.address.Street_Address.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="City">City</label>
            <div class="col-sm-10">
                <input class="form-control" name="City" id="City" value="{$user_dict.address.City.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="State">State</label>
            <div class="col-sm-10">
                <input class="form-control" name="State" id="State" value="{$user_dict.address.State.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="Zip">Zip Code</label>
            <div class="col-sm-10">
                 <input class="form-control" name="Zip" id="Zip" value="{$user_dict.address.Zip.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="Cell_Phone">Cell Phone</label>
            <div class="col-sm-10">
                <input class="form-control" name="Cell_Phone" id="Cell_Phone" value="{$user_dict.address.Cell_Phone.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="Home_Phone">Home Phone</label>
            <div class="col-sm-10">
               <input class="form-control" name="Home_Phone" id="Home_Phone" value="{$user_dict.address.Home_Phone.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="Work_Phone">Work Phone</label>
            <div class="col-sm-10">
                <input class="form-control" name="Work_Phone" id="Work_Phone" value="{$user_dict.address.Work_Phone.value}" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <input type="submit" class="btn btn-success" name="Submit" value="Save">
            </div>
        </div>        
    </fieldset>
</form>
<div class="margin-top-30">
    <h2>Manage Preferred Agent</h2>
    <span class="label label-default margin-right-20">
        Current agent: 
        {if $pref_realtor}
            {$pref_realtor->get_name()}
        {else}
            None
        {/if}
    </span>
    <a class="btn btn-primary btn-sm fancybox" data-fancybox-type="iframe" data-fancybox-width="500" data-fancybox-height="auto" href="/account/change_pref_realtor_form">Change Preferred Agent</a>
</div>
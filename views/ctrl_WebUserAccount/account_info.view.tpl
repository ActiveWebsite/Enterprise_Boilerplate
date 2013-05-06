{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a> <span class="divider">&gt;</span></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a> <span class="divider">&gt;</span></li>
        <li>Account Details</li>
    </ul>
{/render_layout_arguments}

{$PAGE_MENU}
<div id="web-user-account-header">
    <h1>Account Details</h1>
    <p>After editing the fields below, click Save to update your information.</p>
</div>
<form class="form-horizontal validate-form" action="{$ACTION_URLS.local_root}/update/" method="post">
    <fieldset>
        <legend>Account Login Information</legend>
        <div class="control-group">
            <label class="control-label" for="email">Email Address</label>
            <div class="controls">
                <input class="input-xxlarge" name="email" id="email" value="{$user_dict.email}" type="email" disabled="disabled">
            </div>
        </div>
        {if $show_password_change_fields}
            <div class="control-group">
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <input class="input-xxlarge" name="password" id="password" type="password">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="password2">Confirm Password</label>
                <div class="controls">
                    <input class="input-xxlarge" name="password2" id="password2" type="password">
                </div>
            </div>
        {/if}
    </fieldset>
    <fieldset>
        <legend>Contact Information</legend>
        <div class="control-group">
            <label class="control-label" for="first_name">First Name</label>
            <div class="controls">
                <input class="input-xxlarge" name="first_name" id="first_name" value="{$user_dict.fname}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="last_name">Last Name</label>
            <div class="controls">
                <input class="input-xxlarge" name="last_name" id="last_name" value="{$user_dict.lname}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="Street_Address">Street Address</label>
            <div class="controls">
                <input class="input-xxlarge" name="Street_Address" id="Street_Address" value="{$user_dict.address.Street_Address.value}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="City">City</label>
            <div class="controls">
                <input class="input-xxlarge" name="City" id="City" value="{$user_dict.address.City.value}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="State">State</label>
            <div class="controls">
                <input class="input-xxlarge" name="State" id="State" value="{$user_dict.address.State.value}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="Zip">Zip Code</label>
            <div class="controls">
                 <input class="input-xxlarge" name="Zip" id="Zip" value="{$user_dict.address.Zip.value}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="Cell_Phone">Cell Phone</label>
            <div class="controls">
                <input class="input-xxlarge" name="Cell_Phone" id="Cell_Phone" value="{$user_dict.address.Cell_Phone.value}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="Home_Phone">Home Phone</label>
            <div class="controls">
               <input class="input-xxlarge" name="Home_Phone" id="Home_Phone" value="{$user_dict.address.Home_Phone.value}" type="text">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="Work_Phone">Work Phone</label>
            <div class="controls">
                <input class="input-xxlarge" name="Work_Phone" id="Work_Phone" value="{$user_dict.address.Work_Phone.value}" type="text">
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Preferred Agent</legend>
        <div class="control-group">
            <label class="control-label" for="Work_Phone">Preferred Agent</label>
            <div class="controls">
                {if $pref_realtor}
                    {$pref_realtor->get_name()}
                {else}
                    None
                {/if}
                <span class="help-inline">
                    <a href="{$ACTION_URLS.local_root}/change_pref_realtor_form" class="btn fancybox" data-fancybox-type="iframe" data-fancybox-width="400" data-fancybox-height="300">Change Preferred Agent</a>
                </span>
            </div>
        </div>
    </fieldset>
    <div class="form-actions">
        <input type="submit" value="Save" class="btn btn-primary">
    </div>
</form>
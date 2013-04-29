{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a> <span class="divider">&gt;</span></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a> <span class="divider">&gt;</span></li>
        <li>Create Account</li>
    </ul>
{/render_layout_arguments}

{if $current_account_user}
    <div class="alert alert-error alert-block">
        You are already logged in.
    </div>
    <p>Not your account? <a href="{$ACTION_URLS.account}logout/">Click here</a> to log out!</p>
{else}
    <h1>Create a New {$account_area_brand_name} Account</h1>
    
    {if $messages->isMsgs() === true}
        {if $messages->isErrors() === true}
            <div class="alert alert-error alert-block">
                <strong>Error:</strong><br>{$messages->getErrors(true)}
            </div>
        {/if}
        {if $messages->isAlerts() === true}
            <div class="alert alert-info alert-block">
                <strong>Alert:</strong><br>{$messages->getAlerts(true)}
            </div>
        {/if}
        {if $messages->isNormals() === true}
            <div class="alert alert-success alert-block">
                <strong>Message:</strong><br>{$messages->getNormal(true)}
            </div>
        {/if}
    {/if}

    <p class="margin-top-10">
        You must be registered to use our account features. Register once, using
        the form below. Then log in at your convenience to search for homes, save
        favorites, set up email alerts and change your account information.
    </p>

    <div class="openIDWrap">
        {render_dropin dropin="OpenId"}
    </div>

    <form id="create_account_form" action="{$submit_action}" method="post" class="validate-form">
        <fieldset>
            {if isset( $signup.has_openId ) }
                <input type="hidden" name="has_openId">
            {/if}
            <div class="row-fluid">
                <div class="span6">
                    <label class="control-label">First Name <span class="red">*</span></label>
                    <input type="text" name="first_name" class="span12 required" placeholder="First Name" value="{$signup.first_name}">
                </div>
                <div class="span6">
                    <label class="control-label">Last Name <span class="red">*</span></label>
                    <input type="text" name="last_name" class="span12 required" placeholder="Last Name" value="{$signup.last_name}">
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <label class="control-label">Email Address <span class="red">*</span></label>
                    <input type="email" name="email_confirm" class="span12 required email" placeholder="Email Address" value="{$signup.email_confirm}">
                    <input type="email" name="email" style="display:none;" value="">
                </div>
            </div>
            <div class="row-fluid">
                <div class="span3">
                    <label class="control-label">Address</label>
                    <input type="text" name="address" class="span12" placeholder="Address" value="{$signup.address}">
                </div>
                <div class="span3">
                    <label class="control-label">City</label>
                    <input type="text" name="city" class="span12" placeholder="City" value="{$signup.city}">
                </div>
                <div class="span3">
                    <label class="control-label">State</label>
                    <input type="text" name="state" class="span12" placeholder="State" value="{$signup.state}">
                </div>
                <div class="span3">
                    <label class="control-label">Zip Code</label>
                    <input type="text" name="zip_code" class="span12" placeholder="Zip Code" value="{$signup.zip_code}">
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <label class="control-label">Cell Phone</label>
                    <input type="tel" name="cell_phone" class="span12" placeholder="Cell Phone" value="{$signup.cell_phone}">
                </div>
                <div class="span6">
                    <label class="control-label">Home Phone</label>
                    <input type="tel" name="home_phone" class="span12" placeholder="Home Phone" value="{$signup.home_phone}">
                </div>
            </div>
            {if !isset( $signup.has_openId )}
                <div class="row-fluid">
                    <div class="span6">
                        <label class="control-label">Password  <span class="red">*</span></label>
                        <input type="password"  name="password" class="span12 required" placeholder="Password" value="">
                    </div>
                    <div class="span6">
                        <label class="control-label">Re-Type Password  <span class="red">*</span></label>
                        <input type="password" name="password2" class="span12 required" placeholder="Re-Type Password" value="">
                    </div>
                </div>
            {/if}
            {if count($realtors) == 1}
                <input type="hidden" value="{$realtors[0]->get_id()}" name="preferred_agent">
            {elseif $SITE_OWNER instanceof Realtor}
                <input type="hidden" value="{$SITE_OWNER->get_id()}" name="preferred_agent">
            {else}
                <div class="row-fluid">
                    <div class="span6">
                        <label class="control-label">Preferred Agent</label>
                        <select name="preferred_agent" class="span12">
                            <option value="">No Prefered Agent</option>
                            {foreach from=$realtors item=realtor}
                                <option value="{$realtor->get_id()}">{$realtor->get_name()}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            {/if}
            <div class="margin-top-10">
                <input class="btn btn-primary" type="submit" value="Create Account">
            </div>
        </fieldset>
    </form>
{/if}
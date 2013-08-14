{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li>Create Account</li>
    </ul>
{/render_layout_arguments}
{if $messages->isMsgs() === true}
    {if $messages->isErrors() === true}
        <div class="alert alert-danger alert-block">
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
{if $current_account_user}
    <div class="alert alert-danger alert-block">
        You are already logged in.
    </div>
    <p>Not your account? <a href="{$ACTION_URLS.account}logout/">Click here</a> to log out!</p>
{else}

    <div class="page-header web-user-account-header">
        <h1>Create a New {$account_area_brand_name} Account</h1>
        <p>
            You must be registered to use our account features. Register once, using
            the form below. Then log in at your convenience to search for homes, save
            favorites, set up email alerts and change your account information.
        </p>
    </div>

    <div class="openIDWrap">
        {render_dropin dropin="OpenId"}
    </div>

    <form id="create_account_form" action="{$submit_action}" method="post" class="validate-form">
        <fieldset>
            {if isset( $signup.has_openId ) }
                <input type="hidden" name="has_openId">
            {/if}
            <div class="row">
                <div class="col-sm-6 col-lg-6 margin-bottom-15">
                    <label>First Name <span class="red">*</span></label>
                    <input type="text" name="first_name" class="form-control required" placeholder="First Name" value="{$signup.first_name}">
                </div>
                <div class="col-sm-6 col-lg-6 margin-bottom-15">
                    <label>Last Name <span class="red">*</span></label>
                    <input type="text" name="last_name" class="form-control required" placeholder="Last Name" value="{$signup.last_name}">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 margin-bottom-15">
                    <label>Email Address <span class="red">*</span></label>
                    <input type="email" name="email_confirm" class="form-control required email" placeholder="Email Address" value="{$signup.email_confirm}">
                    <input type="email" name="email" style="display:none;" value="">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-lg-3 margin-bottom-15">
                    <label>Address</label>
                    <input class="form-control" type="text" name="address"  placeholder="Address" value="{$signup.address}">
                </div>
                <div class="col-sm-3 col-lg-3 margin-bottom-15">
                    <label>City</label>
                    <input class="form-control" type="text" name="city" placeholder="City" value="{$signup.city}">
                </div>
                <div class="col-sm-3 col-lg-3 margin-bottom-15">
                    <label>State</label>
                    <input class="form-control" type="text" name="state" placeholder="State" value="{$signup.state}">
                </div>
                <div class="col-sm-3 col-lg-3 margin-bottom-15">
                    <label>Zip Code</label>
                    <input class="form-control" type="text" name="zip_code" placeholder="Zip Code" value="{$signup.zip_code}">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 margin-bottom-15">
                    <label>Cell Phone</label>
                    <input class="form-control" type="tel" name="cell_phone" placeholder="Cell Phone" value="{$signup.cell_phone}">
                </div>
                <div class="col-sm-6 col-lg-6 margin-bottom-15">
                    <label>Home Phone</label>
                    <input class="form-control" type="tel" name="home_phone" placeholder="Home Phone" value="{$signup.home_phone}">
                </div>
            </div>
            {if !isset( $signup.has_openId )}
                <div class="row">
                    <div class="col-sm-6 col-lg-6 margin-bottom-15">
                        <label>Password  <span class="red">*</span></label>
                        <input type="password"  name="password" class="form-control required" placeholder="Password" value="">
                    </div>
                    <div class="col-sm-6 col-lg-6 margin-bottom-15">
                        <label>Re-Type Password  <span class="red">*</span></label>
                        <input type="password" name="password2" class="form-control required" placeholder="Re-Type Password" value="">
                    </div>
                </div>
            {/if}
            {if count($realtors) == 1}
                <input type="hidden" value="{$realtors[0]->get_id()}" name="preferred_agent">
            {elseif $SITE_OWNER instanceof Realtor}
                <input type="hidden" value="{$SITE_OWNER->get_id()}" name="preferred_agent">
            {else}
                <div class="row">
                    <div class="col-lg-6 col-lg-6 margin-bottom-15">
                        <label>Preferred Agent</label>
                        <select class="form-control" name="preferred_agent">
                            <option value="">No Prefered Agent</option>
                            {foreach from=$realtors item=realtor}
                                <option value="{$realtor->get_id()}">{$realtor->get_name()}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            {/if}
            <button class="btn btn-success" type="submit">Create Account</button>
        </fieldset>
    </form>
{/if}
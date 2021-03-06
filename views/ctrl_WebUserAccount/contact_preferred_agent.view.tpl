{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li class="active">Contact Your Preferred Agent</li>
    </ul>
{/render_layout_arguments}

{$PAGE_MENU}
<div class="page-header web-user-account-header">
    <h1>Contact Your Preferred Agent</h1>
</div>
{if $pref_realtor == ''}
    <div class="alert alert-danger alert-block">
        You do not have a selected Preferred Agent.
    </div>
{else}
    <form class="form-horizontal validate-form" action="/forms/" method="post">
        <input type="hidden" name="toEmail" value="{$pref_realtor.email}">
        <input type="hidden" name="toName" value="{$pref_realtor.name}">
        <input type="hidden" name="email_confirm" value="{$user.email}">
        <input type="hidden" name="first_name" value="{$user.fname}">
        <input type="hidden" name="last_name" value="{$user.lname}">
        <input type="hidden" name="lead_realtor" value="{$pref_realtor.id}">
        <input type="hidden" name="lc_custom_form_name" value="Contact Preferred Agent">
        <fieldset>
            <div class="form-group">
                <label class="col-sm-2 control-label">To</label>
                <div class="col-sm-10">
                    <strong>{$pref_realtor.name}  </strong> [{$pref_realtor.email}]
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">From</label>
                <div class="col-sm-10">
                    <strong>{$user.name} </strong> [{$user.email}]
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="phone">Phone <span class="red">*</span></label>
                <div class="col-sm-10">
                    <input class="form-control required" name="phone" id="phone" type="text" value="{$user.address.Home_Phone.value}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="subject">Subject</label>
                <div class="col-sm-10">
                    {if $subject}
                        <input class="form-control" id="subject" name="subject" type="text" readonly="readonly" value="{$subject}">
                    {else}
                        <input class="form-control required" id="subject" name="subject" type="text" value="">
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="message">Message <span class="red">*</span></label>
                <div class="col-sm-10">
                     <textarea rows="8" name="message" id="message" class="form-control required"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="phone">Respond to me via</label>
                <div class="col-sm-10">
                    <div class="radio">
                        <label>
                            <input type="radio" name="preferred_contact_method" value="email">
                            Email
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="preferred_contact_method" value="phone">
                            Phone
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="preferred_contact_method" value="Both">
                            Both
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <input type="submit" class="btn btn-success" name="Submit" value="Send">
            </div>
        </div>        
    </form>
{/if}
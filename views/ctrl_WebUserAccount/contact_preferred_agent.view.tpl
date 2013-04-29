{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a> <span class="divider">&gt;</span></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a> <span class="divider">&gt;</span></li>
        <li>Contact Your Preferred Agent</li>
    </ul>
{/render_layout_arguments}

{$PAGE_MENU}
<div id="web-user-account-header">
    <h1>Contact Your Preferred Agent</h1>
</div>
{if $pref_realtor == ''}
    <div class="alert alert-error alert-block">
        You do not have a selected Preferred Agent.
    </div>
{else}
    <form class="form-horizontal validate-form webUserAccountFormXXLARGE" action="/forms/" method="post">
        <input type="hidden" name="toEmail" value="{$pref_realtor.email}">
        <input type="hidden" name="toName" value="{$pref_realtor.name}">
        <input type="hidden" name="email_confirm" value="{$user.email}">
        <input type="hidden" name="first_name" value="{$user.name}">
        <input type="hidden" name="last_name" value="{$user.name}">
        <input type="hidden" name="lead_realtor" value="{$pref_realtor.id}">
        <input type="hidden" name="lc_custom_form_name" value="Contact Preferred Agent">
        <fieldset>
            <div class="control-group">
                <label class="control-label">To</label>
                <div class="controls">
                    <strong>{$pref_realtor.name}  </strong> [{$pref_realtor.email}]
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">From</label>
                <div class="controls">
                    <strong>{$user.name} </strong> [{$user.email}]
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="phone">Phone <span class="red">*</span></label>
                <div class="controls">
                    <input class="input-xxlarge required" name="phone" id="phone" type="text" value="{$user.address.Home_Phone.value}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="subject">Subject</label>
                <div class="controls">
                    {if $subject}
                        <input class="input-xxlarge" id="subject" name="subject" type="text" readonly="readonly" value="{$subject}">
                    {else}
                        <input class="input-xxlarge required" id="subject" name="subject" type="text" value="">
                    {/if}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="message">Message <span class="red">*</span></label>
                <div class="controls">
                     <textarea rows="8" name="message" id="message" class="input-xxlarge required"></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="phone">Respond to me via</label>
                <div class="controls">
                    <label class="radio">
                        <input type="radio" name="preferred_contact_method" value="email">
                        Email
                    </label>
                    <label class="radio">
                        <input type="radio" name="preferred_contact_method" value="phone">
                        Phone
                    </label>
                    <label class="radio">
                        <input type="radio" name="preferred_contact_method" value="Both">
                        Both
                    </label>
                </div>
            </div>
        </fieldset>
        <div class="form-actions">
            <input type="submit" value="Send" class="btn btn-primary">
        </div>
        <div><span class="red">*</span> is required</div>
    </form>
{/if}
{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a> <span class="divider">&gt;</span></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a> <span class="divider">&gt;</span></li>
        <li>Saved Searches</li>
    </ul>
{/render_layout_arguments}

{$PAGE_MENU}
<div id="web-user-account-header">
    <h1>Saved Searches</h1>
    <p>This page lists the searches you have saved.  You can edit/run your saved search through the "I want to..." options as well as start an email alert by clicking "Start Email Alert".</p>
    <div class="margin-bottom-20"><a href="{$ACTION_URLS.local_root}/edit_search/add/-1" class="btn btn-primary"><i class="icon-plus icon-white"></i> Add Saved Search</a></div>
</div>
{if $searches}
    <table class="table table-striped" id="account-saved-searches">
        <thead>
            <tr>
                <th style="width:155px;">Search Name</span></th>
                <th>Criteria</span></th>
                <th style="width:155px;">Notes</span></th>
                <th style="text-align:right">Actions &amp; Status</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$searches item=search}
                <tr>
                    <td>			
                        <a href="#" data-target="#searchNameForm_{$search.id}" data-description="#searchName_{$search.id}" data-account-action="open_search_name" id="searchNameButton_{$search.id}">{if $search.name}Edit{else}Add{/if} Search Name</a>
                        <p id="searchName_{$search.id}">{$search.name}</p>
                        <form id="searchNameForm_{$search.id}" class="margin-top-10" data-description="#searchName_{$search.id}" data-toggle="#searchNameButton_{$search.id}" data-account-action="update_search_name" action="/{$controller_alias}/save_search_name/{$search.id}" method="post" style="display:none;">
                            <input class="input-medium margin-bottom-5" name="search_name" placeholder="Enter Search Name" value="{$search.name}">
                            <input type="submit" class="btn" value="Save">
                        </form>			
                    </td>

                    <td>
                        {if $search.terms.Property_Type}
                            {foreach from=$search.terms.Property_Type.csv item=property_type_id}
                                {foreach from=$property_types item=property_type}
                                    {if $property_type->type_id == $property_type_id}
                                        <strong>Property Type:</strong> {$property_type->pretty_name}<br>
                                    {/if}
                                {/foreach}
                            {/foreach}
                        {/if}

                        {if $search.terms.CityArea.value || $search.terms.City.value}	
                            <strong> Area: </strong>
                            {if isset($search.terms.CityArea)}{$search.terms.CityArea.value|replace:',':', '}{/if}
                            {if isset($search.terms.CityArea) && isset($search.terms.City)}, {/if}{if isset($search.terms.City)}
                            {$search.terms.City.value|replace:',':', '}{/if}
                            <br>
                        {/if}

                        {if isset($search.terms.MaxBeds) && isset($search.terms.Bedrooms)}
                            <strong>Beds:</strong> {$search.terms.Bedrooms.value} - {$search.terms.MaxBeds.value}<br>
                        {elseif isset($search.terms.Bedrooms) && $search.terms.Bedrooms.value > 0}
                            <strong>Beds:</strong> {$search.terms.Bedrooms.value} +<br>  
                        {elseif isset($search.terms.MaxBeds) && $search.terms.MaxBeds.value > 0}
                            <strong>Beds:</strong> &lt; {$search.terms.MaxBeds.value}<br>
                        {else}
                            <strong>Beds:</strong> Any<br>
                        {/if}

                        {if isset($search.terms.MaxBaths) && isset($search.terms.Bathrooms)}
                            <strong>Beds:</strong> {$search.terms.Bathrooms.value} - {$search.terms.MaxBaths.value}<br>
                        {elseif isset($search.terms.Bathrooms) && $search.terms.Bathrooms.value > 0}
                            <strong>Beds:</strong> {$search.terms.Bathrooms.value} +<br>  
                        {elseif isset($search.terms.MaxBaths) && $search.terms.MaxBaths.value > 0}
                            <strong>Beds:</strong> &lt; {$search.terms.MaxBaths.value}<br>
                        {else}
                            <strong>Beds:</strong> Any<br>
                        {/if}

                        {if $search.terms.Max_Price.value || $search.terms.Min_Price.value}
                            <strong> Price: </strong> 
                            {if isset($search.terms.price_range.csv.0) && $search.terms.price_range.csv.0 gt 0}${$search.terms.price_range.csv.0|number_format:0:".":","}
                            {elseif $search.terms.Min_Price.value}${$search.terms.Min_Price.value|number_format:0:".":","}
                            {elseif $search.terms.Max_Price.value}
                                No Min
                            {/if} - 
                            {if isset($search.terms.price_range.csv.1) && $search.terms.price_range.csv.1 > 0}${$search.terms.price_range.csv.1|number_format:0:".":","}
                            {elseif $search.terms.Max_Price.value}${$search.terms.Max_Price.value|number_format:0:".":","}
                            {elseif $search.terms.Min_Price.value}
                                No Max
                            {/if}
                            <br>
                        {/if}
                    </td>

                    <td>
                        <a href="#" data-target="#searchNotesForm_{$search.id}" data-description="#searchNotes_{$search.id}" data-account-action="open_search_notes" id="searchNotesButton_{$search.id}">{if $search.notes}Edit{else}Add{/if} Notes</a>
                        <p id="searchNotes_{$search.id}">{$search.notes}</p>
                        <form style="display: none;" class="margin-top-10" data-account-action="update_search_notes" data-description="#searchNotes_{$search.id}" data-toggle="#searchNotesButton_{$search.id}" action="/{$controller_alias}/save_search_notes/{$search.id}" id="searchNotesForm_{$search.id}" method="post">
                            <textarea class="input-medium margin-bottom-5" name="notes" rows="4">{$search.notes}</textarea>
                            <input type="submit" class="btn" value="Save">
                        </form>
                    </td>

                    <td style="text-align:right">
                        <div class="margin-bottom-10">
                            {if $search.isEmailAlert}
                                <span class="label label-success">Status: Active</span>
                            {else}
                                <span class="label">Status: Inactive</span>
                            {/if}
                        </div>
                        <div class="margin-bottom-10">
                            {if $search.isEmailAlert}
                                <a href="{$ACTION_URLS.local_root}/setSearchFlag?returnToRef={$ACTION_URLS.local_root}/searches&amp;id={$search.id}" class="btn"  data-account-action="confirm_delete" data-confirm-text="Are you sure you want to stop this email alert?">Stop Email Alert</a>
                            {else}
                                <a href="{$ACTION_URLS.local_root}/setSearchFlag?returnToRef={$ACTION_URLS.local_root}/searches&amp;id={$search.id}" class="btn">Start Email Alert</a>
                            {/if}
                        </div>
                        <form method="post" action="">
                            <select class="input-large" name="save_search_cta" data-local-root="{$ACTION_URLS.local_root}" data-search-url-base="{$ACTION_URLS.search}" data-search-id="{$search.id}" data-search-url="{$search.url|escape:'javascript'}" data-status="{if $search.isEmailAlert}active{else}inactive{/if}">
                                <option value="">I want to...</option>
                                <option value="run">Run The Saved Search</option>
                                <option value="edit">Edit The Search Criteria</option>
                                <option value="toggle_alert">{if $search.isEmailAlert}Stop{else}Start{/if} The Email Alert</option>
                                <option value="delete">Delete This Search</option>
                            </select>
                        </form>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>

    <form class="form-horizontal" action="{$ACTION_URLS.local_root}/update_email_config/" method="post" id="accountdetails">
        <fieldset>
            <legend>Saved Search Preferences</legend>
            <div class="control-group">
                <label class="control-label" for="max_property_count">Property Count</label>
                <div class="controls">
                    <select class="input-xlarge" id="max_property_count" name="max_property_count">
                        <option value="0" {if $email_config.max_property_count eq 0}selected{/if}>Unlimited</option>
                        <option value="10" {if $email_config.max_property_count eq 10}selected{/if}>10</option>
                        <option value="20" {if $email_config.max_property_count eq 20}selected{/if}>20</option>
                        <option value="30" {if $email_config.max_property_count eq 30}selected{/if}>30</option>
                        <option value="40" {if $email_config.max_property_count eq 40}selected{/if}>40</option>
                        <option value="50" {if $email_config.max_property_count eq 50}selected{/if}>50</option>
                        <option value="60" {if $email_config.max_property_count eq 60}selected{/if}>60</option>
                        <option value="70" {if $email_config.max_property_count eq 70}selected{/if}>70</option>
                        <option value="80" {if $email_config.max_property_count eq 80}selected{/if}>80</option>
                        <option value="90" {if $email_config.max_property_count eq 90}selected{/if}>90</option>
                        <option value="100" {if $email_config.max_property_count eq 100}selected{/if}>100</option>
                    </select>
                    <span class="help-inline">The maximum number of properties per email.</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="max_property_count">Emails Per Search</label>
                <div class="controls">
                    <label class="radio">
                        <input type="radio" name="email_per_search" value="1"{if $email_config.email_per_search == "1"} checked="checked"{/if}>
                        One Email Per Search *
                    </label>
                    <label class="radio">
                        <input type="radio" name="email_per_search" value="0"{if $email_config.email_per_search == "0"} checked="checked"{/if}>
                        One Email For All Searches **
                    </label>
                </div>
            </div>
            <div class="form-actions">
                <input type="submit" value="Change Preferences" class="btn btn-primary">
            </div>
            <div>
                <small>* One Email Per Search - You will receive 1 email for each of the Email Alerts you have.</small><br>
                <small>** One Email For All Searches - All of your email alerts will be combined into 1 email.</small>
            </div>
        </fieldset>
    </form>
{else}
    <div class="alert alert-error">You currently have no Saved Searches.  You can add a search by clicking the "Add Saved Search" button above.</div>
{/if}

<footerargs>
    <script src="/js/webUserAccount/jquery.saved_searches_mgr.js"></script>
</footerargs>
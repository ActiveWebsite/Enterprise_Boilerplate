{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a> <span class="divider">&gt;</span></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a> <span class="divider">&gt;</span></li>
        <li>Favorites</li>
    </ul>
{/render_layout_arguments}

{$PAGE_MENU}

<div id="web-user-account-header">
    <h1>Favorites</h1>
    <p>The following is a list of your current Favorites.  You can add or delete properties in each Favorites category at any time.  You can also send each Favorites collection or individual Favorite properties via email.</p>
    <p>Click on the Favorites Category name to view its properties.  Click on Email to send the category to an email address.</p>
</div>

<table class="table table-striped" id="account-favorites">
    <tbody>
    {foreach from=$categories item=category key=index}
        {assign var=category_name value=$category->name}
        <tr>
            <td>
                <div class="clearfix">
                    <a class="pull-left" href="#" data-account-action="expand-favorite" data-target="#favorite_property_wrapper_{$index}">
                        <i class="icon-plus"></i> Category: {$category->name}
                    </a>
                    <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp; ({$property_list.$category_name|@count} Properties)</span>
                    <div class="btn-group pull-right">
                        <a class="btn fancybox" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="500" href="/popup/{$ACTION_URLS.contact}/send_properties_and_searches_form/c{$category->category_id}/subject/3"><i class="icon-envelope"></i> Email</a>
                        <a href="#" id="FavCatEditDescToggle_{$category->category_id}Toggle" data-target="#FavCatForm_{$category->category_id}" data-description="#FavCatDesc_{$category->category_id}Content" data-account-action="open_category_description" class="btn">{if $category->description}Edit{else}Add{/if} Description</a>
                        <a class="btn btn-warning" href="{$ACTION_URLS.local_root}/deleteCategory/{$category->category_id}" data-account-action="confirm_delete" data-confirm-text="Are you sure you want to delete this category ({$category->name|escape:javascript})?"><i class="icon-remove"></i> Delete</a>
                    </div>
                </div>
                <span class="bold block">Description:</span>
                <p id="FavCatDesc_{$category->category_id}Content">{if $category->description}{$category->description}{/if}</p> 
                <form method="post" class="margin-top-10" style="display:none;" id="FavCatForm_{$category->category_id}" data-toggle="#FavCatEditDescToggle_{$category->category_id}Toggle" data-description="#FavCatDesc_{$category->category_id}Content" data-account-action="update_category_description" action="{$ACTION_URLS.local_root}/edit_description/{$category->category_id}">
                    <div class="margin-bottom-5">
                        <textarea class="input-xxlarge" placeholder="Enter a description" name="description" rows="4">{$category->description}</textarea>
                    </div>
                    <input type="submit" class="btn" value="Save">
                </form>
                <div id="favorite_property_wrapper_{$index}" style="display: none;margin-bottom:30px">
                    {if $property_list.$category_name}
                        {foreach from=$property_list.$category_name item=property key=key}
                            <hr>
                            <div class="row-fluid">
                                {if !( $property instanceof Property )}{php}continue;{/php}{/if}
                                {if $property->is_expired}
                                    <div class="span12">
                                        <div class="alert alert-error">
                                            Property MLS #{$property->property_id} is no longer available.
                                            <br>
                                            <a class="btn" data-account-action="confirm_delete" data-confirm-text="Are you sure you want to delete favorite property {$property->property_id}?" href="{$ACTION_URLS.local_root}/deleteProperty/{$property->company_property_id}">Remove From Favorites</a>
                                        </div>
                                    </div>
                                {else}
                                    <div class="span4">
                                        <a href="{$ACTION_URLS.property_details}{$property->company_property_id}" target="_blank">
                                            <img src="{if $prop_pics[$key] instanceof PropertyPicture}{$prop_pics[$key]->getUrl}{else}{$prop_pics[$key]}{/if}/crop/259,175" alt="property photo">
                                        </a>
                                    </div>
                                    <div class="span4">
                                        <h4>
                                            {$property->information.street_number->value} {$property->street_name} {if $property->information.unit_no->value} #{$property->information.unit_no->value}{/if},<br>
                                            {$property->city}, {$property->state} {$property->information.zip_code->value}
                                        </h4>
                                        <ul class="unstyled">
                                            {if $property->information.bedrooms_total->value}<li>{$property->information.bedrooms_total->value|clean_bed_bath} Bed</li>{/if}
                                            {if $property->information.bathrooms_total->value}<li>{$property->information.bathrooms_total->value|clean_bed_bath} Bath</li>{/if}
                                            {if $property->information.list_price->value}<li>{$property->information.list_price->value}</li>{/if}
                                            {if $property->information.square_feet_total->value}<li>{$property->information.square_feet_total->value|number_format} Square Feet</li>{/if}
                                        </ul>
                                        <a href="{$ACTION_URLS.property_details}{$property->company_property_id}" target="_blank" class="btn">More info</a>
                                    </div>
                                    <div class="span4">
                                        <div style="display: none;">
                                            <a id="Showing_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="640" data-fancybox-width="555" target="_blank" href="/popup/forms/display/schedule_showing/?prop={$property->company_property_id}{if $pref_realtor && $pref_realtor.id}&amp;realtor_id={$pref_realtor.id}{/if}">Schedule A Showing</a>
                                            {if $pref_realtor}
                                                <a id="RequestInfo_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="640" data-fancybox-width="555" target="_blank" href="/popup/forms/display/request_info/?prop={$property->company_property_id}{if $pref_realtor && $pref_realtor.id}&amp;realtor_id={$pref_realtor.id}{/if}">Request Additional Info on This Property</a>
                                            {else}
                                                <a id="RequestInfo_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="640" data-fancybox-width="555" target="_blank" href="/popup/forms/display/request_info/?prop={$property->company_property_id}{if $pref_realtor && $pref_realtor.id}&amp;realtor_id={$pref_realtor.id}{/if}">Request Additional Info on This Property</a>
                                            {/if}
                                            <a id="SendToFriend_{$property->company_property_id}"  data-fancybox-type="iframe" data-fancybox-height="600" data-fancybox-width="550" href="/popup/{$ACTION_URLS.contact}/send_properties_and_searches_form/p{$property->company_property_id}/subject/3">Send Property to a Friend</a>
                                            <a id="ChangeCategory_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="250" data-fancybox-width="500" href="/popup/{$ACTION_URLS.local_root}/transfer_favorite_form/{$property->company_property_id}/{$category->category_id}">Change Property Category</a>
                                        </div>
                                        <form method="post" action="">
                                            <select class="span12" data-account-action="openCTA" data-name="{$property->getStreetAddress()|clean_for_attribute}" data-property="{$property->company_property_id}">
                                                <option>I want to...</option>
                                                <option value="RequestInfo">Request Additional Information</option>
                                                <option value="Showing">Request a Showing</option>
                                                <option value="SendToFriend">Send to a Friend</option>
                                                <option value="ChangeCategory">Change Property Category</option>
                                                <option value="Delete">Remove from Favorites</option>
                                            </select>
                                        </form>
                                        <div>
                                            <a href="#" class="pull-right" data-account-action="open_property_note" data-target="#notesForm_{$property->company_property_id}" data-description="#notesDesc_{$property->company_property_id}" id="notesToggleButton_{$property->company_property_id}">{if $property->notes}Edit{else}Add{/if} Notes</a>
                                            <span class="bold block">Notes:</span>
                                            <p id="notesDesc_{$property->company_property_id}">{if $property->notes}{$property->notes}{/if}</p>
                                            <form method="post" style="display:none;" id="notesForm_{$property->company_property_id}" data-description="#notesDesc_{$property->company_property_id}" data-toggle="#notesToggleButton_{$property->company_property_id}" data-account-action="update_property_note" action="{$ACTION_URLS.local_root}/updateFavoriteNotes/{$user.id}/{$property->company_property_id}">
                                                <div class="margin-bottom-5">
                                                    <textarea class="span12" name="notes" rows="6">{if $property->notes}{$property->notes}{/if}</textarea>
                                                </div>
                                                <input type="submit" value="Update" class="btn">
                                            </form>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        {/foreach}
                    {else}
                        <hr>
                        <p>You do not have any properties in this favorites collection.<p>
                        <p><a href="{$ACTION_URLS.search}?no_favs=1" class="btn">Search properties to begin adding favorites</a></p>
                    {/if}
                </div>
            </td>
        </tr>
    {/foreach}
    </tbody>
</table>

<h2 class="margin-bottom-10">Add Category</h2>
<form class="form-inline validate-form" action="{$ACTION_URLS.local_root}/add_category">
    <input class="input-xlarge required" name="category_name" placeholder="Category Name" id="category_name" type="text" class="form_input_field">
    <input type="submit" value="Add" class="btn btn-primary">
</form>

<footerargs>
    <script src="/js/webUserAccount/jquery.favorite_properties_mgr.js"></script>
</footerargs>
{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li class="active">Favorites</li>
    </ul>
{/render_layout_arguments}
{$PAGE_MENU}
<div class="page-header web-user-account-header">
    <h1>Favorites</h1>
    <p class="lead">The following is a list of your current Favorites.  You can add or delete properties in each Favorites category at any time.  You can also send each Favorites collection or individual Favorite properties via email.</p>
    <p class="lead">Click on the Favorites Category name to view its properties.  Click on Email to send the category to an email address.</p>
</div>
{if $categories}
    <table class="table table-striped" id="account-favorites">
        <tbody>
        {foreach from=$categories item=category key=index}
            {assign var=category_name value=$category->name}
            <tr class="fav-property-category-row">
                <td>
                    <div class="clearfix">
                        <div class="md-pull-left margin-bottom-15">
                            <a href="#" data-account-action="expand-favorite" data-target="#favorite_property_wrapper_{$index}">
                                <i class="icon icon-plus"></i> Category: {$category->name}
                            </a>
                            <span class="fav-prop-counter">(<span id="fav-count-category-{$category->category_id}">{$property_list.$category_name|@count}</span> Properties)</span>
                        </div>
                        <div class="btn-group md-pull-right margin-bottom-15">
                            <a class="btn btn-default fancybox" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="auto" href="/popup/{$ACTION_URLS.contact}/send_properties_and_searches_form/c{$category->category_id}/subject/3"><i class="icon icon-envelope"></i> Email</a>
                            <a href="#" id="FavCatEditDescToggle_{$category->category_id}Toggle" data-target="#FavCatForm_{$category->category_id}" data-description="#FavCatDesc_{$category->category_id}Content" data-account-action="open_category_description" class="btn btn-default">{if $category->description}Edit{else}Add{/if} Description</a>
                            <a class="btn btn-danger" href="{$ACTION_URLS.local_root}/deleteCategory/{$category->category_id}" data-account-action="confirm_delete" data-confirm-text="Are you sure you want to delete this category ({$category->name|escape:javascript})?"><i class="icon icon-remove"></i> Delete</a>
                        </div>
                    </div>
                    <span class="bold block">Description:</span>
                    <p id="FavCatDesc_{$category->category_id}Content">{if $category->description}{$category->description}{/if}</p> 
                    <form method="post" class="margin-top-10 margin-bottom-0" style="display:none;" id="FavCatForm_{$category->category_id}" data-toggle="#FavCatEditDescToggle_{$category->category_id}Toggle" data-description="#FavCatDesc_{$category->category_id}Content" data-account-action="update_category_description" action="{$ACTION_URLS.local_root}/edit_description/{$category->category_id}">
                        <textarea class="form-control margin-bottom-5" placeholder="Enter a description" name="description" rows="4">{$category->description}</textarea>
                        <input type="submit" class="btn btn-primary" name="Submit" value="Save">
                    </form>
                    <div id="favorite_property_wrapper_{$index}" style="display: none;" class="margin-bottom-30">
                        {if $property_list.$category_name}
                            {foreach from=$property_list.$category_name item=property key=key}
                                {if !( $property instanceof Property )}{php}continue;{/php}{/if}
                                {if $property->is_expired}
                                    <div class="alert alert-danger fav-property-row" data-category="fav-count-category-{$category->category_id}">
                                        <hr class="margin-top-15">
                                        <p>Property MLS #{$property->property_id} is no longer available.</p>
                                        <a class="btn btn-danger" data-account-action="confirm_delete" data-confirm-text="Are you sure you want to delete favorite property {$property->property_id}?" href="{$ACTION_URLS.local_root}/deleteProperty/{$property->company_property_id}">Remove From Favorites</a>
                                    </div>
                                {else}
                                    <div class="row fav-property-row padding-left-20 padding-right-20">
                                        <hr class="margin-top-15">
                                        <div class="col-sm-3 margin-bottom-10">
                                            <a title="View Property" href="{$ACTION_URLS.property_details}{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}" target="_blank">
                                                <img class="full-width-high-dpi margin-top-5" src="{if $prop_pics[$key] instanceof PropertyPicture}{$prop_pics[$key]->getUrl()}{else}{$prop_pics[$key]}{/if}/crop/264,176" srcset="{if $prop_pics[$key] instanceof PropertyPicture}{$prop_pics[$key]->getUrl()}{else}{$prop_pics[$key]}{/if}/crop/396,264 1.5x, {if $prop_pics[$key] instanceof PropertyPicture}{$prop_pics[$key]->getUrl()}{else}{$prop_pics[$key]}{/if}/crop/528,352 2x, {if $prop_pics[$key] instanceof PropertyPicture}{$prop_pics[$key]->getUrl()}{else}{$prop_pics[$key]}{/if}/crop/792,528 3x" alt="property photo">
                                            </a>
                                        </div>
                                        <div class="col-sm-5 margin-bottom-10">
                                            <h4 class="margin-top-0">
                                                <a class="brand-brown font-20" title="View Property" target="_blank" href="{$ACTION_URLS.property_details}{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}">
                                                    {$property->getStreetAddress()|default:"Private Address"} <br>{$property->city}, {$property->state} {$property->information.zip_code->value}
                                                </a>
                                            </h4>
                                            <ul class="list-unstyled">
                                                {if $property->information.list_price->value || $property->information.property_status_id->value}
                                                    <li>{$property->information.list_price->value}{if $property->information.property_status_id->value} | <span class="status-{if $property->information.property_status_id->value|lower=='active'}active{elseif $property->information.property_status_id->value|lower=='sold'}sold{else}pending{/if} upper">{$property->information.property_status_id->value}</span>{/if}</li>
                                                {/if}
                                                {if $property->information.bedrooms_total->value> 0 || $property->information.baths_full->value>0 || $property->information.baths_half->value>0}
                                                    <li>{if $property->information.bedrooms_total->value>0}{$property->information.bedrooms_total->value} Bed{if $property->information.bedrooms_total->value> 1}s{/if}, {/if}{$property->information.baths_full->value}{if $property->information.baths_half->value && $property->information.baths_half->value>0}/{$property->information.baths_half->value}{/if} Baths</li>
                                                {/if}
                                                {if $property->information.sqft_total_combined->value}
                                                    <li>{$property->information.sqft_total_combined->value|number_format} &plusmn; Sq Ft</li>
                                                {/if}
                                                {if $property->information.lot_size->value>0}
                                                    <li>{$property->information.lot_size->value|number_format} &plusmn; Sq Ft Lot</li>
                                                {/if}
                                                <li class="gray">MLS# {$property->property_id}<li>
                                            </ul>
                                            <a href="{$ACTION_URLS.property_details}{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}" target="_blank" class="btn btn-default" title="View Property">More info</a>
                                        </div>
                                        <div class="col-sm-4 margin-bottom-10">
                                            <div style="display: none;">
                                                <a id="Showing_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="auto" data-fancybox-width="555" target="_blank" href="/popup/forms/display/schedule_showing/?prop={$property->company_property_id}{if $pref_realtor && $pref_realtor.id}&amp;realtor_id={$pref_realtor.id}{/if}">Schedule A Showing</a>
                                                {if $pref_realtor}
                                                    <a id="RequestInfo_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="auto" data-fancybox-width="555" target="_blank" href="/popup/forms/display/request_info/?prop={$property->company_property_id}{if $pref_realtor && $pref_realtor.id}&amp;realtor_id={$pref_realtor.id}{/if}">Request Additional Info on This Property</a>
                                                {else}
                                                    <a id="RequestInfo_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="auto" data-fancybox-width="555" target="_blank" href="/popup/forms/display/request_info/?prop={$property->company_property_id}{if $pref_realtor && $pref_realtor.id}&amp;realtor_id={$pref_realtor.id}{/if}">Request Additional Info on This Property</a>
                                                {/if}
                                                <a id="SendToFriend_{$property->company_property_id}"  data-fancybox-type="iframe" data-fancybox-height="auto" data-fancybox-width="550" href="/popup/{$ACTION_URLS.contact}/send_properties_and_searches_form/p{$property->company_property_id}/subject/3">Send Property to a Friend</a>
                                                <a id="ChangeCategory_{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-height="auto" data-fancybox-width="500" href="/popup/{$ACTION_URLS.local_root}/transfer_favorite_form/{$property->company_property_id}/{$category->category_id}">Change Property Category</a>
                                            </div>
                                            <form method="post" action="/{$controller_alias}/manage_favorites/" class="margin-bottom-0">
                                                <select class="form-control" data-account-action="openCTA" data-name="{$property->getStreetAddress()|clean_for_attribute}" data-property="{$property->company_property_id}">
                                                    <option>I want to...</option>
                                                    <option value="RequestInfo">Request Additional Information</option>
                                                    <option value="Showing">Request a Showing</option>
                                                    <option value="SendToFriend">Send to a Friend</option>
                                                    <option value="ChangeCategory">Change Property Category</option>
                                                    <option value="Delete">Remove from Favorites</option>
                                                </select>
                                            </form>
                                            <div class="margin-top-10">
                                                <a href="#" class="pull-right" data-account-action="open_property_note" data-target="#notesForm_{$property->company_property_id}" data-description="#notesDesc_{$property->company_property_id}" id="notesToggleButton_{$property->company_property_id}">{if $property->notes}Edit{else}Add{/if} Notes</a>
                                                <span class="bold block">Notes:</span>
                                                <p id="notesDesc_{$property->company_property_id}">{if $property->notes}{$property->notes}{/if}</p>
                                                <form method="post" class="margin-bottom-0" style="display:none;" id="notesForm_{$property->company_property_id}" data-description="#notesDesc_{$property->company_property_id}" data-toggle="#notesToggleButton_{$property->company_property_id}" data-account-action="update_property_note" action="{$ACTION_URLS.local_root}/updateFavoriteNotes/{$user.id}/{$property->company_property_id}">
                                                    <textarea name="notes" cols="20" class="form-control" rows="6">{if $property->notes}{$property->notes}{/if}</textarea>
                                                    <div class="margin-top-5">
                                                        <input type="submit" class="btn btn-primary" name="Submit" value="Update">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            {/foreach}
                        {else}
                            <hr>
                            <p>You do not have any properties in this favorites collection.<p>
                            <p><a href="{$ACTION_URLS.search}" class="btn btn-primary">Search properties to begin adding favorites</a></p>
                        {/if}
                    </div>
                </td>
            </tr>
        {/foreach}
        </tbody>
    </table>
{else}
    <div class="alert alert-info">
        <p>You do not have any favorite properties.</p>
        <p><a href="{$ACTION_URLS.search}" class="btn btn-primary">Search properties to begin adding favorites</a></p>
    </div>
{/if}
<hr class="margin-top-40">
<h2 class="margin-bottom-10 margin-top-0">Add Category</h2>
<form class="validate-form row" action="{$ACTION_URLS.local_root}/add_category">
    <div class="col-sm-4">
        <div class="input-group">
            <input class="form-control" required name="category_name" placeholder="Category Name" id="category_name" type="text">
            <span class="input-group-btn"><input type="submit" class="btn btn-primary" name="Submit" value="Add"></span>
        </div>
    </div>
</form>

<footerargs>
    <script src="/js/webUserAccount/jquery.favorite_properties_mgr.js"></script>
</footerargs>
<head>
    <title>Add A Favorite Property</title>
</head>
<div class="popupBody">
    <h1>Add A Favorite Property</h1>
    <div class="alert alert-success alert-block" id="success-message" style="display:none;">
    	Your property has been added to your favorites.
    </div>
    {if $property_id}
        <form method="post" data-success-element="#success-message" data-account-action="add_favorite_property" action="{$ACTION_URLS.account}addProperty/{$property_id}">
            <div class="row-fluid">
                <div class="span12">
                    <label for="favorite_category">Choose a Category</label>
                    <select name="category" id="favorite_category" class="span12">
                        {foreach from=$cats item=cat}
                        <option value="{$cat->category_id}">{$cat->name}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <label for="favorite_new_category">Or, Create a New Category</label>
                    <input type="text" id="favorite_new_category" class="span12" placeholder="Enter new category name" name="new_category">
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <label for="notes" class="block bold">Notes</label>
                    <textarea class="span12" id="notes" rows="3" name="notes" placeholder="Add Notes"></textarea>
                </div>
            </div>
            <input type="submit" name="submit" value="Add Property" title="Add Property" class="btn btn-primary margin-top-10">
        </form>
    {/if}
</div>
<footerargs>
    <script src="/js/webUserAccount/jquery.favorite_properties.js"></script>
</footerargs>
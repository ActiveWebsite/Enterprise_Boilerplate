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
            <div class="margin-bottom-15">
                <label for="favorite_category">Choose a Category</label>
                <select class="form-control" name="category" id="favorite_category">
                    {foreach from=$cats item=cat}
                    <option value="{$cat->category_id}">{$cat->name}</option>
                    {/foreach}
                </select>
            </div>
            <div class="margin-bottom-15">
                <label for="favorite_new_category">Or, Create a New Category</label>
                <input class="form-control" type="text" id="favorite_new_category" placeholder="Enter new category name" name="new_category">
            </div>
            <div class="margin-bottom-15">
                <label for="notes" class="block bold">Notes</label>
                <textarea class="form-control" id="notes" rows="3" name="notes" placeholder="Add Notes"></textarea>
            </div>
            <input type="submit" name="submit" value="Add Property" title="Add Property" class="btn btn-success">
        </form>
    {/if}
</div>
<footerargs>
    <script src="/js/webUserAccount/jquery.favorite_properties.js"></script>
</footerargs>
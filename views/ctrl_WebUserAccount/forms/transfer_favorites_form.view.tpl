<div class="popupBody">
	<h1>Change Property Category</h1>
	{if $messages->isMsgs() === true}
		{if $messages->isErrors() === true}
			 <div class="alert alert-danger alert-block">
				<strong>Error:</strong><br>
				{$messages->getErrors(true)}
			</div>
		{/if}
		{if $messages->isAlerts() === true}
			<div class="alert alert-info alert-block">
				<strong>Alert:</strong><br>
				{$messages->getAlerts(true)}
			</div>
		{/if}
		{if $messages->isNormals() === true}
			<div class="alert alert-success alert-block">
				<strong>Message:</strong><br>
				{$messages->getNormal(true)}
			</div>
		{/if}
	{/if}
	{if $current_category}
		<p>Current Category: <strong>{$current_category.name}</strong></p>
	{/if}
	<form class="propCatChange validate-form" method="post" action="{$ACTION_URLS.local_root}/transfer_favorite/{$property_id}/{$current_category.category_id}">
		<div class="form-group">
			<select name="category" class="form-control required">
				<option value="">Choose A Category</option>
				{foreach from=$cats_dict item=category}
					<option value="{$category.category_id}">{$category.name}</option>
				{/foreach}
			</select>
		</div>
		<input type="submit" value="Change Category" class="btn btn-success">
	</form>
</div>

<form method="post" action="/{$controller_alias}/">
	<fieldset class="clearfix">
		<div class="margin-bottom-10">
			<label for="qs-as-field-01">Any Part of Name</label>
			<input id="qs-as-field-01" type="text" value="" name="realtor_name">
		</div>
		<div class="margin-bottom-10">
			<label for="qs-as-field-02">Office</label>
			<select id="qs-as-field-02" title="Select Office" name="office_id">
				<option value="">Any</option>
				{if $offices}
					{foreach from=$offices item=office}
						<option value="{$office.id}">{$office.name}</option>
					{/foreach}
				{/if}    
			</select>
		</div>
		<div class="margin-bottom-10">
			<label for="qs-as-field-03">Language</label>
			<select id="qs-as-field-03" title="Select Language" name="spoken_language">
				<option value="">Any</option>
				{if $language_list}
					{foreach from=$language_list item=name key=value}
						<option value="{$name}">{$name}</option>
					{/foreach}
				{/if}    
			</select>
		</div>
		<input type="submit" name="Search" value="Search" class="btn btn-primary pull-right">
	</fieldset>
</form>
<form method="post" action="/{$controller_alias}/">
	<fieldset class="clearfix">
		<div class="row-fluid margin-bottom-10">
			<div class="span12">
				<label for="qs-as-field-01">Any Part of Name</label>
				<input class="span12" id="qs-as-field-01" type="text" value="" name="realtor_name">
			</div>
		</div>
		<div class="row-fluid margin-bottom-10">
			<div class="span12">
				<label for="qs-as-field-02">Office</label>
				<select id="qs-as-field-02" class="span12" title="Select Office" name="office_id">
					<option value="">Any</option>
					{if $offices}
						{foreach from=$offices item=office}
							<option value="{$office.id}">{$office.name}</option>
						{/foreach}
					{/if}    
				</select>
			</div>
		</div>
		<div class="row-fluid margin-bottom-10">
			<div class="span12">
				<label for="qs-as-field-03">Language</label>
				<select id="qs-as-field-03" class="span12" title="Select Language" name="spoken_language">
					<option value="">Any</option>
					{if $language_list}
						{foreach from=$language_list item=name key=value}
							<option value="{$name}">{$name}</option>
						{/foreach}
					{/if}    
				</select>
			</div>
		</div>
		<input type="submit" name="Search" value="Search" class="btn pull-right">
	</fieldset>
</form>
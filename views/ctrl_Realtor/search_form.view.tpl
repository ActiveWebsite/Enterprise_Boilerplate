<div id="agent-roster-page">
	<div class="page-header">
		<h1>Realtors</h1>
	</div>
	<form action="{$form}" method="post">	
		<fieldset class="row">
			<div class="col-sm-4">
				<label for="input01" class="bold">Any Part of Name</label>
				<input type="text" class="form-control margin-bottom-15" id="input01" name="realtor_name" placeholder="Enter Any Part of Name" value="{$smarty.request.realtor_name}">
			</div>
			{if $office_list}
				<div class="col-sm-2">
					<label for="input02" class="bold">Office</label>
					<select class="form-control margin-bottom-15" id="input02" name="office_id">
						<option value="">Any</option>
						{foreach from=$office_list item=thisOffice}
							<option value="{$thisOffice->get_id()}"{if $smarty.request.office_id == $thisOffice->get_id()} selected="selected"{/if}>{$thisOffice->get_name()}</option>
						{/foreach}
					</select>
				</div>
			{/if}
			{if $additional_filters.spoken_languages}
				<div class="col-sm-2">
					<label for="input03" class="bold">Language</label>
					<select class="form-control margin-bottom-15" id="input03" name="spoken_language">
						<option value="">Any</option>
						{foreach from=$additional_filters.spoken_languages item=language}
							<option value="{$language}"{if $smarty.request.spoken_language == $language || $filters.spoken_language|lower == $language|lower} selected="selected"{/if}>{$language}</option>
						{/foreach}
					</select>
				</div>
			{/if}
			{if $additional_filters.designations}
				<div class="col-sm-2">
					<label for="input04" class="bold">Designations</label>
					<select class="form-control margin-bottom-15" id="input04" name="designation">
						<option value="">Any</option>
						{foreach from=$additional_filters.designations item=designation}
							<option value="{$designation}"{if $smarty.request.designation == $designation || $filters.realtor_info.Designations|lower == $designation|lower} selected="selected"{/if}>{$designation}</option>
						{/foreach}
					</select>
				</div>
			{/if}
			<div class="col-sm-2 margin-bottom-15">
				<label>&nbsp;</label>
				<input type="submit" class="btn btn-primary btn-block" name="Search" value="Search">
			</div>
		</fieldset>
	</form>
	<hr class="margin-top-5">	
	{$RENDERED_REALTORS}
</div>
<footerargs>
	<script src="/js/buildlist.js?scripts=/js/qtip2/jquery.qtip.2.0.1.min.js,/js/agent_roster.js"></script>
</footerargs>
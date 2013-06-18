<div id="agent-roster-page">
	<h1 class="page-heading">Realtors</h1>
	<form action="{$form}" method="post">	
		<fieldset class="row-fluid">
			<div class="span4">
				<label for="input01" class="bold">Any Part of Name</label>
				<input type="text" class="span12" id="input01" name="realtor_name" placeholder="Enter Any Part of Name" value="{$smarty.request.realtor_name}">
			</div>
			{if $office_list}
				<div class="span2">
					<label for="input02" class="bold">Office</label>
					<select class="span12" id="input02" name="office_id">
						<option value="">Any</option>
						{foreach from=$office_list item=thisOffice}
							<option value="{$thisOffice->get_id()}"{if $smarty.request.office_id == $thisOffice->get_id()} selected="selected"{/if}>{$thisOffice->get_name()}</option>
						{/foreach}
					</select>
				</div>
			{/if}
			{if $additional_filters.spoken_languages}
				<div class="span2">
					<label for="input03" class="bold">Language</label>
					<select class="span12" id="input03" name="spoken_language">
						<option value="">Any</option>
						{foreach from=$additional_filters.spoken_languages item=language}
							<option value="{$language}"{if $smarty.request.spoken_language == $language || $filters.spoken_language|lower == $language|lower} selected="selected"{/if}>{$language}</option>
						{/foreach}
					</select>
				</div>
			{/if}
			{if $additional_filters.designations}
				<div class="span2">
					<label for="input04" class="bold">Designations</label>
					<select class="span12" id="input04" name="designation">
						<option value="">Any</option>
						{foreach from=$additional_filters.designations item=designation}
							<option value="{$designation}"{if $smarty.request.designation == $designation || $filters.realtor_info.Designations|lower == $designation|lower} selected="selected"{/if}>{$designation}</option>
						{/foreach}
					</select>
				</div>
			{/if}
			<div class="span2">
				<label>&nbsp;</label>
				<input type="submit" class="btn btn-block" name="Search" value="Search">
			</div>
		</fieldset>
	</form>
	<hr>	
	{$RENDERED_REALTORS}
</div>
<footerargs>
	<script src="/js/qtip2/jquery.qtip.min.js"></script>
	<script src="/js/agent_roster.js"></script>
</footerargs>
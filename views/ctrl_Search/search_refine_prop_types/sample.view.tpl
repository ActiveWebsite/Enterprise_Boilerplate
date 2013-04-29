<h2 class="expand-trigger active">Section Title</h2>
<div class="expand-block">
	<div class="control-group">
		<label class="control-label" for="sb_01">Select Box</label>
		<div class="controls">
			<select id="sb_01" class="span12" title="Select " name="Bedrooms">
				{if $search_config.bedrooms instanceof CompanySearchConfig}
					{foreach from=$search_config.bedrooms->getValues() item=name key=value}
						<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
					{/foreach}
				{/if}
			</select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="sb_02">Select Box</label>
		<div class="controls">
			<select id="sb_01" class="span12" title="Select " name="Bedrooms">
				{if $search_config.bedrooms instanceof CompanySearchConfig}
					{foreach from=$search_config.bedrooms->getValues() item=name key=value}
						<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
					{/foreach}
				{/if}
			</select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="sb_01">Input Box</label>
		<div class="controls">
			<input type="text" id="sb_01" class="span12" title="Select " name="Bedrooms">
		</div>
	</div>
</div>

<h2 class="expand-trigger">Section Title 2</h2>
<div class="expand-block" style="display:none;">
	<div class="control-group">
		<label class="control-label" for="sb_01">Select Box</label>
		<div class="controls">
			<select id="sb_01" class="span12" title="Select " name="Bedrooms">
				{if $search_config.bedrooms instanceof CompanySearchConfig}
					{foreach from=$search_config.bedrooms->getValues() item=name key=value}
						<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
					{/foreach}
				{/if}
			</select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="sb_02">Select Box</label>
		<div class="controls">
			<select id="sb_01" class="span12" title="Select " name="Bedrooms">
				{if $search_config.bedrooms instanceof CompanySearchConfig}
					{foreach from=$search_config.bedrooms->getValues() item=name key=value}
						<option value="{$value}"{if $search_narrowers.SV_Bedrooms == $value || $search_dict.terms.Bedrooms.value == $value} selected="selected"{/if}>{$name}</option>
					{/foreach}
				{/if}
			</select>
		</div>
	</div>

    <div class="control-group">
        <label class="control-label" for="asf-bedrooms">Multi Select</label>
        <div class="controls">
            <select id="asf-bedrooms" title="Select Multiple Options" name="Bedrooms[]" class="span12 msw2-select">
                <option value="">Choose More Options</option>
                {if $search_config.bedrooms instanceof CompanySearchConfig}
                    {foreach from=$search_config.bedrooms->getValues() item=name key=value name=config_loop}
                        <option value="{$value}"{if $smarty.foreach.config_loop.first && !$search_narrowers.MV_Bedrooms && !$search_dict.terms.Bedrooms} selected="selected"{/if}{if $value != '' && (($search_narrowers.MV_Bedrooms && is_array($search_narrowers.MV_Bedrooms) && array_key_exists($value,$search_narrowers.MV_Bedrooms)) || ($search_dict.terms.Bedrooms && is_array($search_dict.terms.Bedrooms.csv) && in_array($value,$search_dict.terms.Bedrooms.csv)))} disabled="disabled"{/if}>{$name}</option>
                    {/foreach}
                {/if}
            </select>
            <ul class="msw2-list">
                <li class="msw2-list-placeholder"></li>
                {if $search_config.bedrooms instanceof CompanySearchConfig}
                    {foreach from=$search_config.bedrooms->getValues() item=name key=value name=config_loop}
                        {if $value != '' && (($search_narrowers.MV_Bedrooms && is_array($search_narrowers.MV_Bedrooms) && array_key_exists($value,$search_narrowers.MV_Bedrooms)) || ($search_dict.terms.Bedrooms && is_array($search_dict.terms.Bedrooms.csv) && in_array($value,$search_dict.terms.Bedrooms.csv)))}
                            <li><i class="icon-remove msw2-remove" title="Remove"></i><input type="hidden" name="Bedrooms[]" value="{$value}"> {$name}</li>
                        {/if}
                    {/foreach}
                {/if}
            </ul>
        </div>
    </div>
</div>
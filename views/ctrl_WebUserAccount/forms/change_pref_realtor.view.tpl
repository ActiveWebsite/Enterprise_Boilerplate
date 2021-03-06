<head>
 	<title>Change Preferred Agent</title>
</head>
<div class="popupBody">
    <h1>Change Preferred Agent</h1>
    <p>Current Preferred Agent: {if $pref_realtor}{$pref_realtor->get_name()}{else}None{/if}</p>
    <form method="post" action="{$ACTION_URLS.local_root}/change_pref_realtor">
		<div class="form-group">
			<select name="realtor" class="form-control">
				<option value="None">None</option>
				{foreach from=$realtors item=realtor}
					<option value="{$realtor->get_id()}" {if $pref_realtor instanceof Realtor && $realtor->get_id() eq $pref_realtor->get_id()} selected{/if}>{$realtor->get_name()}</option>
				{/foreach}
			</select>
		</div>
        <input type="submit" value="Change Realtor" class="btn btn-success">
    </form>
</div>
<head>
 	<title>Change Preferred Agent</title>
</head>
<div class="popupBody">
    <h1>Change Preferred Agent</h1>
    <p>Current Preferred Agent: {if $pref_realtor}{$pref_realtor->get_name()}{else}None{/if}</p>
    <form method="post" action="{$ACTION_URLS.local_root}/change_pref_realtor">
		<select name="realtor" class="margin-bottom-15">
			<option value="None">None</option>
			{foreach from=$realtors item=realtor}
				<option value="{$realtor->get_id()}" {if $pref_realtor instanceof Realtor && $realtor->get_id() eq $pref_realtor->get_id()} selected{/if}>{$realtor->get_name()}</option>
			{/foreach}
		</select>
        <input type="submit" value="Change Realtor" class="btn btn-success">
    </form>
</div>
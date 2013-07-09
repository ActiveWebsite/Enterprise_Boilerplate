<head>
 	<title>{if $subject}{$subject}{else}Contact Us{/if}</title>
</head>
<div class="popupBody">
	<h1>
	{if $subject}
		{$subject}
	{else}
		Contact Us
	{/if}
	</h1>
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
</div>
{$GA_CODE->getCode($SITE_OWNER)}
{if $refresh_parent}
	{literal}
	<script>
		try {
			window.parent.location.reload(true);
		} catch(e) {
			window.opener.location.reload(true);
			window.close();
		}
	</script>
	{/literal}
{/if}
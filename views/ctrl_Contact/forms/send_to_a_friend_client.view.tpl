<head>
	<title>Send To A Friend</title>
</head>
{assign var=formSendAccepted value=false}
<div class="popupBody">
	<h1>Send To A Friend</h1>
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
			{assign var=formSendAccepted value=true}
			<div class="alert alert-success alert-block">
				<strong>Message:</strong><br>
				{$messages->getNormal(true)}
			</div>
		{/if}
	{/if}
	{if !$formSendAccepted}
		<form method="post" class="validate-form" action="{$ACTION_URLS.local_root}/send_properties_and_searches/{$pretty_url_args}">
			{if $property}
				<div class="popup-related-property">
					<h4>
						{if $property.address_display_bit}
							{$property.fullStreetAddress}
						{elseif $property.city || $property.state}
							{$property.city}, {$property.state}
						{else}
							No Address Available
						{/if}
					</h4>
					{if $property.property_id}MLS# {$property.property_id}{/if}
				</div>
				<input type="hidden" name="property_id" value="{if $property.company_property_id}{$property.company_property_id}{/if}">
			{/if}   
			{if $toName === false}
				<div class="row">
					<div class="col-sm-6 margin-bottom-15">
						<label for="toName">To Name: <span class="red">*</span></label>
						<input id="toName" class="form-control required" name="toName" type="text" placeholder="Enter To Name">
					</div>
					<div class="col-sm-6 margin-bottom-15">
						<label for="toEmail">To Email: <span class="red">*</span></label>
						<input id="toEmail" class="form-control required email" name="toEmail" type="email" placeholder="Enter To Email">
					</div>
				</div>
			{else}
				<div class="row">
					<div class="col-sm-6 margin-bottom-15">
						<label for="toName">To Name: <span class="red">*</span></label>
						<input id="toName" type="hidden" name="toName" value="{$toName}">
						<input type="text" class="form-control" value="{$toName}" readonly="readonly">
					</div>
					<div class="col-sm-6 margin-bottom-15">
						<label for="toEmail">To Email: <span class="red">*</span></label>
						<input id="toEmail" type="hidden" name="toEmail" value="{$toEmail}">
						<input type="text" class="form-control" value="{$toEmail}" readonly="readonly">
					</div>
				</div>
			{/if}
			<div class="row">
				<div class="col-sm-6 margin-bottom-15">
					<label for="fromName">From Name: <span class="red">*</span></label>
					<input id="fromName" class="form-control required" name="fromName" value="{$fromName}" type="text" placeholder="Enter From Name">
				</div>
				<div class="col-sm-6 margin-bottom-15">
					<label for="fromEmail">From Email: <span class="red">*</span></label>
					<input id="fromEmail" class="form-control required email" type="email" name="fromEmail" value="{$fromEmail}" placeholder="Enter From Email">
				</div>
			</div>
			{if $subject}
				<div class="margin-bottom-15">
					<label for="subject">Subject: <span class="red">*</span></label>
					<input id="subject" type="hidden" name="subject" value="{$subject}">
					<input type="text" value="{$subject}" class="form-control" readonly="readonly">
				</div>
			{else}
				<div class="margin-bottom-15">
					<label for="subject">Subject: <span class="red">*</span></label>
					<input id="subject" name="subject" class="form-control required" type="text">
				</div>
			{/if}
		 
			<div class="margin-bottom-15">
				<label for="message-body">Message<span class="red">*</span></label>
				<textarea id="message-body" name="message" rows="3" class="form-control required" placeholder="Message"></textarea>
			</div>
			
			<input id="form_id" type="hidden" value="{$form_id}" name="form_id">
			<input type="submit" value="Send" class="btn btn-primary">
		</form>
	{/if}
	<hr>
	<div class="popupFooter clearfix">
		{if $realtor && $realtor.id && $realtor.pic_url}
			{if $realtor.pic_url}
				<img src="{$realtor.pic_url}/maxwidth/70" data-hd-src="{$realtor.pic_url}/maxwidth/140" class="pull-left margin-right-10 img-hd" alt="">
			{else}
				<img src="/images/person_avatar.gif" class="pull-left margin-right-10" alt="">
			{/if}
			<div class="pull-left">
				<h2>{$realtor.name}</h2>
				<ul class="list-unstyled">
					{if $realtor.parent->name}
						<li><em>{$realtor.parent->name}</em></li>
					{/if}
					{if $realtor.address.Office_Phone.value}
						<li><strong>Office:</strong> {$realtor.address.Office_Phone.value}</li>
					{elseif $realtor.address.Direct_Phone.value}
						<li><strong>Direct:</strong> {$realtor.address.Direct_Phone.value}</li>
					{/if}
					{if $realtor.address.Cell_Phone.value}
						<li><strong>Mobile:</strong> {$realtor.address.Cell_Phone.value}</li>
					{/if}
				</ul>
			</div>
		{else}
			<div class="pull-left">
				<h2>Company Name</h2>
				<ul class="list-unstyled">
					<li><strong>Phone:</strong> 555-555-5555</li>
				</ul>
			</div>
		{/if}
		<img src="/images/popup-logo.jpg" class="pull-right" alt="">
	</div>
</div>
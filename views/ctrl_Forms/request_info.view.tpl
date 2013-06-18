<head>
    <title>Request More Information</title>
</head>
{if $user ne false && $user->get_name()}
	{assign var='contactFullName' value=" "|explode:$user->get_name()}
{else}
	{assign var='contactFullName' value=false}
{/if}

{assign var=formSendAccepted value=false}

<div class="popupBody">
    <h1>Request More Information</h1>
	{if $messages->isMsgs() === true}
		{if $messages->isErrors() === true}
			 <div class="alert alert-error alert-block">
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
	    <form action="/forms/" class="validate-form" method="post">
			{if $property}
				<h4 class="margin-bottom-10">
					{if $property.address_display_bit}
						{$property.fullStreetAddress}<br>
					{elseif $property.city || $property.state}
						{$property.city}, {$property.state}<br>
					{/if}
					{if $property.property_id}MLS# {$property.property_id}{/if}
				</h4>
				{if $property.rental_bit && $property.rental_bit == 1}<input type="hidden" name="is_rental" value="1">{/if}
				<input type="hidden" name="property_id" value="{if $property.company_property_id}{$property.company_property_id}{/if}">
			{/if}	

			<input type="hidden" value="request_info" name="form_type">
	      
	        <div class="row-fluid">
	            <div class="control-group span6">
	                <label>First Name<span class="red">*</span></label>
	                <input type="text" name="first_name" class="span12 required" placeholder="Enter First Name" value="{if $contactFullName && $contactFullName.0}{$contactFullName.0}{/if}">
	            </div>
	            <div class="control-group span6">
	                <label>Last Name<span class="red">*</span></label>
	                <input type="text" name="last_name" class="span12 required" placeholder="Enter Last Name" value="{if $contactFullName && $contactFullName.1}{$contactFullName.1}{/if}">
	            </div>
	        </div>
	        <div class="row-fluid">
	            <div class="control-group span6">
	                <label>Email<span class="red">*</span></label>
	                <input type="text" name="email_confirm" class="span12 required email" placeholder="Enter Email Address" value="{if $user ne false}{$user->email}{/if}">
	                <input type="text" name="email" style="display: none;" value="">
	            </div>
	            <div class="control-group span6">
	                <label>Phone</label>
	                <input type="text" name="phone" class="span12" placeholder="Enter Phone Number" value="">
	            </div>
	        </div>
	        <div class="row-fluid">
	           <div class="control-group span12">
	                <label>Message<span class="red">*</span></label>
	                <textarea rows="5" cols="25" name="message" class="span12" placeholder="Enter Message"></textarea>
	            </div>
	        </div>
	        <input type="submit" class="btn margin-top-10" value="Send">
    	</form>
    {/if}
	<div class="row-fluid popupFooter">
		<div class="span10">
			{if $realtor && $realtor.id && $realtor.pic_url}
				{if $realtor.pic_url}
					<img class="pull-left margin-right-10" src="{$realtor.pic_url}/maxwidth/70" alt="">
				{else}
					<img class="pull-left margin-right-10" src="/images/person_avatar.gif" width="70" alt="">
				{/if}
				<div class="pull-left">
					<h2>{$realtor.name}</h2>
					{if $realtor.parent->name}
						<span class="block">{$realtor.parent->name} Office</span>
					{/if}
                    {if $realtor.address.Office_Phone.value}
						<span class="block"><span class="popupPhone">Office</span> <strong>{$realtor.address.Office_Phone.value}</strong></span>
					{elseif $realtor.address.Direct_Phone.value}
						<span class="block"><span class="popupPhone">Direct</span> <strong>{$realtor.address.Direct_Phone.value}</strong></span>
                    {/if}
					{if $realtor.address.Cell_Phone.value}
						<span class="block"><span class="popupPhone">Mobile</span> <strong>{$realtor.address.Cell_Phone.value}</strong></span>
					{/if}
				</div>
			{else}
				<h2>Company Name</h2>
				<span class="block">Phone numbers</span>
			{/if}
		</div>
		<div class="span2">
			{* you can add in image to the bottom right here *}
			{* <img src="/images/some_logo_here" alt="" class="pull-right popupFooterLogo"> *}
		</div>
	</div>
</div>
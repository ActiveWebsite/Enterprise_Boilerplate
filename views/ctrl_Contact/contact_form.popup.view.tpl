{if $current_account_user && $current_account_user.name}
	{assign var='contactFullName' value=" "|explode:$current_account_user.name}
{else}
	{assign var='contactFullName' value=false}
{/if}
{assign var=formSendAccepted value=false}
<div class="popupBody">
	{if $return_info.lifestyleSearch == "true"}
		<h1>Lifestyle Search Feedback</h1>
	{else}
		<h1>Contact {if isset($smarty.request.send_to_name) && !empty($smarty.request.send_to_name)}{$smarty.request.send_to_name}{elseif $contactee_name}{$contactee_name}{else}{$contactee_pronouns.objective|capitalize}{/if}</h1>
	{/if}
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
		<form action="/forms/" class="validate-form" novalidate="novalidate" id="contact_form" method="post" {if $browser_info.browser == 'CHROME'}autocomplete="off"{/if}>
			<input type="hidden" name="form_type" value="contact">
			{if $realtor}
				<input type="hidden" name="entity_id" value="{$realtor.id}">
				<input type="hidden" name="entity_type" value="{$realtor.entity_type}">
				<input type="hidden" name="lead_realtor" value="{$realtor.id}">
			{/if}
			{if $contactee_type == "Office"}
				<input type="hidden" name="cc_email" value="{$contactee_email}">
				<input type="hidden" name="subject" value="Contact {$contactee_name} office">
			{/if}
			{if isset($smarty.get.lcn) && !empty($smarty.get.lcn)}
				<input type="hidden" name="lc_custom_form_name" value="{$smarty.get.lcn}">
			{elseif $realtor.entity_type == 'realtor'}
				<input type="hidden" name="lc_custom_form_name" value="Contact Me">
			{else}
				<input type="hidden" value="Contact Us" name="lc_custom_form_name">
			{/if}
			<fieldset>
		        <div class="row-fluid">
		            <div class="span6">
						<label for="contact_form_firstname">First Name <span class="red">*</span></label>
						<input type="text" id="contact_form_firstname" name="first_name" placeholder="Enter First Name" value="{if $contactFullName && $contactFullName.0}{$contactFullName.0}{/if}" class="required span12">
					</div>
		            <div class="span6">
						<label for="contact_form_lastname">Last Name <span class="red">*</span></label>
						<input type="text" id="contact_form_lastname" name="last_name" placeholder="Enter Last Name" value="{if $contactFullName && $contactFullName.1}{$contactFullName.1}{/if}" class="required span12">
					</div>
				</div>
		        <div class="row-fluid">
		            <div class="span6">
						<label for="contact_form_email">Email<span class="red">*</span></label>
						<input type="email" name="email_confirm" id="contact_form_email" placeholder="Enter Email Address" class="required email span12" value="{if $contactor ne false}{$contactor->email}{/if}">
						<input type="text" style="display:none;" value="" name="email">
					</div>
		            <div class="span6">
						<label for="contact_form_phone">Phone</label>
						<input name="phone" value="" type="text" placeholder="Enter Phone" class="span12" id="contact_form_phone">
					</div>
				</div>
		        <div class="row-fluid">
		            <div class="span12">
						<label for="contact_form_message">Message<span class="red">*</span></label>
						<textarea name="message" rows="3" placeholder="Message" class="required span12" id="contact_form_message"></textarea>
					</div>
				</div>
		        <div class="row-fluid">
		            <div class="span12">
						{if $smarty.request.return}
							<input name="returnToRef" value="{$smarty.request.return}" type="hidden">
						{else}
							<input name="returnToRef" value="/popup{$ACTION_URLS.contact}" type="hidden">
						{/if}
						{if isset($smarty.request.send_to) && !empty($smarty.request.send_to)}
							<input name="send_to" value="{$smarty.request.send_to}" type="hidden">
						{/if}				
						<input type="submit" title="Send" value="Send" class="btn btn-primary upper pull-left margin-top-10">
					</div>
				</div>
			</fieldset>
		</form>
		{if $return_info.lifestyleSearch == "true"}
			{* Lifestyle search feedback footer disabled *}
		{else}
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
		{/if}
	{/if}
</div>
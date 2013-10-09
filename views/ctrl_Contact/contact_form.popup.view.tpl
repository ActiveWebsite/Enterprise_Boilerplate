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
		<form action="/forms/" class="validate-form" method="post" autocomplete="off">
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
		        <div class="row">
		            <div class="col-sm-6 margin-bottom-15">
						<label for="contact_form_firstname">First Name <span class="red">*</span></label>
						<input type="text" id="contact_form_firstname" name="first_name" placeholder="Enter First Name" value="{if $contactFullName && $contactFullName.0}{$contactFullName.0}{/if}" class="form-control required">
					</div>
		            <div class="col-sm-6 margin-bottom-15">
						<label for="contact_form_lastname">Last Name <span class="red">*</span></label>
						<input type="text" id="contact_form_lastname" name="last_name" placeholder="Enter Last Name" value="{if $contactFullName && $contactFullName.1}{$contactFullName.1}{/if}" class="form-control required">
					</div>
				</div>
		        <div class="row">
		            <div class="col-sm-6 margin-bottom-15">
						<label for="contact_form_email">Email<span class="red">*</span></label>
						<input type="email" name="email_confirm" id="contact_form_email" placeholder="Enter Email Address" class="form-control required email" value="{if $contactor ne false}{$contactor->email}{/if}">
						<input type="text" style="display:none;" value="" name="email">
					</div>
		            <div class="col-sm-6 margin-bottom-15">
						<label for="contact_form_phone">Phone</label>
						<input name="phone" value="" class="form-control" type="text" placeholder="Enter Phone" id="contact_form_phone">
					</div>
				</div>
		        <div class="margin-bottom-15">
					<label for="contact_form_message">Message<span class="red">*</span></label>
					<textarea name="message" rows="3" cols="25" placeholder="Message" class="form-control required" id="contact_form_message"></textarea>
				</div>
				{if $smarty.request.return}
					<input name="returnToRef" value="{$smarty.request.return}" type="hidden">
				{else}
					<input name="returnToRef" value="/popup{$ACTION_URLS.contact}" type="hidden">
				{/if}
				{if isset($smarty.request.send_to) && !empty($smarty.request.send_to)}
					<input name="send_to" value="{$smarty.request.send_to}" type="hidden">
				{/if}				
				<input type="submit" title="Send" value="Send" class="btn btn-primary">
			</fieldset>
		</form>
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
	{/if}
</div>
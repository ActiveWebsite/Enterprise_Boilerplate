<head>
	<script src="/js/libs/jquery_ui/components/core.1.10.3.min.js"></script>
	<script src="/js/libs/jquery_ui/components/datepicker.1.10.3.min.js"></script>
	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css">
	{literal}
	<script>
		jQuery(document).ready(function($){
			$('.Calendar').datepicker();
		});
	</script>
	{/literal}    
</head>
{if $user ne false && $user->get_name()}
	{assign var='contactFullName' value=" "|explode:$user->get_name()}
{else}
	{assign var='contactFullName' value=false}
{/if}

{assign var=formSendAccepted value=false}
<div class="popupBody">
	<h1>Request A Showing</h1>
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
			{/if}	
			
			{if $smarty.request.prop}
				<input type="hidden" name="property_id" value="{$smarty.request.prop}">
			{elseif $property && $property instanceOf Property}
				<input type="hidden" name="property_id" value="{$property->company_property_id}">
			{/if}

			{if isset($smarty.get.lcn) && !empty($smarty.get.lcn)}
				<input type="hidden" name="lc_custom_form_name" value="{$smarty.get.lcn}">
			{else}
				<input type="hidden" value="Schedule Showing" name="lc_custom_form_name">
			{/if}

			<input type="hidden" value="schedule_showings" name="form_type">

			<div class="row">
				<div class="col-sm-6 margin-bottom-15">
					<label>First Name<span class="red">*</span></label>
					<input type="text" name="first_name" class="form-control required" placeholder="Enter First Name" value="{if $contactFullName && $contactFullName.0}{$contactFullName.0}{/if}">
				</div>
				<div class="col-sm-6 margin-bottom-15">
					<label>Last Name<span class="red">*</span></label>
					<input type="text" name="last_name" class="form-control required" placeholder="Enter Last Name" value="{if $contactFullName && $contactFullName.1}{$contactFullName.1}{/if}">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 margin-bottom-15">
					<label>Email<span class="red">*</span></label>
					<input type="email" name="email_confirm" class="form-control required email" placeholder="Enter Email Addresss" value="{if $user ne false}{$user->email}{/if}">
					<input type="text" name="email" style="display: none;" value="">
				</div>
				<div class="col-sm-6 margin-bottom-15">
					<label>Phone<span class="red">*</span></label>
					<input type="text" name="phone" class="form-control required" placeholder="Enter Phone Number" value="">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 margin-bottom-15">
					<label>Date</label>
					<input id="date" class="form-control Calendar required" type="text" name="date" placeholder="Choose Date" value="">
				</div>
				<div class="col-sm-6 margin-bottom-15">
					<label>Time</label>
					<select class="form-control" name="time">
						<option value="any">Any</option>
						<option value="morning">Morning</option>
						<option value="lunch">Lunch</option>
						<option value="afternoon">Afternoon</option>
						<option value="evening">Evening</option>
					</select>
				</div>
			</div>
			<div class="margin-bottom-15">
				<label>Message<span class="red">*</span></label>
				<textarea class="form-control" name="message" cols="15" rows="3" placeholder="Enter Message"></textarea>
			</div>
			<input type="submit" class="btn btn-primary" value="Send">
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
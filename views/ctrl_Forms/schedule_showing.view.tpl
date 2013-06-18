<head>
    <script src="/js/jqueryui/components/datepicker.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/themes/base/jquery-ui.css">
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
	                <input type="text" name="email_confirm" class="span12 required email" placeholder="Enter Email Addresss" value="{if $user ne false}{$user->email}{/if}">
	                <input type="text" name="email" style="display: none;" value="">
	            </div>
	            <div class="control-group span6">
	                <label>Phone<span class="red">*</span></label>
	                <input type="text" name="phone" class="span12 required" placeholder="Enter Phone Number" value="">
	            </div>
	        </div>
	        <div class="row-fluid">
	            <div class="control-group span6">
	                <label>Date</label>
	                <input id="date" class="Calendar required span12" type="text" name="date" value="">
	            </div>
	            <div class="control-group span6">
	                <label>Time</label>
	                <select class="valid span12" name="time">
	                    <option value="any">Any</option>
	                    <option value="morning">Morning</option>
	                    <option value="lunch">Lunch</option>
	                    <option value="afternoon">Afternoon</option>
	                    <option value="evening">Evening</option>
	                </select>
	            </div>
	        </div>
	        <div class="row-fluid">
	            <div class="control-group span12">
	                <label>Message<span class="red">*</span></label>
	                <textarea name="message" cols="15" rows="3" class="span12" placeholder="Enter Message"></textarea>
	            </div>
	        </div>
	        <input type="submit" class="btn" value="Send">
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
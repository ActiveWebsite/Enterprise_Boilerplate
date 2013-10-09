<div class="popupBody">
	<h1>You will send the following properties:</h1>
	{if $tour_properties}
        <ol>
        	{foreach from=$tour_properties item=property key=index}
        		<li class="margin-bottom-5">{$property.fullStreetAddress}</li>
        	{/foreach}
    	</ol>
    {/if}
	<form id="submitForm" class="validate-form" action="{$ACTION_URLS.local_root}/send_email_tour" method="post">
        <div class="row">
            <div class="col-sm-6 margin-bottom-10">
                <label>To Name:<span class="red">*</span></label>
                <input type="text" class="form-control required" placeholder="Enter To Name" name="toName">
            </div>
            <div class="col-sm-6 margin-bottom-10">
                <label class="control-label">To Email:<span class="red">*</span></label>
				<input type="text" class="form-control required email" placeholder="Enter To Email" name="toEmail">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2 margin-bottom-10">
                <label>From Name:<span class="red">*</span></label>
				<input type="text" class="form-control required" placeholder="Enter From Name" name="fromName" value="">
            </div>
            <div class="col-sm-2 margin-bottom-10">
                <label>From Email:<span class="red">*</span></label>
				<input type="text" class="form-control required email" placeholder="Enter From Email" name="fromEmail" value="">
            </div>
        </div>
        <div class="margin-bottom-10">
            <label>Message<span class="red">*</span></label>
            <textarea name="message" class="form-control" rows="6" cols="25" placeholder="Enter Message"></textarea>
        </div>
        <input type="submit" class="btn btn-primary margin-top-10" value="Send">
	</form>
</div>
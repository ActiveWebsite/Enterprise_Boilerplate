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
        <div class="row-fluid">
            <div class="control-group span6">
                <label class="control-label">To Name:<span class="red">*</span></label>
                <input type="text" class="span12 required" placeholder="Enter To Name" name="toName">
            </div>
            <div class="control-group span6">
                <label class="control-label">To Email:<span class="red">*</span></label>
				<input type="text" class="span12 required email" placeholder="Enter To Email" name="toEmail">
            </div>
        </div>
        <div class="row-fluid">
            <div class="control-group span2">
                <label class="control-label">From Name:<span class="red">*</span></label>
				<input type="text" class="span12 required" placeholder="Enter From Name" name="fromName" value="">
            </div>
            <div class="control-group span2">
                <label class="control-label">From Email:<span class="red">*</span></label>
				<input type="text" class="span12 required email" placeholder="Enter From Email" name="fromEmail" value="">
            </div>
        </div>
        <div class="row-fluid">
            <div class="control-group span12">
                <label class="control-label">Message<span class="red">*</span></label>
                <textarea name="message" rows="6" cols="25" class="span12" placeholder="Enter Message"></textarea>
                <input type="submit" class="btn margin-top-10" value="Send">
            </div>
        </div>
	</form>
</div>
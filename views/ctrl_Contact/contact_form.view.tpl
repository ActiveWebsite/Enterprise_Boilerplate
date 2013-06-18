<div id="contact-page">
	<h1 class="page-heading">Contact {if $contactee_type == 'realtor'}Me{else}Us{/if}</h1>
	<p>Fill out the form below and {if $contactee_type == 'realtor'}I{else}we{/if} will get back to you quickly.</p>
	<form action="/forms/" class="validate-form">
		<div class="row-fluid">
			<div class="span6">
				<label class="bold" for="input01">First Name <span class="red">*</span></label>
				<input class="span12 required" id="input01" type="text" name="first_name" placeholder="Enter First Name">
			</div>
			<div class="span6">
				<label class="bold" for="input02">Last Name <span class="red">*</span></label>
				<input class="span12 required" id="input02" type="text" name="last_name" placeholder="Enter Last Name">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="bold" for="input03">Phone</label>
				<input class="span12" type="text" id="input03" name="phone" placeholder="Enter Phone">
			</div>
			<div class="span6">
				<label class="bold" for="input04">Cell Phone</label>
				<input class="span12" type="text" id="input04" name="cell_phone" placeholder="Enter Cell Phone">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="bold" for="input05">Email Address <span class="red">*</span></label>
				<input class="span12 required email" id="input05" type="text" name="email_confirm" placeholder="Enter Email Address">
				<input type="text" value="" name="email" style="display: none;">
			</div>
			<div class="span6">
				<label class="bold" for="input06">Confirm Email Address <span class="red">*</span></label>
				<input class="span12 required email" id="input06" data-rule-equalTo="#input05" data-msg-equalTo="Email addresses do not match." type="text" name="email_verify" placeholder="Confirm Email Address">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<label class="bold" for="input07">Message<span class="red">*</span></label>
				<textarea name="message" rows="8" cols="25" class="span12 required" id="input07" placeholder="Enter Enter Message"></textarea>
			</div>
		</div>
		<input type="submit" class="btn" value="Send" title="Send">
	</form>
</div>
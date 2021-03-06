<div id="contact-page">
	<div class="page-header">
		<h1>Contact {if $contactee_type == 'realtor'}Me{else}Us{/if}</h1>
	</div>
	<p>Fill out the form below and {if $contactee_type == 'realtor'}I{else}we{/if} will get back to you quickly.</p>
	<form action="/forms/" class="validate-form">
		<div class="row">
			<div class="col-sm-6 margin-bottom-15">
				<label class="bold" for="input01">First Name <span class="red">*</span></label>
				<input class="form-control required" id="input01" type="text" name="first_name" placeholder="Enter First Name">
			</div>
			<div class="col-sm-6 margin-bottom-15">
				<label class="bold" for="input02">Last Name <span class="red">*</span></label>
				<input class="form-control required" id="input02" type="text" name="last_name" placeholder="Enter Last Name">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 margin-bottom-15">
				<label class="bold" for="input03">Phone</label>
				<input type="text" class="form-control" id="input03" name="phone" placeholder="Enter Phone" value="">
			</div>
			<div class="col-sm-6 margin-bottom-15">
				<label class="bold" for="input04">Cell Phone</label>
				<input type="text" class="form-control" id="input04" name="cell_phone" placeholder="Enter Cell Phone" value="">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 margin-bottom-15">
				<label class="bold" for="input05">Email Address <span class="red">*</span></label>
				<input class="form-control required email" id="input05" type="text" name="email_confirm" placeholder="Enter Email Address" value="">
				<input type="text" value="" name="email" style="display: none;">
			</div>
			<div class="col-sm-6 margin-bottom-15">
				<label class="bold" for="input06">Confirm Email Address <span class="red">*</span></label>
				<input class="form-control required email" id="input06" data-rule-equalTo="#input05" data-msg-equalTo="Email addresses do not match." type="text" name="email_verify" placeholder="Confirm Email Address" value="">
			</div>
		</div>
		<div class="margin-bottom-15">
			<label class="bold" for="input07">Message<span class="red">*</span></label>
			<textarea class="form-control" name="message" rows="8" cols="25" class="required" id="input07" placeholder="Enter Enter Message"></textarea>
		</div>
		<input type="submit" class="btn btn-primary" name="Submit" value="Send">
	</form>
</div>
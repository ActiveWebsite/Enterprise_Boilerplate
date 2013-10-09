<head>
	<link rel="stylesheet" href="/css/components/jquery_mortgage_calc_v3_charts_only.css">
</head>
<div class="mortgageCalculatorWidget">
	<form class="mc-form" method="post" action="/property/">
		<fieldset class="row">
			<div class="col-sm-6">
				<div class="row">
					<label class="col-sm-4 bold">List Price</label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="list_price" value="{$list_price}">
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Interest Rate</label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<input type="text" class="form-control mc-text-field mc-format-percent" name="interest_rate" value="{$interest_rate}">
						<span class="input-group-addon">%</span>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Term</label>
					<div class="col-sm-8 margin-bottom-15">
						<select class="form-control mc-select-field" name="loan_term">
							<option value="10"{if $loan_length == 10} selected="selected"{/if}>10 years</option>
							<option value="15"{if $loan_length == 15} selected="selected"{/if}>15 years</option>
							<option value="20"{if $loan_length == 20} selected="selected"{/if}>20 years</option>
							<option value="25"{if $loan_length == 25} selected="selected"{/if}>25 years</option>
							<option value="30"{if $loan_length == 30} selected="selected"{/if}>30 years</option>
							<option value="35"{if $loan_length == 35} selected="selected"{/if}>35 years</option>
							<option value="40"{if $loan_length == 40} selected="selected"{/if}>40 years</option>
						</select>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Down Payment</label>
					<div class="col-sm-8">
						<div class="row">
							<div class="col-sm-6 input-group margin-bottom-15">
								<span class="input-group-addon">$</span>
								<input type="text" class="form-control mc-text-field mc-format-currency" name="down_payment" value="0">
							</div>
							<div class="col-sm-6 margin-bottom-15">
								<select class="form-control mc-select-field mc-select-field-tiny" name="down_payment_percentage">
									<option value="0"{if $down_payment_percentage == 0} selected="selected"{/if}>-</option>
									<option value="5"{if $down_payment_percentage == 5} selected="selected"{/if}>5 %</option>
									<option value="10"{if $down_payment_percentage == 10} selected="selected"{/if}>10 %</option>
									<option value="15"{if $down_payment_percentage == 15} selected="selected"{/if}>15 %</option>
									<option value="20"{if $down_payment_percentage == 20} selected="selected"{/if}>20 %</option>
									<option value="25"{if $down_payment_percentage == 25} selected="selected"{/if}>25 %</option>
									<option value="30"{if $down_payment_percentage == 30} selected="selected"{/if}>30 %</option>
									<option value="35"{if $down_payment_percentage == 35} selected="selected"{/if}>35 %</option>
									<option value="40"{if $down_payment_percentage == 40} selected="selected"{/if}>40 %</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Closing Costs</label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="closing_cost" value="{$closing_cost}">
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="row">
					<label class="col-sm-4 bold">Taxes</label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="taxes" value="{$taxes}">
						<span class="input-group-addon">/ yr</span>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Insurance</label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="insurance" value="{$insurance}"> 
						<span class="input-group-addon">/ yr</span>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">PMI<sup>**</sup></label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="pmi" value="0">
						<span class="input-group-addon">/ mo</span>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Assessments<sup>***</sup></label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="additional_fees" value="{$assessments}">
						<span class="input-group-addon">/ mo</span>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-4 bold">Extra Payment</label>
					<div class="col-sm-8 input-group margin-bottom-15">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control mc-text-field mc-format-currency" name="extra_principal" value="0">
						<span class="input-group-addon">/ mo</span>
					</div>
				</div>
			</div>
		</fieldset>
		<div class="clearfix margin-top-10">
			<button class="mc-calculate btn btn-primary pull-right">Calculate</button>
		</div>
	</form>
	<div class="tabClass mc-tabs clearfix">
		<ul class="nav nav-tabs mc-tab-triggers">
			<li class="active"><a href="#mc-payments-tab"><span>Payments</span></a></li>
			<li><a href="#mc-amortization-tab"><span>Amortization Schedule</span></a></li>
		</ul>
		<div class="tab-content mc-tabs-body">
			<div class="tab-pane mc-tab-item active">
				<p class="mc-how-to-use">
					With this calculator you can put in your values and estimate the amount of your loan and get an estimate on the amount of your monthly payments. Click on the 'Calculate' button when you're ready.
				</p>
				<div class="mc-payments" style="display:none;">
					<div class="mc-payments-table"></div>
					<div class="mc-payments-chart-container"></div>
				</div>
			</div>
			<div class="tab-pane mc-tab-item">
				<p class="mc-how-to-use">
					With this calculator you can put in your values and estimate the amount of your loan and get an estimate on the amount of your monthly payments. Click on the 'Calculate' button when you're ready.
				</p>
				<div class="mc-amortization" style="display:none;">
					<div class="mc-amortization-table"></div>
					<div class="mc-amotorization-chart-container"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="mc-messages margin-top-15" style="display:none;"></div>
	<div class="mc-disclaimers margin-top-15">
		<p class="text-muted"><sup>**</sup>Private mortgage insurance is an insurance policy that a residential mortgage lender requires of the borrower if the loan-to-value (LTV) ratio of the home is greater than 80%. Mortgage insurance protects the lender from the risk that the borrower may default on the loan. Federal law requires lenders to notify borrowers when the loan-to-value ratio drops below 80%. Mortgage insurance premiums vary, but generally range from $1,000 to $5,000 a year for an average priced home.</p>
		<p class="text-muted"><sup>***</sup>Assessments are monthly fees such as Home Owners Association(HOA) Fees etc...</p>
		<p class="text-muted">Results received from this calculator are designed for comparative purposes only, and accuracy is not guaranteed.</p>
	</div>
</div>
<footerargs>
	<script src="/js/buildlist.js?scripts=/js/calculators/jquery.mortgage_calc_v3.min.js,/js/jqueryui/jquery.tableScroller.min.js"></script>
	{literal}
	<script>
		jQuery(document).ready(function($) {
			$('.mortgageCalculatorWidget').mortgageCalculator({
				pmi_rate: {/literal}{$pmi_rate}{literal},
				tax_rate: {/literal}{$tax_rate}{literal},
				bootstrapMode: true,
				setAmortizationWidth: true,
				messageClass: 'muted'
			});
		});
	</script>
	{/literal}
</footerargs>
<form method="post" action="/" id="payment-calc-instance" class="booj-payment-calculator-with-pmt-breakdown">

	<div class="row">
        <div class="col-sm-3 margin-bottom-15">
	        <label>List Price</label>
            <input type="tel" class="validate form-control" value="{$property.list_price}" name="present_value" data-prefix="$" />
        </div>
        <div class="col-sm-3 margin-bottom-15">
	        <label>Interest Rate</label>
            <input type="tel" class="validate form-control" value="{$apr|default:4.5}%" name="apr" data-suffix="%">
        </div>
		<div class="col-sm-3 margin-bottom-15">
			<label>Down Payment</label>
			<div class="down-payment-block">
				<input type="tel" class="validate form-control" value="" name="down_payment" data-prefix="$">
				<input type="tel" class="down-payment-percentage form-control" value="{$down_payment_percentage|default:20}" name="down_payment_percentage" data-suffix="%">
			</div>
		</div>
        <div class="col-sm-3">
            <label>Payment Term</label>
            <select class="validate form-control" name="number_periods">
                <option value="10">10 Years</option>
                <option value="15">15 Years</option>
                <option value="20">20 Years</option>
                <option value="25">25 Years</option>
                <option value="30" selected="selected">30 Years</option>
                <option value="35">35 Years</option>
                <option value="40">40 Years</option>
            </select>
        </div>
    </div>

    <div class="row advanced-options margin-bottom-30">
        <div class="col-sm-3">
            <label>Property Taxes</label>
            <input type="tel" class="validate form-control" value="{$tax_amount}" name="taxes" data-prefix="$" data-suffix="/yr">
        </div>
        <div class="col-sm-3">
            <label>Insurance</label>
            <input type="tel" class="validate form-control" value="" name="insurance" data-prefix="$" data-suffix="/yr">
        </div>
        <div class="col-sm-3">
            <label>PMI</label>
            <input type="tel" class="validate form-control" value="" name="pmi" data-prefix="$" data-suffix="/mo">
        </div>
        <div class="col-sm-3">
            <label>Extra Payment</label>
            <input type="tel" class="validate form-control" value="" name="extra" data-prefix="$" data-suffix="/mo">
        </div>
    </div>
    <div class="text-center">
        <button type="button" class="btn btn-link bpc-advanced">Advanced <i class="icon icon-chevron-down"></i></button>
    </div>

    <div class="row">
		<div class="col-sm-4">
			<div class="bpc-chart"></div>
		</div>
		<div class="col-sm-8 bpc-results"></div>
	</div>
</form>
<footerargs>
	<script src="/js/calculators/jquery.payment_calculator_with_pmt_breakdown.js"></script>
	{literal}
	<script>
		jQuery(document).ready(function($) {
			$('#payment-calc-instance').paymentCalculator();
		});
	</script>
	{/literal}
</footerargs>

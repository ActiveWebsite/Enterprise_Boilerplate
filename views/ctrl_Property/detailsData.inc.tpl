<h3>General</h3>
<div class="row">
	<div class="col-sm-6 col-lg-6">
		<table class="property-data-table">
			<tbody>
				{if $list_price}
					<tr>
						<td class="label-cell">List Price</td>
						<td>{$list_price}</td>
					</tr>
				{/if}
				<tr>
					<td class="label-cell">MLS#</td>
					<td>{$property_id}</td>
				</tr>
				{if $sqft_total_combined && $sqft_total_combined > 0}
					<tr>
						<td class="label-cell">SqFt</td>
						<td>{$sqft_total_combined|number_format}</td>
					</tr>
				{/if}
			</tbody>
		</table>
	</div>
	<div class="col-sm-6 col-lg-6">
		<table class="property-data-table">
			<tbody>
				{if $bedrooms_total && $bedrooms_total > 0}
					<tr>
						<td class="label-cell">Beds</td>
						<td>{$bedrooms_total|clean_bed_bath}</td>
					</tr>
				{/if}
				{if $bathrooms_total && $bathrooms_total > 0}
					<tr>
						<td class="label-cell">Baths</td>
						<td>{$bathrooms_total|clean_bed_bath}</td>
					</tr>
				{/if}
			</tbody>
		</table>
	</div>
</div>
<hr>
<h3>Exterior</h3>
<div class="row">
	<div class="col-sm-6 col-lg-6">
		<table class="property-data-table">
			<tbody>
				<tr>
					<td class="label-cell">Acres</td>
					<td>5</td>
				</tr>
				<tr>
					<td class="label-cell">Pool</td>
					<td>Yes</td>
				</tr>
				<tr>
					<td class="label-cell">Construction Type</td>
					<td>Brick</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-sm-6 col-lg-6">
		<table class="property-data-table">
			<tbody>
				<tr>
					<td class="label-cell">Tennis Courts</td>
					<td>5</td>
				</tr>
				<tr>
					<td class="label-cell">Horse Property</td>
					<td>Yes</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<hr>
<h3>Amenities</h3>
<ul class="list-inline">
	<li>Club House</li>
	<li>Golf Course</li>
	<li>Rec Center</li>
	<li>Snow Removal</li>
</ul>

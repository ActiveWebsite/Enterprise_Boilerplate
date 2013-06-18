{foreach from=$property_groups item=prop_group name=prop_loop key=index}
	<table class="compare-print-group">
		<tbody>
			<tr>
				<td class="labelCol">&nbsp;</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{if $property.photos[0]}
							<img alt="photo" src="{$property.photos[0]}/crop/222,166">
						{/if}
					</td>
				{/foreach}
			</tr>
			<tr>
				<td class="labelCol">Address</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{$property.streetAddress}<br />
						{if $property.city}{$property.city}{/if}{if $property.state}, {$property.state}{/if} {$property.zip_code}
					</td>								
				{/foreach}
			</tr>
			<tr>
				<td class="labelCol">Price</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{if $property.list_price}
							{$property.list_price}
						{else}
							N/A
						{/if}
					</td>
				{/foreach}
			</tr>
			<tr>
				<td class="labelCol">MLS#</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{$property.property_id}
					</td>								
				{/foreach}
			</tr>
			<tr>
				<td class="labelCol">Bedrooms</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{if $property.bedrooms_total && $property.bedrooms_total > 0}
							{$property.bedrooms_total|clean_bed_bath}
						{else}
							N/A
						{/if}
					</td>								
				{/foreach}
			</tr>
			<tr>
				<td class="labelCol">Bathrooms</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{if ($property.bathrooms_total && $property.bathrooms_total > 0)}
							{$property.bathrooms_total|clean_bed_bath}
						{else}
							N/A
						{/if}
					</td>								
				{/foreach}
			</tr>
			<tr>
				<td class="labelCol">Square Feet</td>
				{foreach from=$prop_group item=property key=index}
					<td>
						{if $property.sqft_total_combined}
							{$property.sqft_total_combined|number_format:0}
						{else}
							N/A
						{/if}
					</td>
				{/foreach}
			</tr>
		</tbody>
	</table>
{/foreach}
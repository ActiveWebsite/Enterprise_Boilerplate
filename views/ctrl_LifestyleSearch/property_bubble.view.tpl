<div class="lss-property-bubble">
	{if $prop.first_pic instanceof PropertyPicture}
		<a href="/property/{$prop.company_property_id}/{$prop.fullStreetAddress|clean_for_url}/" title="{$prop.fullStreetAddress|clean_for_attribute}">
			<img src="{$prop.first_pic->getURL()}/crop/70,70" width="70" height="70" alt="{$prop.fullStreetAddress|clean_for_attribute}"></a>
	{/if}
	<p>
		<a class="block" href="/property/{$prop.company_property_id}/{$prop.fullStreetAddressclean_for_url}/" title="{$prop.fullStreetAddress|clean_for_attribute}">
			{$prop.streetAddress}
		</a>
		<span class="block">{$prop.city|lower|capitalize}, {$prop.state|upper}</span>
		{if $prop.list_price == '$0' && $prop.rent_rate && $prop.rent_rate > 0}
			${$prop.rent_rate|number_format}
		{elseif $prop.list_price}
			{$prop.list_price}
		{/if}
		<span class="block">
			{if $prop.bedrooms_total > 0}{$prop.bedrooms_total} Bed{/if}
			{if $prop.bedrooms_total > 0 && $prop.bathrooms_total > 0} | {/if}
			{if $prop.bathrooms_total > 0}{$prop.bathrooms_total|clean_bed_bath} Bath{/if}
		</span>
	</p>						
</div>
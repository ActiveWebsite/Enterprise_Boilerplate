<div class="lss-property-bubble">
	{if $prop.first_pic instanceof PropertyPicture}
		<a target="_blank" href="/property/{$prop.company_property_id}/{$prop.fullStreetAddress|lower|capitalize|replace:' ':'-'|replace:',':''}/" title="{$prop.fullStreetAddress|lower|capitalize}">
			<img src="{$prop.first_pic->getURL()}/crop/70,70" width="70" height="70" alt="{$prop.fullStreetAddress|lower|capitalize}" /></a>
	{/if}
	<p>
		<a target="_blank" class="block" href="/property/{$prop.company_property_id}/{$prop.fullStreetAddress|lower|capitalize|replace:' ':'-'|replace:',':''}/" title="{$prop.fullStreetAddress|lower|capitalize}">
			{$prop.streetAddress}
		</a>
		<span class="block">{$prop.city|lower|capitalize}, {$prop.state|upper}</span>
		{$prop.list_price}
		<span class="block">
			{if $prop.bedrooms_total > 0}{$prop.bedrooms_total} Bed{/if}
			{if $prop.bedrooms_total > 0 && $prop.bathrooms_total > 0} | {/if}
			{if $prop.bathrooms_total > 0}{$prop.bathrooms_total|replace:'.00':''|replace:'.10':'.1'|replace:'.20':'.2'|replace:'.30':'.3'|replace:'.40':'.3'|replace:'.50':'.5'|replace:'.60':'.5'|replace:'.60':'.5'|replace:'.70':'.7'|replace:'.80':'.8'|replace:'.90':'.9'|replace:'.0':''} Bath{/if}
		</span>
	</p>						
</div>
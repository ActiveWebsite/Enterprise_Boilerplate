<div id="realtor-bio-page">
	<div class="page-header">
		<h1>{$realtor.name}</h1>
	</div>
	
	<img src="{if $realtor.pic_url}{$realtor.pic_url}maxwidth/275{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$realtor.name|clean_for_attribute}">

	<hr>
	<ul class="list-unstyled">
		{if $realtor.address.Direct_Phone.value}
			<li class="margin-bottom-5"><strong>Direct</strong> {$realtor.address.Direct_Phone.value}</li>
		{/if}
		{if $realtor.parent_dict.address.Office_Phone.value}
			<li class="margin-bottom-5"><strong>Office</strong> {$realtor.parent_dict.address.Office_Phone.value}</li>
		{/if}
		{if $realtor.parent_dict.address.Direct_Phone.value}
			<li class="margin-bottom-5"><strong>Toll-Free</strong> {$realtor.parent_dict.address.Direct_Phone.value}</li>
		{/if}
		{if $realtor.parent_dict.address.Fax_Phone.value}
			<li class="margin-bottom-5"><strong>Fax</strong> {$realtor.parent_dict.address.Fax_Phone.value}</li>
		{/if}
	</ul>

	{if $realtor.parent_dict}
		<hr>
		<h2>{$realtor.parent_dict.name}</h2>
		<address>
			{$realtor.parent_dict.address.Street_Address.value}<br>
			{$realtor.parent_dict.address.City.value}, {$realtor.parent_dict.address.State.value} {$realtor.parent_dict.address.Zip.value}
		</address>
	{/if}

	<hr>
	<h2>About {$realtor.name}</h2>
	<div class="cms-page">
		{$realtor.biography}
	</div>

	{if $realtor.realtor_info.Designations}
		<hr>
		<h2>Designations</h2>
		<ul class="list-unstyled">
			<li>{$realtor.realtor_info.Designations|replace:',':'</li><li>'}</li>
		</ul>
	{/if}

	{if $realtor.realtor_info.Spoken_Languages}
		<hr>
		<h2>Languages</h2>
		<ul class="list-unstyled">
			<li>{$realtor.realtor_info.Spoken_Languages|replace:',':'</li><li>'}</li>
		</ul>
	{/if}

	{if $testimonials}
		<hr>
		<h2>Testimonials</h2>
		{foreach from=$testimonials item=testimonial key=index name=testimonialsLoop}
			<div class="agent-testimonial">
				<p>{$testimonial.comment}</p>
				<p class="bold text-right">
					<em>&dash; {$testimonial.name}</em>
					{if $testimonial.date !== '1969-12-31'}
						{$testimonial.date|date_format:"%B %d, %Y"}
					{/if}
				</p>
			</div>
			{if !$smarty.foreach.testimonialsLoop.last}<hr>{/if}
		{/foreach}
	{/if}
</div>
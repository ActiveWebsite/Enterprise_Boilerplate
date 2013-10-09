<div class="compare-listing-agent">
	<h4>
		{if $current_account_user.realtor && $current_account_user.realtor.entity_type|lower == 'realtor'}
			<a href="{$ACTION_URLS.realtor}info/{$current_account_user.realtor.rebrand_code}" target="_blank">{$current_account_user.realtor.name}</a>
		{elseif $current_account_user.realtor && $current_account_user.realtor.entity_type|lower == 'team'}
			<a href="{$ACTION_URLS.realtor}team/{$current_account_user.realtor.rebrand_code}" target="_blank">{$current_account_user.realtor.name}</a>
		{elseif $realtor.entity_type|lower == 'realtor'}
			<a href="{$ACTION_URLS.realtor}info/{$realtor.rebrand_code}" target="_blank">{$realtor.name}</a>
		{elseif $realtor.entity_type|lower == 'team'}
			<a href="{$ACTION_URLS.realtor}team/{$realtor.rebrand_code}" target="_blank">{$realtor.name}</a>
		{else}
			{$current_company.name}
		{/if}
	</h4>
	<div class="row">
		<div class="col-sm-4">
			{if $current_account_user.realtor.pic instanceof EntityPicture}
				<img src="{$current_account_user.realtor.pic->getURL()}/crop/81,97/" alt="{$realtor.name}">
			{elseif $realtor.pic instanceof EntityPicture}
				<img src="{$realtor.pic->getURL()}/crop/81,97/" alt="{$realtor.name}">
			{elseif $current_company.thumb_pic.url}
				<img src="{$current_company.thumb_pic.url}" alt="No Photo">
			{else}
				<img src="/images/agent-placeholder.jpg" alt="No Photo">
			{/if}
		</div>
		<div class="col-sm-8">
			<ul class="list-unstyled">
				{if $current_account_user.realtor}
					{if $current_account_user.realtor.address.Direct_Phone.value}
						<li><strong>Direct:</strong> {$current_account_user.realtor.address.Direct_Phone.value}</li>
					{elseif $current_account_user.realtor.address.Cell_Phone.value}
						<li><strong>Mobile:</strong> {$current_account_user.realtor.address.Cell_Phone.value}</li>
					{elseif $current_account_user.realtor.address.Office_Phone.value}
						<li><strong>Office:</strong> {$current_account_user.realtor.address.Office_Phone.value}</li>
					{elseif $current_account_user.realtor.address.Home_Phone.value}
						<li><strong>Home:</strong> {$current_account_user.realtor.address.Home_Phone.value}</li>
					{elseif $current_account_user.realtor.address.Fax_Phone.value}
						<li><strong>Fax:</strong> {$current_account_user.realtor.address.Fax_Phone.value}</li>
					{/if}
				{elseif $realtor && $realtor.id}
					{if $realtor.address.Direct_Phone.value}
						<li><strong>Direct:</strong> {$realtor.address.Direct_Phone.value}</li>
					{elseif $realtor.address.Cell_Phone.value}
						<li><strong>Mobile:</strong> {$realtor.address.Cell_Phone.value}</li>
					{elseif $realtor.address.Office_Phone.value}
						<li><strong>Office:</strong> {$realtor.address.Office_Phone.value}</li>
					{elseif $realtor.address.Home_Phone.value}
						<li><strong>Home:</strong> {$realtor.address.Home_Phone.value}</li>
					{elseif $realtor.address.Fax_Phone.value}
						<li><strong>Fax:</strong> {$realtor.address.Fax_Phone.value}</li>
					{/if}
				{elseif $current_company}
					{if $current_company.address.Direct_Phone.value}
						<li><strong>Direct:</strong> {$current_company.address.Direct_Phone.value}</li>
					{elseif $current_company.address.Cell_Phone.value}
						<li><strong>Mobile:</strong> {$current_company.address.Cell_Phone.value}</li>
					{elseif $current_company.address.Office_Phone.value}
						<li><strong>Office:</strong> {$realtor.address.Office_Phone.value}</li>
					{elseif $current_company.address.Home_Phone.value}
						<li><strong>Home:</strong> {$current_company.address.Home_Phone.value}</li>
					{elseif $current_company.address.Fax_Phone.value}
						<li><strong>Fax:</strong> {$current_company.address.Fax_Phone.value}</li>
					{/if}
				{/if}
			</ul>
		</div>
	</div>
	<ul class="list-unstyled margin-top-5">
		<li>
			{if $current_account_user.realtor}
				<a title="Request More Information" rel="nofollow" target="_blank" class="fancybox" href="/popup/forms/display/request_info/?prop={$prop}&amp;realtor_id={$current_account_user.realtor.id}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="560">Request More Information</a>
			{elseif $realtor && $realtor.id}
				<a title="Request More Information" rel="nofollow" target="_blank" class="fancybox" href="/popup/forms/display/request_info/?prop={$prop}&amp;realtor_id={$realtor.id}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="560">Request More Information</a>
			{else}
				<a title="Request More Information" rel="nofollow" target="_blank" class="fancybox" href="/popup/forms/display/request_info/?prop={$prop}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="560">Request More Information</a>
			{/if}
		</li>
		<li>
			{if $current_account_user.realtor}
				<a title="Request A Showing" rel="nofollow" target="_blank" class="fancybox" href="/popup/forms/display/schedule_showing/?prop={$prop}&amp;realtor_id={$current_account_user.realtor.id}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="570">Request A Showing</a>
			{elseif $realtor && $realtor.id}
				<a title="Request A Showing" rel="nofollow" target="_blank" class="fancybox" href="/popup/forms/display/schedule_showing/?prop={$prop}&amp;realtor_id={$realtor.id}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="570">Request A Showing</a>
			{else}
				<a title="Request A Showing" rel="nofollow" target="_blank" class="fancybox" href="/popup/forms/display/schedule_showing/?prop={$prop}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="570">Request A Showing</a>
			{/if}
		</li>
	</ul>
</div>
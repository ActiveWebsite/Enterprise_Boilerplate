{render_layout_arguments var="render_page_breadcrumbs"}
	<ul class="breadcrumb">
		<li><a href="/" title="Home">Home</a></li>  
		<li><a href="/{$controller_alias}/" title="{$CURRENT_CMS_PAGE_LABEL}">{if $CURRENT_CMS_PAGE_LABEL}{$CURRENT_CMS_PAGE_LABEL}{else}{$controller_obj->cms_page->name}{/if}</a></li>
		<li>{$realtor.name}</li>
	</ul>
{/render_layout_arguments}

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

	{if $realtor.team_info.Designations}
		<hr>
		<h2>Designations</h2>
		<ul class="list-unstyled">
			<li>{$realtor.team_info.Designations|replace:',':'</li><li>'}</li>
		</ul>
	{/if}

	{if $realtor.team_info.Spoken_Languages}
		<hr>
		<h2>Languages</h2>
		<ul class="list-unstyled">
			<li>{$realtor.team_info.Spoken_Languages|replace:',':'</li><li>'}</li>
		</ul>
	{/if}

	{if $leaders || $members || $assistants}
		{if $leaders}
			<hr>
			<h2>Team Leaders</h2>
			<ul class="row multi-columns-row no-margin agent-thumb-list">
				{foreach from=$leaders item=member key=index name=leaderLoop}
					<li class="col-sm-4 col-md-4 col-lg-4">
						{if $member.entity_type == 'EntityTeam' && $member.rebrand_code}
							<a href="/{$controller_alias}/team/{$member.rebrand_code}" title="About {$member.name|clean_for_attribute}">
								<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.name|clean_for_attribute}">
							</a>
						{elseif $member.rebrand_code}
							<a href="/{$controller_alias}/info/{$member.rebrand_code}" title="About {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
								<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
							</a>
						{else}
							<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
						{/if}
						{if $member.entity_type == 'EntityTeam' && $member.rebrand_code}
							<h4><a href="/{$controller_alias}/team/{$member.rebrand_code}" title="About {$member.name|clean_for_attribute}">{$member.name}</a></h4>
						{elseif $member.rebrand_code}
							<h4><a href="/{$controller_alias}/info/{$member.rebrand_code}" title="About {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">{$member.first_name} {$member.last_name}</a></h4>
						{else}
							<h4>{$member.first_name} {$member.last_name}</h4>
						{/if}
						<ul class="list-unstyled">
							{if $member.title}<li><em>{$member.title}</em></li>{/if}
							{if $member.parent->name}<li>{$member.parent->name}</li>{/if}
							{if $member.address.Direct_Phone.value}
								<li><strong>Direct:</strong> {$member.address.Direct_Phone.value}</li>
							{elseif $member.address.Office_Phone.value}
								<li><strong>Office:</strong> {$member.address.Office_Phone.value}</li>
							{elseif $member.address.Cell_Phone.value}
								<li><strong>Mobile:</strong> {$member.address.Cell_Phone.value}</li>
							{/if}
							{if $member.Spoken_Languages}<li><strong>Language(s):</strong> {$member.Spoken_Languages|replace:',':', '}</li>{/if}
							{if $member.Designations}<li><strong>Designations:</strong> {$member.Designations|replace:',':', '}</li>{/if}
						</ul>
					</li>
				{/foreach}
			</ul>
		{/if}
		{if $members}
			<hr class="margin-top-0">
			<h2>Associates</h2>
			<ul class="row multi-columns-row agent-thumb-list">
				{foreach from=$members item=member key=index name=memberLoop}
					<li class="col-sm-4 col-md-4 col-lg-4">
						{if $member.entity_type == 'EntityTeam' && $member.rebrand_code}
							<a href="/{$controller_alias}/team/{$member.rebrand_code}" title="About {$member.name|clean_for_attribute}">
								<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.name|clean_for_attribute}">
							</a>
						{elseif $member.rebrand_code}
							<a href="/{$controller_alias}/info/{$member.rebrand_code}" title="About {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
								<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
							</a>
						{else}
							<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
						{/if}
						{if $member.entity_type == 'EntityTeam' && $member.rebrand_code}
							<h4><a href="/{$controller_alias}/team/{$member.rebrand_code}" title="About {$member.name|clean_for_attribute}">{$member.name}</a></h4>
						{elseif $member.rebrand_code}
							<h4><a href="/{$controller_alias}/info/{$member.rebrand_code}" title="About {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">{$member.first_name} {$member.last_name}</a></h4>
						{else}
							<h4>{$member.first_name} {$member.last_name}</h4>
						{/if}
						<ul class="list-unstyled">
							{if $member.title}<li><em>{$member.title}</em></li>{/if}
							{if $member.parent->name}<li>{$member.parent->name}</li>{/if}
							{if $member.address.Direct_Phone.value}
								<li><strong>Direct:</strong> {$member.address.Direct_Phone.value}</li>
							{elseif $member.address.Office_Phone.value}
								<li><strong>Office:</strong> {$member.address.Office_Phone.value}</li>
							{elseif $member.address.Cell_Phone.value}
								<li><strong>Mobile:</strong> {$member.address.Cell_Phone.value}</li>
							{/if}
							{if $member.Spoken_Languages}<li><strong>Language(s):</strong> {$member.Spoken_Languages|replace:',':', '}</li>{/if}
							{if $member.Designations}<li><strong>Designations:</strong> {$member.Designations|replace:',':', '}</li>{/if}
						</ul>
					</li>
				{/foreach}
			</ul>
		{/if}
		{if $assistants}
			<hr class="margin-top-0">
			<h2>Staff</h2>
			<ul class="row multi-columns-row agent-thumb-list">
				{foreach from=$assistants item=member key=index name=assistantLoop}
					<li class="col-sm-4 col-md-4 col-lg-4">
						{if $member.entity_type == 'EntityTeam' && $member.rebrand_code}
							<a href="/{$controller_alias}/team/{$member.rebrand_code}" title="About {$member.name|clean_for_attribute}">
								<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.name|clean_for_attribute}">
							</a>
						{elseif $member.rebrand_code}
							<a href="/{$controller_alias}/info/{$member.rebrand_code}" title="About {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
								<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
							</a>
						{else}
							<img src="{if $member.pic_url}{$member.pic_url}/crop/275,200{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">
						{/if}
						{if $member.entity_type == 'EntityTeam' && $member.rebrand_code}
							<h4><a href="/{$controller_alias}/team/{$member.rebrand_code}" title="About {$member.name|clean_for_attribute}">{$member.name}</a></h4>
						{elseif $member.rebrand_code}
							<h4><a href="/{$controller_alias}/info/{$member.rebrand_code}" title="About {$member.first_name|clean_for_attribute} {$member.last_name|clean_for_attribute}">{$member.first_name} {$member.last_name}</a></h4>
						{else}
							<h4>{$member.first_name} {$member.last_name}</h4>
						{/if}
						<ul class="list-unstyled">
							{if $member.title}<li><em>{$member.title}</em></li>{/if}
							{if $member.parent->name}<li>{$member.parent->name}</li>{/if}
							{if $member.address.Direct_Phone.value}
								<li><strong>Direct:</strong> {$member.address.Direct_Phone.value}</li>
							{elseif $member.address.Office_Phone.value}
								<li><strong>Office:</strong> {$member.address.Office_Phone.value}</li>
							{elseif $member.address.Cell_Phone.value}
								<li><strong>Mobile:</strong> {$member.address.Cell_Phone.value}</li>
							{/if}
							{if $member.Spoken_Languages}<li><strong>Language(s):</strong> {$member.Spoken_Languages|replace:',':', '}</li>{/if}
							{if $member.Designations}<li><strong>Designations:</strong> {$member.Designations|replace:',':', '}</li>{/if}
						</ul>
					</li>
				{/foreach}
			</ul>
		{/if}
	{/if}

	{if $testimonials}
		<h2>testimonials</h2>
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
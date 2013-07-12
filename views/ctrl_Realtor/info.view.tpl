{render_layout_arguments var="render_page_breadcrumbs"}
	<ul class="breadcrumb">
		<li><a href="/" title="Home">Home</a></li>  
		<li><a href="/{$controller_alias}/" title="{$CURRENT_CMS_PAGE_LABEL}">{if $CURRENT_CMS_PAGE_LABEL}{$CURRENT_CMS_PAGE_LABEL}{else}{$controller_obj->cms_page->name}{/if}</a></li>
		<li>{$realtor.name}</li>
	</ul>
{/render_layout_arguments}

<div id="realtor-bio-page">
	<h1 class="page-heading">{$realtor.name}</h1>
	<div class="row">
		<div class="col-sm-4 col-lg-4 margin-bottom-20">
			<img src="{if $realtor.pic_url}{$realtor.pic_url}maxwidth/275{else}/images/agent-placeholder.jpg{/if}" class="img-hd" data-hd-src="{if $realtor.pic_url}{$realtor.pic_url}maxwidth/550{/if}" alt="Photo of {$realtor.name|clean_for_attribute}">
		</div>
		<div class="col-sm-4 col-lg-4 margin-bottom-20">
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
				<li>
					<a href="/popup{$ACTION_URLS.contact}realtor/{$realtor.rebrand_code}" target="_blank" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="460" rel="nofollow" class="btn btn-default fancybox">Send Me An Email</a>
				</li>
			</ul>
		</div>
		<div class="col-sm-4 col-lg-4 margin-bottom-20">
			{if $realtor.parent_dict}
				<h4 class="no-margin"><a href="{$ACTION_URLS.office}{$realtor.parent_dict.rebrand}">{$realtor.parent_dict.name}</a></h4>
				<address>
					{$realtor.parent_dict.address.Street_Address.value}<br>
					{$realtor.parent_dict.address.City.value}, {$realtor.parent_dict.address.State.value} {$realtor.parent_dict.address.Zip.value}
				</address>
				<hr>
			{/if}
			<ul class="list-unstyled">
				{if ($realtor.website_url || $realtor.rebrand_domain) && !$SITE_OWNER instanceof Realtor}
					<li class="margin-bottom-5">
						<a href="{if $realtor.website_url}{$realtor.website_url}{else}{$realtor.rebrand_domain}{/if}" title="Visit My Website" target="_blank">Visit My Website</a>
					</li>
				{/if}
				<li class="margin-bottom-5">
					<a href="{$ACTION_URLS.realtor}info/{$realtor.rebrand_code}?view=print" title="Printer Friendly Info Sheet" target="_blank" rel="nofollow">Printer Friendly Info Sheet</a>
				</li>
				{if $realtor.realtor_info.Blog_URL}
					<li class="margin-bottom-5">
						<a href="{$realtor.realtor_info.Blog_URL}" title="Read My Blog" target="_blank">Read My Blog</a>
					</li>
				{/if}
			</ul>
			{if $realtor.social_networks}
				<ul class="list-inline">
					{foreach from=$realtor.social_networks key=index item=social}
						<li>
							<a href="{$social->get_url()}" title="Visit my {$social->get_name()} page" target="_blank"><img src="{$social->get_image_url()}" alt="{$social->get_name()}"></a>
						</li>
					{/foreach}
				</ul>
			{/if}
		</div>
	</div>
	<hr class="margin-top-0">
	<div id="agent-bio-tabs" class="tabClass">
		<ul class="nav nav-tabs list-unstyled tab_triggers">
			<li class="active"><a href="#about">About</a></li>
			{if $properties}
				<li><a href="#listings">Listings</a></li>
			{/if}
			{if $sold_properties}
				<li><a href="#soldListings">Sold Listings</a></li>
			{/if}
			{if $testimonials}
				<li><a href="#testimonials">Testimonials</a></li>
			{/if}
			<li><a href="#multimedia">Multimedia</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="about">
				<div class="row">
					<div class="col-sm-8 col-lg-8">
						<h2>About {$realtor.name}</h2>
						<div class="cms-page">
							{$realtor.biography}
						</div>
					</div>
					<div class="col-sm-4 col-lg-4">
						{if $realtor.realtor_info.Designations}
							<h3>Designations</h3>
							<ul class="list-unstyled">
								<li>{$realtor.realtor_info.Designations|replace:',':'</li><li>'}</li>
							</ul>
						{/if}
						{if $realtor.realtor_info.Designations && $realtor.realtor_info.Spoken_Languages}
							<hr>
						{/if}
						{if $realtor.realtor_info.Spoken_Languages}
							<h3>Languages</h3>
							<ul class="list-unstyled">
								<li>{$realtor.realtor_info.Spoken_Languages|replace:',':'</li><li>'}</li>
							</ul>
						{/if}
					</div>
				</div>
			</div>
			{if $properties}
				<div class="tab-pane" id="listings">
					<ul class="row multi-columns-row">
						{foreach from=$properties item=property key=index name=listingsLoop}
							{if $index < 6}
								<li class="standard-property col-sm-4 col-lg-4 margin-bottom-30">
									{if $property->information.photo->value}
										<div class="prop-photo">
											<a href="/property/{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}" title="View property at $property->getFullStreetAddress()|clean_for_attribute}">
												<img src="{$property->information.photo->value}/crop/270,177" class="img-hd" data-hd-src="{$property->information.photo->value}/crop/540,355" title="Photo of {$property->getFullStreetAddress()|clean_for_attribute}">
											</a>
										</div>
									{/if}
									<h3>
										<a href="/property/{$property->company_property_id}/{$property->getFullStreetAddress()|clean_for_url}" title="View property at {$property->getFullStreetAddress()|clean_for_attribute}">
											{$property->getFullStreetAddress()}
										</a>
									</h3>
									<p>
										{$property->information.list_price->value}
										{if $property->information.bedrooms_total->value > 0} | {$property->information.bedrooms_tota->valuel|clean_bed_bath} Bed{if $property->information.bedrooms_total->value > 1}s{/if}{/if}
										{if $property->information.bathrooms_total->value > 0} | {$property->information.bathrooms_total->value|clean_bed_bath} Bath{if $property->information.bathrooms_total->value > 1}s{/if}{/if}
									</p>
									<div class="prop-cta clearfix">
										<a href="/property/property_details_quick_view/{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-quickview">
											Quick View
										</a>
										<a href="/popup{$ACTION_URLS.account}addRemoveFavoritePropertyManager/{$property->company_property_id}" data-property-id="{$property->company_property_id}" class="addFavorite addFavoriteButton" target="_blank" rel="nofollow" title="Add to Favorites">
											Add to Favorites
										</a>
										<a href="#{$property->company_property_id}" data-property-id="{$property->company_property_id}" class="property-bin-add property-bin-button" title="Add to Bin">
											Add to Bin
										</a>
									</div>
								</li>
							{/if}
						{/foreach}
					</ul>
					{if count($properties) > 6}
						<div class="search-component-view-all">
							<a href="{$ACTION_URLS.search}Listing_Agent/{$realtor.rebrand_code}" title="View All Listings">View All</a>
						</div>
					{/if}
				</div>
			{/if}
			{if $sold_properties}
				<div class="tab-pane" id="soldListings">
					<ul class="row multi-columns-row">
						{foreach from=$sold_properties item=property key=index name=soldListingsLoop}
							{if $index < 6}
								<li class="standard-property col-sm-4 col-lg-4 margin-bottom-30">
									{if $property->information.photo->value}
										<div class="prop-photo">
											<img src="{$property->information.photo->value}/crop/270,177" class="img-hd" data-hd-src="{$property->information.photo->value}/crop/540,355" title="Photo of {$property->getFullStreetAddress()|clean_for_attribute}">
										</div>
									{/if}
									<h3>
										{$property->getFullStreetAddress()}
									</h3>
									<p>
										{$property->information.list_price->value}
										{if $property->information.bedrooms_total->value > 0} | {$property->information.bedrooms_tota->valuel|clean_bed_bath} Bed{if $property->information.bedrooms_total->value > 1}s{/if}{/if}
										{if $property->information.bathrooms_total->value > 0} | {$property->information.bathrooms_total->value|clean_bed_bath} Bath{if $property->information.bathrooms_total->value > 1}s{/if}{/if}
									</p>
									<div class="prop-cta clearfix">
										<a href="/property/property_details_quick_view/{$property->company_property_id}" data-fancybox-type="iframe" data-fancybox-width="800" data-fancybox-height="400" class="fancybox btn btn-quickview">
											Quick View
										</a>
									</div>
								</li>
							{/if}
						{/foreach}
					</ul>
					{if count($sold_properties) > 6}
						<div class="search-component-view-all">
							<a href="{$ACTION_URLS.search}sold/true/Listing_Agent/{$realtor.rebrand_code}" title="View All Listings">View All</a>
						</div>
					{/if}
				</div>
			{/if}
			{if $testimonials}
				<div class="tab-pane" id="testimonials">
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
				</div>
			{/if}
			<div class="tab-pane" id="multimedia">
				{if $realtor.links || $realtor.social_networks || $realtor.website_url || $realtor.realtor_info.Blog_URL}
					<h3>Links</h3>
					<ul class="row multi-columns-row">
						{foreach from=$realtor.links item=link key=index name=linksLoop}
							<li class="col-sm-4 col-lg-4 margin-bottom-30"><a href="{$link->website_url}" target="_blank">{$link->label}</a></li>
						{/foreach}
						{if ($realtor.website_url || $realtor.rebrand_domain) && !$SITE_OWNER instanceof Realtor}
							<li class="col-sm-4 col-lg-4 margin-bottom-30"><a href="{if $realtor.website_url}{$realtor.website_url}{else}{$realtor.rebrand_domain}{/if}" target="_blank" title="Visit My Website">My Website</a></li>
						{/if}
						{if $realtor.realtor_info.Blog_URL}
							<li class="col-sm-4 col-lg-4 margin-bottom-30"><a href="{$realtor.realtor_info.Blog_URL}" target="_blank" title="Read My Blog">My Blog</a></li>
						{/if}
						{foreach from=$realtor.social_networks key=index item=social name="socialLoop"}
							<li class="col-sm-4 col-lg-4 margin-bottom-30"><a href="{$social->get_url()}" title="Visit our {$social->get_name()} page" target="_blank">{$social->get_name()}</a></li>
						{/foreach}
					</ul>
					<hr class="margin-top-0">
				{/if}
					<h3>Documents</h3>
					<ul class="row multi-columns-row">
						<li class="col-sm-4 col-lg-4 margin-bottom-30">
							<a href="{$ACTION_URLS.realtor}info/{$realtor.rebrand_code}?view=print" title="Agent Bio Printer Friendly Information Sheet" target="_blank" rel="nofollow">Printer Friendly Information Sheet</a>
						</li>
						{foreach from=$realtor.files item=file key=index name=documentsLoop}
							<li class="col-sm-4 col-lg-4 margin-bottom-30"><a href="{$file.url}" target="_blank">{$file.name}</a></li>
						{/foreach}
					</ul>
				{if $realtor.videos}
					<hr class="margin-top-0">
					<h3>Videos</h3>
					<ul class="row multi-columns-row">
						{foreach from=$realtor.videos item=videos}
							{if $videos.branded == 1}
								<li class="col-sm-4 col-lg-4 margin-bottom-30">
									<a href="{$videos.video_url|htmlentities}" data-fancybox-type="iframe" data-fancybox-width="550" data-fancybox-height="415" class="fancybox" rel="nofollow" title="Play Video" target="_blank">{$videos.name}</a>
								</li>
							{else}
								<li class="col-sm-4 col-lg-4 margin-bottom-30">
									<a target="_blank" rel="nofollow" href="{$videos.video_url|htmlentities}" title="Play Video">{$videos.name}</a>
								</li>
							{/if}
						{/foreach}
					</ul>
				{/if}
			</div>
		</div>
	</div>
</div>
<footerargs>
    {literal}
    <script>
        jQuery(document).ready(function ($){
            // Tab instantiation
            $('#agent-bio-tabs').jtabs({
                bootstrapMode: true
            });

            // check for any favorite props in the agents listings set
			if (typeof _checkForFavorites === 'function') {
				_checkForFavorites($('#listings a.addFavorite'));
			}
        });
    </script>
    {/literal}
</footerargs>
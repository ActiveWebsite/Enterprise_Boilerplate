<div class="quick-search-component quick-search-component-content">
	<div class="relative">
		<div id="quick-search-tabs" class="tabClass">
			<ul class="nav nav-tabs tab_triggers">
				<li class="active"><a href="#qs-homes">Homes</a></li>
				<li><a href="#qs-open-house">Open House</a></li>
				<li><a href="#qs-agent">Agents</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="qs-homes">
					<div class="clearfix margin-bottom-5">
						<a href="#" data-action="toggle-quicksearch" data-target="#quick-search-extra" data-show-template="<i class='icon icon-plus'></i> more" data-hide-template="<i class='icon icon-minus'></i> less" class="pull-right"><i class="icon icon-plus"></i> more</a>
					</div>
					<form action="{$ACTION_URLS.search}url_search/" class="margin-bottom-0">
						<fieldset class="clearfix">
							<input type="text" value="" placeholder="Address, Zip Code or MLS#" name="AddressAndLoc" class="margin-bottom-10">
							<label for="qss-field-02">Property Type</label>
							<select id="qss-field-02" title="Select Property Type" name="Property_Type" class="margin-bottom-10">
								{if $search_config.property_type instanceof CompanySearchConfig}
									{foreach from=$search_config.property_type->getValues() item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if} 
							</select>   
							<label for="qss-field-03">Price Range</label>
							<div class="row">
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<select id="qss-field-03" name="Min_Price">
										{if $search_config.min_price instanceof CompanySearchConfig}
											{foreach from=$search_config.min_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
								<div class="to-spacer-gutter margin-bottom-10">to</div>
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<select name="Max_Price">
										{if $search_config.max_price instanceof CompanySearchConfig}
											{foreach from=$search_config.max_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<label for="qss-field-04">Beds</label>
									<select id="qss-field-04" title="Select Bedrooms" name="Bedrooms">
										{if $search_config.bedrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bedrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
								<div class="col-sm-6 col-lg-6 margin-bottom-10">									
									<label for="qss-field-05">Baths</label>
									<select id="qss-field-05" title="Select Bathrooms" name="Bathrooms">
										{if $search_config.bathrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bathrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Search</button>
							<a href="{$ACTION_URLS.search}" title="Advanced Search">Advanced Search</a>
						</fieldset>
					</form>
					<div id="quick-search-extra" class="quick-search-extra-section quick-search-extra-content-section" style="display:none;">
						<a href="#" data-action="close-quicksearch" class="pull-right quick-search-extra-close"><i class="icon icon-remove"></i></a>
						<ul class="list-unstyled no-margin">
							<li>
								<form action="/site_search/" method="get" class="form-inline margin-bottom-10">
									<label class="block">Site Search</label>
									<input name="q" value="" type="text" placeholder="Enter Term(s)">
									<button class="btn btn-primary" type="submit">Search</button>
								</form>
							</li>
							<li class="margin-bottom-10"><h4><a href="/open_houses/" title="Open Houses">Open houses</a></h4></li>
							<li><h4><a href="/map_search/" title="Map Search">Map Search</a></h4></li>
						</ul>
					</div>
				</div>
				<div class="tab-pane" id="qs-open-house">
					<form action="{$ACTION_URLS.search}url_search/" class="margin-bottom-0">
						<input type="hidden" value="on" name="open_house">
						<fieldset class="clearfix">
							<input type="text" value="" placeholder="Address, Zip Code or MLS#" name="AddressAndLoc" class="margin-bottom-10">
							<label for="qsos-field-02">Property Type</label>
							<select id="qsos-field-02" title="Select Property Type" name="Property_Type" class="margin-bottom-10">
								{if $search_config.property_type instanceof CompanySearchConfig}
									{foreach from=$search_config.property_type->getValues() item=name key=value}
										<option value="{$value}">{$name}</option>
									{/foreach}
								{/if} 
							</select>   
							<label for="qsos-field-03">Price Range</label>
							<div class="row">
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<select id="qss-field-03" name="Min_Price">
										{if $search_config.min_price instanceof CompanySearchConfig}
											{foreach from=$search_config.min_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}
									</select>
								</div>
								<div class="to-spacer-gutter margin-bottom-10">to</div>
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<select name="Max_Price">
										{if $search_config.max_price instanceof CompanySearchConfig}
											{foreach from=$search_config.max_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<label for="qsos-field-04">Beds</label>
									<select id="qsos-field-04" title="Select Bedrooms" name="Bedrooms">
										{if $search_config.bedrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bedrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
								<div class="col-sm-6 col-lg-6 margin-bottom-10">
									<label for="qsos-field-05">Baths</label>
									<select id="qsos-field-05" title="Select Bathrooms" name="Bathrooms">
										{if $search_config.bathrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bathrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Search</button>
						</fieldset>
					</form>
				</div>
				<div class="tab-pane" id="qs-agent">
					{render_component component="AgentSearch"}
				</div>
			</div>
		</div>
	</div>
</div>
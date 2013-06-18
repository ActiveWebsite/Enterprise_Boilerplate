<div class="quick-search-component quick-search-component-home">
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
						<a href="#" data-action="toggle-quicksearch" data-target="#quick-search-extra" data-show-template="<i class='icon-plus'></i> more" data-hide-template="<i class='icon-minus'></i> less" class="pull-right"><i class="icon-plus"></i> more</a>
					</div>
					<form action="{$ACTION_URLS.search}url_search/" class="margin-bottom-0">
						<fieldset class="clearfix">
							<div class="row-fluid margin-bottom-10">
								<div class="span12">
									<input class="span12" id="qs_field_01" type="text" value="" placeholder="Address, Zip Code or MLS#" name="AddressAndLoc">
								</div>
							</div>
							<div class="row-fluid margin-bottom-10">
								<div class="span12">
									<label for="qs_field_02">Property Type</label>
									<select class="span12" id="qs_field_02" title="Select Property Type" name="Property_Type">
										{if $search_config.property_type instanceof CompanySearchConfig}
											{foreach from=$search_config.property_type->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if} 
									</select>   
								</div>
							</div>
							<label for="qss-field-03">Price Range</label>
							<div class="row-fluid margin-bottom-10">
								<div class="span5-half">
									<select id="qss-field-03" class="span12" name="Min_Price">
										{if $search_config.min_price instanceof CompanySearchConfig}
											{foreach from=$search_config.min_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
								<div class="span1">
									<span class="to-spacer">to</span>
								</div>
								<div class="span5-half">
									<select class="span12" name="Max_Price">
										{if $search_config.max_price instanceof CompanySearchConfig}
											{foreach from=$search_config.max_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<div class="row-fluid margin-bottom-5">
								<div class="span6">
									<label for="qs_field_04">Beds</label>
									<select id="qs_field_04" class="span12" title="Select Bedrooms" name="Bedrooms">
										{if $search_config.bedrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bedrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
								<div class="span6">
									<label for="qs_field_05">Baths</label>
									<select id="qs_field_05" class="span12" title="Select Bathrooms" name="Bathrooms">
										{if $search_config.bathrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bathrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<input type="submit" value="Search" class="btn pull-right">
							<a href="{$ACTION_URLS.search}" title="Advanced Search">Advanced Search</a>
						</fieldset>
					</form>
					<div id="quick-search-extra" class="quick-search-extra-section quick-search-extra-home-section" style="display:none;">
						<a href="#" data-action="close-quicksearch" class="pull-right quick-search-extra-close"><i class="icon-remove"></i></a>
						<ul class="unstyled no-margin">
							<li class="margin-bottom-10">
								<h4>Site Search</h4>
								<form action="/site_search/" method="get" class="no-margin">
									<fieldset class="row-fluid margin-top-5">
										<div class="span8">
											<input class="span12" name="q" value="" type="text" placeholder="Enter Search Term(s)">
										</div>
										<div class="span4">
											<input class="btn btn-block" type="submit" value="Search">
										</div>
									</fieldset>
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
							<div class="row-fluid margin-bottom-10">
								<div class="span12">
									<input class="span12" id="qs_field_01" type="text" value="" placeholder="Address, Zip Code or MLS#" name="AddressAndLoc">
								</div>
							</div>
							<div class="row-fluid margin-bottom-10">
								<div class="span12">
									<label for="qs_field_02">Property Type</label>
									<select class="span12" id="qs_field_02" title="Select Property Type" name="Property_Type">
										{if $search_config.property_type instanceof CompanySearchConfig}
											{foreach from=$search_config.property_type->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if} 
									</select>   
								</div>
							</div>
							<label for="qss-field-03">Price Range</label>
							<div class="row-fluid margin-bottom-10">
								<div class="span5-half">
									<select id="qss-field-03" class="span12" name="Min_Price">
										{if $search_config.min_price instanceof CompanySearchConfig}
											{foreach from=$search_config.min_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
								<div class="span1">
									<span class="to-spacer">to</span>
								</div>
								<div class="span5-half">
									<select class="span12" name="Max_Price">
										{if $search_config.max_price instanceof CompanySearchConfig}
											{foreach from=$search_config.max_price->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<div class="row-fluid margin-bottom-5">
								<div class="span6">
									<label for="qs_field_04">Beds</label>
									<select id="qs_field_04" class="span12" title="Select Bedrooms" name="Bedrooms">
										{if $search_config.bedrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bedrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
								<div class="span6">
									<label for="qs_field_05">Baths</label>
									<select id="qs_field_05" class="span12" title="Select Bathrooms" name="Bathrooms">
										{if $search_config.bathrooms instanceof CompanySearchConfig}
											{foreach from=$search_config.bathrooms->getValues() item=name key=value}
												<option value="{$value}">{$name}</option>
											{/foreach}
										{/if}    
									</select>
								</div>
							</div>
							<input type="submit" value="Search" class="btn pull-right">
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
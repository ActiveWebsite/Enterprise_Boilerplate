{if $realtors}
	<div class="roster-last-name-list">
		<ul class="list-inline">
			<li>Last Name:</li>
			<li><a href="?last_letter=a">A</a></li>
			<li><a href="?last_letter=b">B</a></li>         
			<li><a href="?last_letter=c">C</a></li>
			<li><a href="?last_letter=d">D</a></li>
			<li><a href="?last_letter=e">E</a></li>
			<li><a href="?last_letter=f">F</a></li>
			<li><a href="?last_letter=g">G</a></li>
			<li><a href="?last_letter=h">H</a></li>
			<li><a href="?last_letter=i">I</a></li>
			<li><a href="?last_letter=j">J</a></li>
			<li><a href="?last_letter=k">K</a></li>
			<li><a href="?last_letter=l">L</a></li>
			<li><a href="?last_letter=m">M</a></li>
			<li><a href="?last_letter=n">N</a></li>
			<li><a href="?last_letter=o">O</a></li>
			<li><a href="?last_letter=p">P</a></li>
			<li><a href="?last_letter=q">Q</a></li>
			<li><a href="?last_letter=r">R</a></li>
			<li><a href="?last_letter=s">S</a></li>
			<li><a href="?last_letter=t">T</a></li>
			<li><a href="?last_letter=u">U</a></li>
			<li><a href="?last_letter=v">V</a></li>
			<li><a href="?last_letter=w">W</a></li>
			<li><a href="?last_letter=x">X</a></li>
			<li><a href="?last_letter=y">Y</a></li>
			<li><a href="?last_letter=z">Z</a></li>
			<li><a title="Show All" href="/{$controller_alias}/">Show All</a></li>
		</ul>
	</div>
	<hr>
	<div class="clearfix" id="agent-roster-view-toggles">
		<h2 class="pull-left">{$realtors|@count} Agents Found</h2>
		<div class="pull-right btn-toolbar no-margin">
			<div class="btn-group">
				<a href="#agent-roster-list-view" data-action="toggleRoster" data-target="#agent-roster-list-view" class="btn btn-default active"><i class="icon icon-align-justify"></i> List</a>
				<a href="#agent-roster-thumb-view" data-action="toggleRoster" data-target="#agent-roster-thumb-view" data-gallery="true" class="btn btn-default"><i class="icon icon-th-large"></i> Gallery</a>
			</div>
		</div>
	</div>
	<div id="agent-roster-results">
		<div class="roster-result-set active" id="agent-roster-list-view">
			<ul class="row multi-columns-row">
				{foreach from=$realtors item=realtor key=index}
					<li class="col-6 col-sm-4 col-lg-4 margin-bottom-30">
						{if $realtor.entity_type == 'Realtor'}
							<a href="/{$controller_alias}/info/{$realtor.rebrand_code}" data-action="agent-tooltip" data-realtor="{$realtor.id}">{$realtor.name}</a>
						{elseif $realtor.entity_type == 'EntityTeam'}
							<a href="/{$controller_alias}/team/{$realtor.rebrand_code}" data-action="agent-tooltip" data-realtor="{$realtor.id}">{$realtor.name}</a>
						{/if}
					</li>
				{/foreach}
			</ul>
		</div>
		<div class="roster-result-set" id="agent-roster-thumb-view">
			<ul class="row multi-columns-row agent-thumb-list">
				{foreach from=$realtors item=realtor key=index}
					<li class="col-6 col-sm-6 col-lg-4 margin-bottom-30">
						{if $realtor.entity_type == 'EntityTeam'}
							<a href="/{$controller_alias}/team/{$realtor.rebrand_code}" title="About {$realtor.name|clean_for_attribute}">
								<img class="replace-image" src="/images/agent-placeholder.jpg" data-hd-src="{if $realtor.pic_url}{$realtor.pic_url}/maxwidth/540{/if}" data-src="{if $realtor.pic_url}{$realtor.pic_url}/maxwidth/270{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$realtor.name|clean_for_attribute}">
							</a>
						{else}
							<a href="/{$controller_alias}/info/{$realtor.rebrand_code}" title="About {$realtor.first_name|clean_for_attribute} {$realtor.last_name|clean_for_attribute}">
								<img class="replace-image" src="/images/agent-placeholder.jpg" data-hd-src="{if $realtor.pic_url}{$realtor.pic_url}/maxwidth/540{/if}" data-src="{if $realtor.pic_url}{$realtor.pic_url}/maxwidth/270{else}/images/agent-placeholder.jpg{/if}" alt="Photo of {$realtor.first_name|clean_for_attribute} {$realtor.last_name|clean_for_attribute}">
							</a>
						{/if}
						{if $realtor.entity_type == 'EntityTeam'}
							<h4><a href="/{$controller_alias}/team/{$realtor.rebrand_code}" title="About {$realtor.name|clean_for_attribute}">{$realtor.name}</a></h4>
						{else}
							<h4><a href="/{$controller_alias}/info/{$realtor.rebrand_code}" title="About {$realtor.first_name|clean_for_attribute} {$realtor.last_name|clean_for_attribute}">{$realtor.first_name} {$realtor.last_name}</a></h4>
						{/if}
						<ul class="list-unstyled">
							{if $realtor.title}<li><em>{$realtor.title}</em></li>{/if}
							{if $realtor.parent->name}<li>{$realtor.parent->name}</li>{/if}
							{if $realtor.address.Direct_Phone.value}
								<li><strong>Direct:</strong> {$realtor.address.Direct_Phone.value}</li>
							{elseif $realtor.address.Office_Phone.value}
								<li><strong>Office:</strong> {$realtor.address.Office_Phone.value}</li>
							{elseif $realtor.address.Cell_Phone.value}
								<li><strong>Mobile:</strong> {$realtor.address.Cell_Phone.value}</li>
							{/if}
							{if $realtor.Spoken_Languages}<li><strong>Language(s):</strong> {$realtor.Spoken_Languages|replace:',':', '}</li>{/if}
							{if $realtor.Designations}<li><strong>Designations:</strong> {$realtor.Designations|replace:',':', '}</li>{/if}
						</ul>
					</li>
				{/foreach}
			</ul>
		</div>
	</div>
{elseif $smarty.request.Search}
	<div class="alert alert-danger alert-block">
		<span class="bold block">No Agents Were Found</span>
		We could not find any results based on your search criteria. Please broaden your search.
	</div>
{else}
	<div class="alert alert-success alert-block bold">
		Please use the search form above to find an agent.
	</div>
{/if}
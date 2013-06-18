Realtor Layouts
===============

This folder contains all of the layouts for a realtor/team rebrands. We recommend that you name the layout's something distinct like "blue_layout.view".
The corresponding footors and breadcrumb includes for the layouts are in the `breadcrumbs` and `footers` directories within this directory.

Adding Layouts to the Database
------------------------------

Find current layouts:

	select * from enterprise.rebrand_layout where company_id=\`<company_id>\`;

Find current sub layouts (home pages):
	
	select * from enterprise.rebrand_sub_layout where company_id=`<company_id>`;

Add Layouts:
------------	
	
	Insert the following data into the `enterprise.rebrand_layout` table as a new row:
	directory = `realtor/<name_of_your_layout>` ie: realtor/blue_layout.view.tpl
	pretty_name = `Blue Rebrand`
	company_id = `<company_id>`
	usage_bit = `68`
	multi_page = `1`

Add Home Pages For Layouts:
--------------------------

	Insert the following data into the `enterprise.rebrand_sub_layout` table as a new row:
	layout_id = `the id of the layout you just added in the enterprise.rebrand_layout table`
	directory = `name of file` ie: blue_home
	pretty_name = `Blue Rebrand Home`
	company_id = `<company_id>`
	usage_bit = 68
IPW Layouts
===========

This folder contains all of the layouts Individual Property Websites (IPW). We recommend that you name the layout's something distinct like "standard_ipw.view".

Adding Layouts to the Database
------------------------------

Find current layouts:

	select * from enterprise.rebrand_layout where company_id=`<company_id>`;

Find current sub layouts (home pages):
	
	select * from enterprise.rebrand_sub_layout where company_id=`<company_id>`;

Add IPW Layouts:
------------	
	
	Insert the following data into the `enterprise.rebrand_layout` table as a new row:
	directory = `realtor/<name_of_your_layout>` ie: ipw/standard_ipw.view.tpl
	pretty_name = `Standard IPW`
	company_id = `<company_id>`
	usage_bit = `8`
	multi_page = `1` (if not multi-page use 0)

Add Home Pages For IPW Layouts:
--------------------------

	Insert the following data into the `enterprise.rebrand_sub_layout` table as a new row:
	layout_id = `the id of the layout you just added in the enterprise.rebrand_layout table`
	directory = `name of file` ie: standard_ipw_home
	pretty_name = `Standard IPW Home`
	company_id = `<company_id>`
	usage_bit = `8`
#IPW Layouts

This folder contains all of the layouts Individual Property Websites (IPW). We recommend that you name the layout's something distinct like "standard_ipw.view".

##LESS Code For Layouts

The LESS files for each layout are in the `client_side/less/ipw` folder. Each layout should have the following files.

	ipw_styles.less
	ipw_variables.less
	ipw_layout.less

If you have multiple ipws you would simply replace the `ipw_`  with something like `blue_ipw_` or `red_ipw_` or `foo_ipw_` and adjust the imports that are in the `x_ipw_styles.less` file.

##Adding Layouts to the Database

Find current layouts:

	select * from enterprise.rebrand_layout where company_id=`<company_id>`;

Find current sub layouts (home pages):
	
	select * from enterprise.rebrand_sub_layout where company_id=`<company_id>`;

###Add IPW Layouts:
	
	Insert the following data into the `enterprise.rebrand_layout` table as a new row:
	directory = `realtor/<name_of_your_layout>` ie: ipw/standard_ipw.view.tpl
	pretty_name = `Standard IPW`
	company_id = `<company_id>`
	usage_bit = `8`
	multi_page = `1` (if not multi-page use 0)

###Add Home Pages For IPW Layouts:

	Insert the following data into the `enterprise.rebrand_sub_layout` table as a new row:
	layout_id = `the id of the layout you just added in the enterprise.rebrand_layout table`
	directory = `name of file` ie: standard_ipw_home
	pretty_name = `Standard IPW Home`
	company_id = `<company_id>`
	usage_bit = `8`

##Setting Up The Rebrand:

	Login to that admin panel for your client. (<client>.<you>.dev.lan/admin)

###Verify That Your Domain Exists

	Go to the "AW Only" > "App Config" > "Company Domains" page or (/admin/appconfig/company_domains)
	Make sour your domain is in the list for "example gardener.james.dev.lan". If it is not, add your domain.

###Add IPW Domains

	Next, Go to the IPW page in the admin. (/admin/ipw/) Then hit the "Add IPW" button.
	For the IPW Code, use something like "testipw".
	Find A property you like and enter its MLS # in the MLS# field. It should autocomplete and change the data source for you.
	Choose the Layout you entered into the database.
	Hit "Create IPW" when you are done.
	You may have to clear mem-cache but you should now be able to go to http://testipw.<client>.<you>.dev.lan/
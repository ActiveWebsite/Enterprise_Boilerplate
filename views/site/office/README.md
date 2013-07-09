#Realtor Layouts


This folder contains all of the layouts for realtor/team rebrands. We recommend that you name the layouts something distinct like "blue_layout.view".
The corresponding footor includes for the layouts are in the `footers` directory within this directory.

##LESS Code For Layouts

The LESS files for each layout are in the `client_side/less/realtor` folder. Each layout should have the following files.

	agent_rebrand_styles.less
	agent_rebrand_variables.less
	agent_rebrand_layout.less

If you have multiple rebrands you would simply replace the `agent_`  with something like `blue_` or `red_` or `foo_` and adjust the imports that are in the `x_rebrand_styles.less` file.

Home page style sheets for the rebrand are in the `client_side/less/home` folder and have a similar naming convention.

##Adding Layouts to the Database

Find current layouts:

	select * from enterprise.rebrand_layout where company_id=`<company_id>`;

Find current sub layouts (home pages):
	
	select * from enterprise.rebrand_sub_layout where company_id=`<company_id>`;

##Add Layouts:
	
	Insert the following data into the `enterprise.rebrand_layout` table as a new row:
	directory = `realtor/<name_of_your_layout>` ie: office/commercial_layout.view.tpl
	pretty_name = `Commercial Office Rebrand`
	company_id = `<company_id>`
	usage_bit = `2`
	multi_page = `1`

##Add Home Pages For Layouts:

	Insert the following data into the `enterprise.rebrand_sub_layout` table as a new row:
	layout_id = `the id of the layout you just added in the enterprise.rebrand_layout table`
	directory = `name of file` ie: commercial_office_home
	pretty_name = `Commercial Office Home`
	company_id = `<company_id>`
	usage_bit = `2`

##Setting Up The Rebrand:

	Login to that admin panel for your client. (<client>.<you>.dev.lan/admin)

###Verify That Your Domain Exists

	Go to the "AW Only" > "App Config" > "Company Domains" page or (/admin/appconfig/company_domains)
	Make sour your domain is in the list for "example gardener.james.dev.lan". If it is not, add your domain.

###Add Office Rebrand Domains

	Next, Go to the office page in the admin. (/admin/office/) Then hit the "Modify Options" button and click the "Manage Rebrand" link.
	Add a domain using the URL option. Just type in "testoffice" or something like that.
	Choose the Layout you entered into the database.
	Hit "Add Domain"
	You may have to clear mem-cache but you should now be able to go to http://testoffice.<client>.<you>.dev.lan/
#This is the boiler plate for setting up an enterprise site.

*See R&D for questions and help.*

##Setup Access To The New Client

When dev adds the new client's app folder to the repo we need to update our server configuration to allow
us to access the new site in our browser. 

To do this, open up the folder where you have mapped your virtual host

Open the directory `sites-enabled` and then open the file `<your-name>.conf`

You will need to add the following code to the bottom of the file.

replace `<YOUR NAME>` with your first first name. You can look at previous VirtualHost in the folder to see what it is.
replace `<APP Folder>` with the name of the folder in the app directory for the new client.
replace `<APP NAME>` with the name of the new client. No spaces _ - ` " or anything like that is allowed for the name.

	<VirtualHost *:80>
		ServerName <APP NAME>.<YOUR NAME>.dev.lan
		ServerAlias *.<APP NAME>.<YOUR NAME>.dev.lan

		DocumentRoot /home/ACTIVEWEBSITE/<YOUR NAME>/dev/apps/<APP Folder>/public_html/
		options followSymLinks

		<Directory /home/ACTIVEWEBSITE/<YOUR NAME>/dev/apps/<APP Folder>/public_html>
			Order allow,deny
			allow from all
			AllowOverride All
		</Directory>

		ErrorLog /var/log/httpd/<YOUR NAME>.error.log
		CustomLog /var/log/httpd/<YOUR NAME>.access.log combined
	</VirtualHost>

If you need more branches than just `dev.lan` copy this again and swap out the `dev.lan` for `dev1.lan` or `dev2.lan`

##Configuring the Clients app.conf.php files
You need to setup several configs to get the new client off and running. These configs need to be added to the app-dist_dev.conf.php, app-dist_live.conf.php, and app-dist_stage.conf.php

* define('DEFAULT_SEARCH_COUNT', 12); (this will be the number of properties on the default search result)
* define('USE_FULL_LAYOUT_FLAG', true);
* define('USE_OPENID', true);
* define('NEW_FOOTER_PARSE_STRING', true);
* define('USE_NEW_FORM_HANDLER', true);
* define('REST_API_KEY', 'STRING WILL GO HERE'); (R&D will need to set this up)
* define('ONBOARD_ID', 'ID GOES HERE'); (get from pm)

##Company Configuration

You need to set several configs for the company. Below is the query to get the company's current configs:

	select * from enterprise.company_config where company_id=<commpany id>;

* company_id = <commpany id>, config_type_id = 19, config_type_value = (blank value) (this removes all the old sidebar component rendering)
* company_id = <commpany id>, config_type_id = 32, config_type_value = (blank value) (this removes all the old sidebar component rendering for rebrands)

You need to set several configs for the company address info. Below is the query to get the company's current address info:
	
	select * from company_address_info where user_id=<commpany id>;

* user_id = <commpany id>, address_info_type_id = 6, subtype = Lat_Long, value = POINT(long lat), hidden = 0
* user_id = <commpany id>, address_info_type_id = 6, subtype = Zoom, value = 11, hidden = 0

##Main Menu Setup

When you start up a new site it's helpeful to have a basic menu. Below is some SQL to get you started

You can get the current menu for your client with this query

	select * from menu_item where owner_id = <commpany id>; 

If you do not have a menu, You can build out a new one using the basic menu below.

*Make sure you replace the <commpany id> ind the sql below with the correct company id for your app.*

	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Search','/search/',NULL,'1',NULL,'/ctrl_Search/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','2','1','1','0','Search','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Contact','/contact/',NULL,'2',NULL,'/ctrl_Contact/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','1','1','1','0','Contact','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Offices','/offices/',NULL,'3',NULL,'','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','1','1','0','Offices','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Realtors','/realtor/',NULL,'4',NULL,'/ctrl_Realtor/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','1','1','0','Realtors','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Communities','/communities/',NULL,'5',NULL,'ctrl_Communities/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','1','1','0','Communities','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Open Houses','/open_houses/',NULL,'1','9571','/ctrl_OpenHouse/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','2','1','0','Open Houses','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Proximity Search','/proximity_search/',NULL,'2','9571','/ctrl_OpenHouse/proximity_search/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','2','1','0','Proximity Search','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('News','/news/',NULL,'1','9572','/ctrl_News/','<commpany id>',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','2','1','0','News','','','0','0');

##Copying Over Files/Folders

###Copy over the following directories and their contents (you don't need the readme.md files):

* views/ctrl_Forms
* views/ctrl_WebUserAccount
* views/site
* client_side/js
* client_side/less/web_user_account
* client_side/css/search
* public_html/images

###Copy over the following files:

* client_side/less/styles.less 
* client_side/less/bootstrap_includes.less 
* client_side/less/helpers.less
* client_side/less/overrides.less 
* client_side/less/site_global.less 
* client_side/less/variables.less
* client_side/less/application.less 
* client_side/less/application_variables.less
* views/ctrl_Home/index.view.tpl

###Copy over the following controller overrides:

* actions/ctrl_Content.action.php
* actions/ctrl_Home.action.php
* actions/ctrl_Search.action.php
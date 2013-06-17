This is the boiler plate for setting up an enterprise site.
===========================================================

*See R&D for questions and help.

Step 1: Configuring the Clients app.conf.php files
--------------------------------------------------
You need to setup several configs to get the new client off and running. These configs need to be added to the app-dist_dev.conf.php, app-dist_live.conf.php, and app-dist_stage.conf.php

* define('DEFAULT_SEARCH_COUNT', 12); (this will be the number of properties on the default search result)
* define('USE_FULL_LAYOUT_FLAG', true);
* define('USE_OPENID', true);
* define('NEW_FOOTER_PARSE_STRING', true);
* define('USE_NEW_FORM_HANDLER', true);
* define('REST_API_KEY', 'STRING WILL GO HERE'); (R&D will need to set this up)
* define('ONBOARD_ID', 'ID GOES HERE'); (get from pm)

Step 2: Company Configuration
-----------------------------

You need to set several configs for the company. Below is the query to get the company's current configs:

	select * from enterprise.company_config where company_id=<commpany id>;

* company_id = <commpany id>, config_type_id = 19, config_type_value = (blank value) (this removes all the old sidebar component rendering)
* company_id = <commpany id>, config_type_id = 32, config_type_value = (blank value) (this removes all the old sidebar component rendering for rebrands)

You need to set several configs for the company address info. Below is the query to get the company's current address info:
	
	select * from company_address_info where user_id=<commpany id>;
	
* user_id = <commpany id>, address_info_type_id = 6, subtype = Lat_Long, value = POINT(long lat), hidden = 0
* user_id = <commpany id>, address_info_type_id = 6, subtype = Zoom, value = 11, hidden = 0

Step 3: Menu SQL
----------------
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Search','/search/',NULL,'1',NULL,'/ctrl_Search/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','2','1','1','0','Search','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Contact','/contact/',NULL,'2',NULL,'/ctrl_Contact/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','1','1','1','0','Contact','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Offices','/offices/',NULL,'3',NULL,'','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','1','1','0','Offices','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Realtors','/realtor/',NULL,'4',NULL,'/ctrl_Realtor/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','1','1','0','Realtors','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Communities','/communities/',NULL,'5',NULL,'ctrl_Communities/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','1','1','0','Communities','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Open Houses','/open_houses/',NULL,'1','9571','/ctrl_OpenHouse/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','2','1','0','Open Houses','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('Proximity Search','/proximity_search/',NULL,'2','9571','/ctrl_OpenHouse/proximity_search/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','2','1','0','Proximity Search','','','0','0');
	insert into `menu_item` (`name`, `uri`, `img_src`, `order_id`, `parent_id`, `action`, `owner_id`, `default_child_id`, `blurb`, `blurb_img_src`, `cms_page_id`, `rich_content_id`, `rich_content_owner`, `rich_content_owner_type`, `cms_owner_flag`, `hide_flag`, `inherited_from`, `inherited_source`, `receive_updates`, `has_children`, `height`, `can_be_inherited`, `can_be_altered`, `title_tag`, `meta_keywords`, `meta_description`, `seo_prepend`, `version_number`) values('News','/news/',NULL,'1','9572','/ctrl_News/','33',NULL,'',NULL,NULL,NULL,'0',NULL,'0','0','0',NULL,'0','0','2','1','0','News','','','0','0');

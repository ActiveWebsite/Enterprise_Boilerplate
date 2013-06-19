#Web User Account

The LESS for this view is in `client_side/less/web_user_account/web_user_account.less`

Make sure you copy ALL of these files into your new client so everything works correctly.

##Giving The Account A Custom Name

First Get the companies current configs from the database:
	
	select * from enterprise.company_config where company_id=<company_id>;

Set/Modify the config for the Account Brand Name 
	
	company_id = <company_id>
	config_type_id = 22
	config_type_value = Super Awesome Account Area
#Open House

To setup an open house view simply add the `index.view.tpl` file.

The menu item should have and action of `/ctrl_OpenHouse/`

LESS for this view is located in `client_side/less/search/open_house_search.less`

We recommend that you use the override in the boilerplate for `actions/ctrl_OpenHouse.action.php` to get the open house dates list.

#Proximity Search

The menu item should have and action of `/ctrl_OpenHouse/proximity_search/`

LESS for this view is located in `client_side/less/search/proximity_search.less`

Make sure you setup the clients default locations. This can be done in the admin panel. > company > company_settings > Points of Interest

*[Proximity Search Documentation](http://boojlabs.activewebsite.com/documentation/view/76)
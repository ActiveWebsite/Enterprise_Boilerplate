<?
loadAction( "BASE_ctrl_Content" );

abstract class ctrl_Content extends BASE_ctrl_Content {
    
    protected function hasAdditionalHeaderArgs()
    {
		return true;
	}
	
	protected function getAdditionalHeaderArgs($tpl_args)
    {
		$jquery_output = "\t<!-- BEGIN JAVASCRIPT HEADER -->\n";
		$jquery_output .= "\t<script src=\"/libs/booj-strap/lib/jquery.min.js\"></script>\n";
		$jquery_output .= "\t<script>jQuery.noConflict();</script>\n";
		
		$jquery_libs = array();
			$jquery_libs[] = "/js/jqueryui/components/core.min.js";
			$jquery_libs[] = "/js/jqueryui/components/position.min.js";
			$jquery_libs[] = "/js/validation/jquery.validate.min.js";
			$jquery_libs[] = "/js/fancy_box/jquery.fancybox-2.1.4.pack.js";
			$jquery_libs[] = "/js/lib/jquery.hoverIntent.minified.js";
			$jquery_libs[] = "/js/tabs/jquery.jtabs.min.js";
			$jquery_libs[] = "/js/menus/jquery.boojstrapDropdownNavigation.min.js";
			$jquery_libs[] = "/js/lib/jquery.openid.js";
		
		if (!empty($jquery_libs)) {
			$jquery_output .= "\t<script src=\"/js/buildlist.js?scripts=" . implode(',', $jquery_libs) . "\"></script>\n";
		}

		// set up the global booj object and add any configs here.
		if (defined('REST_API_KEY')) {
			$jquery_output .= "\n\t<script>window.booj={application_key:'" . REST_API_KEY . "'};</script>\n";
		}

		$jquery_output .= "\t<!-- END JAVASCRIPT HEADER -->";

		$tpl_args['JQUERY_HEADER'] = $jquery_output;

		return $tpl_args;
	}
    
	protected function prefilter()
	{
		parent::prefilter();
		
		// create some persistence variables
		loadModel( "/cms/MenuItem" );
		$this->elements['FULL_SITE_MENU'] = MenuItem::GetFullMenuForUser( SwitchBoard::$siteOwner->get_site_owner(), array( $this, '__full_menu_items_formatter' ) );
		if( !isset($this->elements['TOP_LEVEL_PERSISTENCE_URI'] )) $this->elements['TOP_LEVEL_PERSISTENCE_URI'] = null;
		if( !isset($this->elements['TOP_LEVEL_PERSISTENCE_NAME'] )) $this->elements['TOP_LEVEL_PERSISTENCE_NAME'] = null;
		if( !isset($this->elements['SECOND_LEVEL_PERSISTENCE_URI'] )) $this->elements['SECOND_LEVEL_PERSISTENCE_URI'] = null;
		if( !isset($this->elements['SECOND_LEVEL_PERSISTENCE_NAME'] )) $this->elements['SECOND_LEVEL_PERSISTENCE_NAME'] = null;
		
		// add additional action urls
		$this->elements['ACTION_URLS']['office'] = SwitchBoard::ReverseParseAlias("ctrl_Office") . '/';
	}

	public function __full_menu_items_formatter( $menu_items )
	{
		$menu_array = array();
		foreach( $menu_items as $menu_node ){
			if ( $this->cms_page instanceof MenuItem && $this->cms_page->parent_id == $menu_node['parent']->id) {
				$this->elements['TOP_LEVEL_PERSISTENCE_URI'] = $menu_node['parent']->uri;
				$this->elements['TOP_LEVEL_PERSISTENCE_NAME'] = $menu_node['parent']->name;
				$this->elements['SECOND_LEVEL_PERSISTENCE_URI'] = $this->cms_page->uri;
				$this->elements['SECOND_LEVEL_PERSISTENCE_NAME'] = $this->cms_page->name;
			}
			
			if( !$menu_node['parent']->is_hidden() ) {
				$children = array();
				foreach( $menu_node['children'] as $child_item ){
					if ( is_array( $child_item ) ) {
						//  Set ELEMENTS flag for top level nav if we're on a third level item
						if ( $this->cms_page instanceof MenuItem && $this->cms_page->parent_id == $child_item['parent']->id) {
							
							$this->elements['TOP_LEVEL_PERSISTENCE_URI'] = $menu_node['parent']->uri;
							$this->elements['TOP_LEVEL_PERSISTENCE_NAME'] = $menu_node['parent']->name;
							$this->elements['SECOND_LEVEL_PERSISTENCE_URI'] = $child_item['parent']->uri;
							$this->elements['SECOND_LEVEL_PERSISTENCE_NAME'] = $child_item['parent']->name;
						}
						if ( $child_item['parent'] instanceof MenuItem && !$child_item['parent']->is_hidden() ) {
							$children[ $child_item['parent']->uri ] = $child_item['parent']->name;
						}
					} else {
						if( !$child_item->is_hidden() ) {
							$children[ $child_item->uri ] = $child_item->name;
						}
					}
				}
				$menu_array[ $menu_node['parent']->uri ] = $children;
			}
		}
		
		
		// Load the community_list for the community menu
		/*
		loadModel("/entities/Community");
		$site_owner = SwitchBoard::$siteOwner->get_site_owner();
		$url_prepender = SwitchBoard::ReverseParseAlias("ctrl_Communities");
		$this->elements['ACTION_URLS']['communities'] = $url_prepender . "/";
		$community_list =  Community::GetByOwner($site_owner);
		if( empty( $community_list ) ) {
			$company = Company::GetCurrentCompany();
			$community_list = Community::GetByOwner( $company, 'lazy' );
		}
		foreach($community_list as $community){
			$menu_array['community_list'][$url_prepender . "/" . $community->rebrand] = $community->name;
		}
		*/	
			
		// return the menu
		return $menu_array;
	}
}
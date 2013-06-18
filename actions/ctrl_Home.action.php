<?
loadAction( "BASE_ctrl_Home" );

class ctrl_Home extends BASE_ctrl_Home {
	/** 
	 * Override so we don't load any components on the page
	 */
	protected function __default()
	{
		loadModel('search/Search');
		$args = func_get_args();
		$this->elements['PAGE_SIDEBARS']['default'] = null;
		$tpl_args = array(
			'property_count' => Search::TotalPropertyCount(),
		);
		$renderer = $this->getSmarty();
		if ( self::$isMobile ) {
			$this->layout = getView('site', 'mobile', 'tpl');
			$renderer->render(array(get_class($this->INT), "index.mobile"), $tpl_args);
		} else {
			$renderer->render(array(get_class($this->INT), "index"), $tpl_args);
		}
	}
	
	/** 
	 * Override so we don't load any components on the page
	 */
	protected function __rebrand_realtor($view)
	{
		$args = func_get_args();
		$renderer = $this->getSmarty();
		$this->elements['PAGE_SIDEBARS']['default'] = null;
		$this->elements['SEO_ENGINE_OPTIMIZER']->SetPageTitle( SwitchBoard::$siteOwner->get_site_owner()->get_name() );
		$tpl_args = array();
		if ( self::$isMobile ) {
			$this->layout = getView('site', 'mobile', 'tpl');
			$renderer->render(array(get_class($this->INT), "realtor.mobile"), $tpl_args);
		} else {
			$renderer->render($view, $tpl_args);
		}
	}
}
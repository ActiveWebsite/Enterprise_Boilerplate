<?
loadAction( "BASE_ctrl_Home" );

class ctrl_Home extends BASE_ctrl_Home {
	/** 
	 * Override so we don't load any components on the page
	 */
	protected function __default()
	{
		
		$this->elements['PAGE_SIDEBARS']['default'] = null;
		$tpl_args = array();
		$renderer = $this->getSmarty();

		if (self::$isMobile) {
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
		
		$this->elements['PAGE_SIDEBARS']['default'] = null;
		$this->elements['SEO_ENGINE_OPTIMIZER']->SetPageTitle(SwitchBoard::$siteOwner->get_site_owner()->get_name());
		$tpl_args = array();
		$renderer = $this->getSmarty();
		
		if (self::$isMobile) {
			$this->layout = getView('site', 'mobile', 'tpl');
			$renderer->render(array(get_class($this->INT), "realtor.mobile"), $tpl_args);
		} else {
			$renderer->render($view, $tpl_args);
		}
	}

	/** 
	 * Override so we don't load any components on the page
	 */
	protected function __rebrand_office($view)
	{
		$this->elements['PAGE_SIDEBARS']['default'] = null;
		$this->elements['SEO_ENGINE_OPTIMIZER']->SetPageTitle(SwitchBoard::$siteOwner->get_site_owner()->get_name());
		$tpl_args = array();
		$renderer = $this->getSmarty();
		
		if (self::$isMobile) {
			$this->layout = getView('site', 'mobile', 'tpl');
			$renderer->render(array(get_class($this->INT), "office.mobile"), $tpl_args);
		} else {
			$renderer->render($view, $tpl_args);		
		}
	}
}
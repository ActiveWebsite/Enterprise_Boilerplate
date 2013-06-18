<?
loadAction("BASE_ctrl_PropertyComparison");
class ctrl_PropertyComparison extends BASE_ctrl_PropertyComparison {
	public function __construct( array $overrides=null ){
		$this->layout = defined('SITE_LAYOUT')? SITE_LAYOUT : null;
		$this->INT = $this;
	}

	public function index() {
		$args = func_get_args();		
		$tpl_args = call_user_func_array(array($this, 'compare_by_session'), $args);
		$this->elements['USE_FULL_LAYOUT_FLAG'] = true;
		$renderer = $this->getSmarty();
		$renderer->render( array(get_class($this->INT), "index"), $tpl_args);
	}
}
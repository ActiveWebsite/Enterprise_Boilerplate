<?
loadAction("BASE_ctrl_Property");
class ctrl_Property extends BASE_ctrl_Property{

	protected function addAdditionalArgs( $tpl_args ){
		// get recent properties
		if ($account_user = EntityAggregator::GetCurrent()->getEntity(EntityType::ACCOUNT_USER)) {

		} else {
			$account_user = EntityAggregator::GetCurrent()->getEntity(EntityType::ANONYMOUS_USER);
		}
		$recent_properties = $account_user->getRecentItemsByType(RecentItemsTypes::PROPERTY)->getItems();
		$tpl_args['recent_properties'] = array();
		foreach ($recent_properties as $recent_prop) {
			$recent_prop->load_info(PropertyLoadLevel::IDX_SUMMARY);
			$tpl_args['recent_properties'][] = $recent_prop->getAsDictionary();
		}

		// get property notes
		loadModel( '/entities/EntityAggregator' );
		if( $account_user instanceof AccountUser ){
			loadModel( '/property/FavoriteProperty' );
			try{
				$favProp = new FavoriteProperty( $account_user->get_id(), $tpl_args['company_property_id'] );
				$tpl_args['enterprise_account_note'] = $favProp->notes;
			}
			catch( Exception $e ){
				//Not a fav property.
			}
		}

		return $tpl_args;
	}
}
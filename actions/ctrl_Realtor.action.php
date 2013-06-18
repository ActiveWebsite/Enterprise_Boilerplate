<?
loadAction( "BASE_ctrl_Realtor" );
/**
 * search controls
 * 
 * @permission ACO="Usage"->"View" AXO="website"->"public"
 *
 */
class ctrl_Realtor extends BASE_ctrl_Realtor{
	protected function __parse_filters()
	{
		$filters = parent::__parse_filters();

		if( isset($_REQUEST['designation']) && $_REQUEST['designation'] != '' ) {
			$filters['realtor_info']['Designations'] = $_REQUEST['designation'];
		}

		return $filters;
	}

	protected function __get_additional_filter_args()
	{
		loadModel("entities/info_lists/RealtorInformation");
		return array(
			'designations' => explode('`,`', trim(RealtorInformation::GetInfoValuesByName('Designations'), '`')),
			'spoken_languages' => explode('`,`', trim(RealtorInformation::GetInfoValuesByName('Spoken Languages'), '`')),
		);
	}

	protected function getDynamicDictionaryDef()
	{
		$deff = array(
			'id',
			'title',
			'rebrand_code',
			'pic_url',
			'parent',
			'name',
			'first_name',
			'last_name',
			'address',
			'Spoken Languages',
			'Designations',
		);
		return $deff;
	}

	protected function ajaxRealtorDynDictionaryDef()
	{
		return array(
			'name',
			'first_name',
			'last_name',
			'parent',
			'address',
			'pic_url',
			'title',
			'Spoken Languages',
			'Designations',
		);
	}

	protected function has_dynamic_realtor_info_sections()
	{
		return true;
	}
	
	protected function has_dynamic_team_info_sections()
	{
		return true;
	}

	protected function get_dynamic_realtor_info_array( $realtor )
	{
		/* get testimonials ordered by date new to old */
		$test_dict = array();
		loadModel( "/entities/testimonials/EntityTestimonial" );
		try {
		   $testimonials = EntityTestimonial::GetEntityTestimonialsOrderByDateAsc($realtor);
		} catch(Exception $e) {
		   $testimonials = null;
		}
		foreach( $testimonials as $testimonial ){
			$test_dict[] = $testimonial->getAsDictionary();
		}
		$testimonial_dicts = array_reverse($test_dict);
	

		/* get agent listings */
		loadModel( "/search/Search" );
		$properties = array();
		$search = new Search();
		$search->addTerm( 'realtor', $realtor->rebrand_code );
		$search->addOrderBy( 'list_price', false);
		$props = $search->run(0, 7);
		$tmp_properties = Property::GetPropertiesFromIdArray($props, PropertyLoadLevel::IDX_SUMMARY, true);
		foreach( $props as $prop ) {
			try{
				$property = $tmp_properties[$prop];
				// add open house
				// $property->open_house = $property->getAllDates( true );
				$temp_pic = $property->get_first_pic();
				if ( is_object( $temp_pic ) ){
					$property->photo = $temp_pic->getUrl();
				} else {
					$property->photo = false;
				}
				$properties[] = $property;
			}
			catch( Exception $e ) {}
		}
		unset($tmp_properties);


		/* get agent sold listings */
		$sold_properties = array();
		$sold_search = new Search();
		$sold_search->addTerm( 'buyer_seller', $realtor->rebrand_code );
		$sold_search->addFilter( SearchFilter::SOLD );
		$sold_search->addOrderBy( 'list_price', false);
		$sold_props = $sold_search->run(0, 7);
		//set idx view to the sold table to get the sold prop info
		IDX::Set_IDX_View_Name( IDX::SOLD );
		$tmp_properties = Property::GetPropertiesFromIdArray($sold_props, PropertyLoadLevel::IDX_SUMMARY, true);
		foreach( $sold_props as $sold_prop ) {
			try{
				$property = $tmp_properties[$sold_prop];
				$temp_pic = $property->get_first_pic();
				if ( is_object( $temp_pic ) ){
					$property->photo = $temp_pic->getUrl();
				} else {
					$property->photo = false;
				}
			}
			catch( Exception $e ) {}
		}
		unset($tmp_properties);

		//reset back to normal idx view
		IDX::Set_IDX_View_Name( IDX::MATERIALIZED );

		
		$tpl_args = array(
			'testimonials' => $testimonial_dicts,
			'properties' => $properties,
			'sold_properties' => $sold_properties,
		);
		return $tpl_args;
	}

	protected function get_additional_team_bio_page_info( $team )
	{
		/* code to get testimonials ordered by date new to old */
 		loadModel( "/entities/testimonials/EntityTestimonial" );
		//$testimonials = EntityTestimonial::GetEntityTeamTestimonialsWithSubTestimonials( $team  );
		$testimonials = EntityTestimonial::GetEntityTestimonialsOrderByOrder( $team );
		$testimonial_dicts = array();
		foreach( $testimonials as $testimonial ) {
			$testimonial_dicts[] = $testimonial->getAsDictionary();
		}
		
		/* get team listings */
		loadModel( "/search/Search" );
		$properties = array();
		$search = new Search();
		$search->addTerm( 'realtor', $team->rebrand_code );
		$search->addOrderBy( 'list_price', false);
		$props = $search->run( 0, 7 );
		$tmp_properties = Property::GetPropertiesFromIdArray($props, PropertyLoadLevel::IDX_SUMMARY, true);
		foreach( $props as $prop ) {
			try{
				$property = $tmp_properties[$prop];
				// add open house
				// $property->open_house = $property->getAllDates( true );
				$temp_pic = $property->get_first_pic();
				if ( is_object( $temp_pic ) ){
					$property->photo = $temp_pic->getUrl();
				} else {
					$property->photo = false;
				}
				$properties[] = $property;
			}
			catch( Exception $e ) {}
		}
		unset($tmp_properties);
		

		/* get team sold listings */
		$sold_properties = array();
		$sold_search = new Search();
		$sold_search->addTerm( 'buyer_seller', $team->rebrand_code );
		$sold_search->addFilter( SearchFilter::SOLD );
		$sold_search->addOrderBy( 'list_price', false);
		$sold_props = $sold_search->run( 0, 3);
		//set idx view to the sold table to get the sold prop info
		IDX::Set_IDX_View_Name( IDX::SOLD );
		$tmp_properties = Property::GetPropertiesFromIdArray($sold_props, PropertyLoadLevel::IDX_SUMMARY, true);

		foreach( $sold_props as $sold_prop ) {
			try{
				$property = $tmp_properties[$sold_prop];
				$temp_pic = $property->get_first_pic();
				if ( is_object( $temp_pic ) ){
					$property->photo = $temp_pic->getUrl();
				} else {
					$property->photo = false;
				}
				$sold_properties[] = $property;
			}
			catch( Exception $e ) {}
		}
		unset($tmp_properties);

		//reset back to normal idx view
		IDX::Set_IDX_View_Name( IDX::MATERIALIZED );

		$tpl_args = array(
			'testimonials' => $testimonial_dicts,
			'properties' => $properties,
			'sold_properties' => $sold_properties,
		);
		return $tpl_args;
 	}
}
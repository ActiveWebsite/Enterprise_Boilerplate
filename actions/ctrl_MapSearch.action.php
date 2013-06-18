<?
loadAction( "BASE_ctrl_MapSearch" );
/**
 * map search controls
 * 
 * @permission ACO="Usage"->"View" AXO="website"->"public"
 *
 */
class ctrl_MapSearch extends BASE_ctrl_MapSearch{
	protected function tour_custom_titles()
	{
		return array(
			"left_column_title" => "Driving Tour",
			"right_column_title" => "Driving Directions",
			"print_title" => "Driving Tour &amp; Driving Directions",
			"open_blurb" => ""
		);
	}
}
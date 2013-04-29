<?
loadAction( "BASE_ctrl_Search" );
/**
 * search controls
 * 
 * @permission ACO="Usage"->"View" AXO="website"->"public"
 *
 */
class ctrl_Search extends BASE_ctrl_Search{
    /**
    * @return boolean Return true to use the new search narrowers v2 method.
    */
    protected function useSearchNarrowersV2() {
        return true;
    }
    /**
     * @return boolean Return true to add realors and teams. 
     */
    protected function getRealtorsTeams() {
        return true;
    }

    /**
     * @return array returns modifed array with overrides for the client
     */
     protected function getAdditionalSearchNarrowerV2Args($search_narrowers = array()) {
        //build out open house dates
        $this->elements['open_house_dates'] = $this->getOpenHouseDates();                       
        
        return $search_narrowers;
    }

    /**
     * Include this override if you need to add additional variables.
     * @return array returns modifed array
     */
    public function extraSearchFormArguments() {
        $temp = array();
        loadModel('entities/flyweight_entities/LiteRealtor');
        loadModel('entities/flyweight_entities/LiteEntityTeam');
        
        $realtors = LiteRealtor::getRealtorsForCompanyFrontEnd();
        $teams = LiteEntityTeam::getTeamsForCompanyFrontEnd();
        
        $temp['realtors'] = $realtors;
        $temp['teams'] = $teams;
        
        //build out open house dates		
        $temp['open_house_dates'] = $this->getOpenHouseDates();
        
        return $temp;
    }
}
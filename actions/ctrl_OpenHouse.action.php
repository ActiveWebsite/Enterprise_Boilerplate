<?php

/**
 * Open House
 *
 * @permission ACO="Usage"->"View" AXO="website"->"public"
 *
 */
loadAction( "BASE_ctrl_OpenHouse" );
class ctrl_OpenHouse extends BASE_ctrl_OpenHouse {
    protected function getClientSpecificArgs()
    {
        //build out open house dates        
        $date_list = array();
        $date_list['today'] = date("l");
        if(date("l") == "Saturday"){
            $sat_time = time();
            $date_list['sat_time'] = $sat_time;
        }else{
            $sat_time = strtotime("next saturday");
            $date_list['sat_time'] = $sat_time;
        }
        if(date("l") == "Sunday"){
            $sun_time = time();
            $date_list['sun_time'] = $sun_time;
        }else{
            $sun_time = strtotime("next sunday");
            $date_list['sun_time'] = $sun_time;
        }
        if(date("l") !== "Saturday" && date("l") !== "Sunday"){
            $week_start = time();
            $week_end = strtotime("this sunday");
        } else {
            $week_start = strtotime('next monday');
            $week_end = strtotime("+7 day", $week_start);
        }
        $date_list['week_start'] = $week_start;
        $date_list['week_end'] = $week_end;
        $date_list['saturday_check'] = date("Y-m-d", $sat_time)."|".date("Y-m-d", $sat_time);
        $date_list['sunday_check'] = date("Y-m-d", $sun_time)."|".date("Y-m-d", $sun_time);
        $date_list['weekend_check'] =  date("Y-m-d", $sat_time)."|".date("Y-m-d", $sun_time);
        $date_list['week_check'] = date("Y-m-d", $week_start)."|".date("Y-m-d", $week_end);
        return $date_list;          
    }
}
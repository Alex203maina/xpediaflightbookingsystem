<?php

require_once 'db.php';

class airline extends db{
    function checkAirline($airlineid, $airlinename){
        $sql = "CALL `sp_checkairline`({$airlineid},'{$airlinename}')";
        return $this->getData($sql)->rowCount();

    }

    // save airline
    function saveAirline($airlineid,$airlinename,$airlinelogo,$homecountryid){
        // check if airline name already exists
        if($this->checkAirline($airlineid, $airlinename)){
            return ["status" => "error", "message" => "Airline Name already exists."];
        }else{
        $sql = "CALL `sp_savesaveairline`({$airlineid},'{$airlinename}','{$airlinelogo}',{$homecountryid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Airline saved successfully."];
        }
    }

    // get airlines
    function getAirlines(){
        $sql = "CALL `sp_getairlines`()";
        return $this->getJSON($sql);
    }
    // filter airlines
    function filterAirline($airlinename, $countryname){
        $sql = "CALL `sp_filterairlines`('{$airlinename}', '{$countryname}')";
        return $this->getJSON($sql);
    }
    // get airline details
    function getAirlineDetails($airlineid){
        $sql = "CALL `sp_airlinedetails`({$airlineid})";
        return $this->getJSON($sql);
    }
    // delete airline
    function deleteAirline($airlineid){
        $sql = "CALL `sp_deleteairline`({$airlineid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Airline deleted successfully."];
    }


}
?>
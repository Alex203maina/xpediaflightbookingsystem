<?php
    require_once('db.php');

    class airport extends db{

        // check if airport name or code already exists
        function checkAirport($airportid, $airportname, $airportcode){
            $sql  = "CALL `sp_checkairport`({$airportid}, '{$airportname}', '{$airportcode}')";
            return $this->getData($sql)->rowCount();
        }

        // function to save airport
        function saveAirport($airportid,$airportname,$airportcode,$cityid){
            // check if airport name or code already exists
            if($this->checkAirport($airportid, $airportname, $airportcode)){
                return ["status" => "error", "message" => "Airport Name or Code already exists."];
            }else{
                // save airport
            $sql = "CALL `sp_savesaveairport`({$airportid} ,'{$airportname}','{$airportcode}',{$cityid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Airport saved successfully."];
            }
        }
        // get airports
        function getAirports(){
            $sql = "CALL `sp_getairport`()";
            return $this->getJSON($sql);
        }

        // filter airports
        function filterAirports($airportname, $airportcode, $cityname, $countryname){
            $sql = "CALL `sp_filterairport`('{$airportname}', '{$airportcode}', '{$cityname}', '{$countryname}')";
            return $this->getJSON($sql);
        }
        // get airport details
        function getAirportDetails($airportid){
            $sql = "CALL `sp_getairportdetails`({$airportid})";
            return $this->getJSON($sql);
        }

        // delete airport
        function deleteAirport($airportid){
            $sql = "CALL `sp_deleteairport`({$airportid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Airport deleted successfully."];
        }
    }

?>
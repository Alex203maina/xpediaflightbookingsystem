<?php
    require_once ('db.php');

    class city extends db{

        // check if city name exists
        function checkCity($cityid, $cityname){
            $sql = "CALL `sp_checkcity`({$cityid},'{$cityname}')";
            return $this->getData($sql)->rowCount();
        }

        // save city
        function saveCity($cityid, $cityname, $countryid){
            // check if city name exists
            if($this->checkCity($cityid, $cityname)){
                return ["status" => "error", "message" => "City Name already exists."];
            }else{
                $sql = "CALL `sp_savecity`({$cityid},'{$cityname}', {$countryid})";
                $this->getData($sql);
                return ["status" => "success", "message" => "City saved successfully."];
            }
        }
        // get cities
        function getCities(){
            $sql = "CALL `sp_getcities`()";
            return $this->getJSON($sql);
        }

        // filter cities
        function filterCities($countryname, $cityname){
            $sql = "CALL `sp_filtercities`('{$countryname}','{$cityname}')";
            return $this->getJSON($sql);
        }
        // get city details
        function getCityDetails($cityid){
            $sql = "CALL `sp_getcitydetails`({$cityid})";
            return $this->getJSON($sql);
        }
        // delete city
        function deleteCity($cityid){
            $sql = "CALL `sp_deletecity`({$cityid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "City deleted successfully."];
        }
    }
?>
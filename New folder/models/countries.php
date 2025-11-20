<?php
    require_once 'db.php';
    // country class
    class country extends db{
        function checkCountry($countryid, $countryname){
            $sql = "CALL `sp_checkcountry`({$countryid}, '{$countryname}')";
            return $this->getData($sql)->rowCount();
        }

        // function to save country
        function saveCountry($countryid,$countryname){
            if($this->checkCountry($countryid, $countryname) ){
                return ["status" => "exists", "message" => "Country Name already exists."];
            }else{
            $sql = "CALL `sp_savecountry`({$countryid},'{$countryname}')";
            $this->getData($sql);
            return ["status" => "success", "message" => "Country saved successfully."];
            }
        }
        // get countries
        function getCountries(){
            $sql = "CALL `sp_getcountries`()";
            return $this->getJSON($sql);
        // get country details
        }
        function getCountryDetails($countryid){
            $sql = "CALL `sp_getcountrydetails`({$countryid})";
            return $this->getJSON($sql);
        }
        // delete country
        function deleteCountry($countryid){
            $sql = "CALL `sp_deletecountry`({$countryid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Country deleted successfully."];
        }
    
    }
?>
<?php
    require_once("db.php");

    class flightclass extends db{
        // check flight class if it exists
        function checkFlightClass($flightid, $bookingclassid){
            $sql = "CALL `sp_checkflightclass`({$flightid}, {$bookingclassid})";
            return $this->getData($sql)->rowCount();
        }

        // save flight class
        function saveFlightClass($flightclassid, $flightid, $bookingclassid, $noofseats, $price, $currencyid){
            if($this->checkFlightClass($flightid, $bookingclassid)){
                return ["status" => "error", "message" => "Flight Class already exists."];
            }else{
                $sql = "CALL `sp_saveflightclasses`({$flightclassid}, {$flightid}, {$bookingclassid}, {$noofseats}, {$price}, {$currencyid})";
                $this->getData($sql);
                return ["status" => "success", "message" => "Flight Class saved successfully."];
            }
        }

        // get flight classes
        function getFlightClasses(){
            $sql = "CALL `sp_getflightclasses`()";
            return $this->getJSON($sql);
        }

        // get flight class details
        function getFlightClassDetails($flightclassid){
            $sql = "CALL `sp_getflightclassdetails`({$flightclassid})";
            return $this->getJSON($sql);
        }
        // flight class
        function deleteFlightClass($flightclassid){
            $sql = "CALL `sp_deleteflightclasses`({$flightclassid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Flight Class deleted successfully."];
        }

        // filter flight classes
        function filterFlightClasses($flightid, $classname){
            $sql = "CALL `sp_filterflightclasses`($flightid,'{$classname}')";
            return $this->getJSON($sql);
        }
    }


?>
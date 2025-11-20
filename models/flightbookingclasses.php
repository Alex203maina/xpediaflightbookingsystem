<?php
    require_once("db.php");

    class flightbookingclasses extends db{

        // function to check booking class


        // function to save booking class
        function saveFlightBookingClass($flightbookingclassid, $flightid, $flightbookingid, $bookingclassid, $noofseats, $price, $currencyid){
            $sql = "CALL `sp_saveflightbookingclasses`({$flightbookingclassid}, {$flightid}, {$flightbookingid},{$bookingclassid}, {$noofseats}, {$price}, {$currencyid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Flight Booking Class saved successfully."];
        }


        // function get booking classes
        function getFlightBookingClasses(){
            $sql = "CALL `sp_getflightbookingclass`()";
            return $this->getJson($sql);
        }

        // function get booking class details
        function getFlightBookingClassDetails($flightbookingclassid){
            $sql = "CALL`sp_getflightbookingclassdetails`({$flightbookingclassid})";
            return $this->getJson($sql);
        }

        // function to filter booking classes
        function filterFlightBookingClasses($flightbookingid){
            $sql = "CALL `sp_filterflightbookingclasses`({$flightbookingid})";
            return $this->getJson($sql);
        }

        // delete booking class
    }


?>
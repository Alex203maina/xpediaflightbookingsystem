<?php
    require_once("db.php");

    class flightbookingpassenger extends db{

        // function to save flight booking passenger
        function saveFlightBookingPassenger($passengerid, $bookingclassid, $documentid, $travelertypeid,$iddocumentno, $firstname, $middlename, $lastname, $dateofbirth, $gender, $nationality, $flightbookingclassid){
            $sql = "CALL `sp_saveflightbookingpassangers`({$passengerid}, {$bookingclassid}, {$documentid}, {$travelertypeid},'{$iddocumentno}', '{$firstname}', '{$middlename}', '{$lastname}', '{$dateofbirth}', '{$gender}','{$nationality}', {$flightbookingclassid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Flight Booking Passenger saved successfully."];
        }


        // function get flight booking passengers
        function getFlightBookingPassengers(){
            $sql = "CALL `sp_getflightbookingpassengers`()";
            return $this->getJson($sql);
        }

        // function get flight booking passenger details
        function getFlightBookingPassengerDetails($passengerid){
            $sql = "CALL`sp_getflightbookingpassangerdetails`({$passengerid})";
            return $this->getJson($sql);
        }
        // function to filter flight booking passengers
        function filterFlightBookingPassengers($passengerid, $flightbookingclassid, $bookingclassid, $firstname, $lastname, $dob, $gender, $nationality, $iddocumentno, $flightno, $travelertypeid){
            $sql = "CALL `sp_filterbookingpassengers`({$passengerid},{$flightbookingclassid},{$bookingclassid},'{$firstname}','{$lastname}','{$dob}','{$gender}','{$nationality}','{$iddocumentno}','{$flightno}',{$travelertypeid})";
            return $this->getJson($sql);

        }


        // delete flight booking passenger
        function deleteFlightBookingPassenger($passengerid){
            $sql = "CALL `sp_deleteflightbookingpassenger`({$passengerid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Flight Booking Passenger deleted successfully."];
        }


    }


?>
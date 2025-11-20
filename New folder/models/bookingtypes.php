<?php 
    require_once('db.php');

    class bookingtype extends db{
        //  check if booking type name already exists
        function checkBookingType($typeid, $typename){
            $sql = "CALL `sp_checkbookingtype`({$typeid},'{$typename}')";
            return $this->getData($sql)->rowCount();
        }

        // save booking type
        function saveBookingType($typeid, $typename){
            // check  if booking type name already exists
            if($this->checkBookingType($typeid, $typename)){
                return ["status" => "error", "message" => "Booking Type Name already exists."];
            }else{
                $sql = "CALL `sp_savebookingtypes`({$typeid},'{$typename}')";
                $this->getData($sql);
                return ["status" => "success", "message" => "Booking Type saved successfully."];
            }
        }

        // get booking types
        function getBookingTypes(){
            $sql = "CALL `sp_getbookingtypes`()";
            return $this->getJSON($sql);
        }

        // get booking type details
        function getBookingTypeDetails($typeid){
            $sql = "CALL `sp_getbookingdetails`({$typeid})";
            return $this->getJSON($sql);
        }
        // delete booking type
        function deleteBookingType($typeid){
            $sql = "CALL `sp_deletebookingtypes`({$typeid})";
            $this->getData($sql);
            return ["status" => "success", "message" => "Booking Type deleted successfully."];
        }
    }

?>
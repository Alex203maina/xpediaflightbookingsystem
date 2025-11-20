<?php
require_once ('db.php');

class bookingclass extends db{

    //check if booking class name already exists
    function checkBookingClass($classid, $classname){
        $sql = "CALL `sp_checkbookingclasses`({$classid},'{$classname}')";
        return $this->getData($sql)->rowCount();

    }

    // save booking class
    function saveBookingClass($classid, $classname){
        // check if booking class name already exists
        if($this->checkBookingClass($classid, $classname)){
            return ["status" => "error", "message" => "Booking Class Name already exists."];
        }else{
            $sql = "CALL `sp_savebookingclasses`({$classid},'{$classname}')";
            $this->getData($sql);
            return ["status" => "success", "message" => "Booking Class saved successfully."];
        }
    }
    // function to get booking class
    function getBookingClasses(){
        $sql =  "CALL `sp_getbookingclass`()";
        return $this->getJSON($sql);
    }

    // get booking class details
    function getBookingClassDetails($classid){
        $sql = "CALL `sp_getbookingclassdetails`({$classid})";
        return $this->getJSON($sql);
    }
    // delete booking class
    function deleteBookingClass($classid){
        $sql = "CALL `sp_deletebookingclass`({$classid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Booking Class deleted successfully."];
    }
}


?>
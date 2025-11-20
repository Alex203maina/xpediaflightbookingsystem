<?php
    require_once("../models/bookingclasses.php");

    $bookingclass = new bookingclass();

    // save booking class
    if(isset($_POST['savebookingclass'])){
        $classid=$_POST['classid'];
        $classname=$_POST['classname'];
        $response=$bookingclass->saveBookingClass($classid, $classname);
        echo json_encode($response);
    }

    // get booking classes
    if(isset($_GET['getbookingclasses'])){
        $response=$bookingclass->getBookingClasses();
        echo $response;
    }

    // get booking class details
    if(isset($_GET['getbookingclassdetails'])){
        $classid=$_GET['classid'];
        $response=$bookingclass->getBookingClassDetails($classid);
        echo $response;
    }

    // delete booking class
    if(isset($_POST['deletebookingclass'])){
        $classid=$_POST['classid'];
        $response=$bookingclass->deleteBookingClass($classid);
        echo json_encode($response);
    }

?>
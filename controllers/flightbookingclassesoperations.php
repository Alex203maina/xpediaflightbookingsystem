<?php
    require_once("../models/flightbookingclasses.php");


    $flightbookingclass = new flightbookingclasses();

    // save flight booking class
    if(isset($_POST['saveflightbookingclass'])){
        $flightbookingclassid=$_POST['flightbookingclassid'];
        $flightid = $_POST['flightid'];
        $flightbookingid=$_POST['flightbookingid'];
        $bookingclassid=$_POST['bookingclassid'];
        $noofseats=$_POST['noofseats'];
        $price=$_POST['price'];
        $currencyid=$_POST['currencyid'];
        $response=$flightbookingclass->saveFlightBookingClass($flightbookingclassid, $flightid, $flightbookingid, $bookingclassid, $noofseats, $price, $currencyid);
        echo json_encode($response);
    }

    // get flight booking classes
    if(isset($_GET['getflightbookingclasses'])){
        echo $flightbookingclass->getFlightBookingClasses();
    }
    
    // get flight booking class details
    if(isset($_GET['getflightbookingclassdetails'])){
        $flightbookingclassid=$_GET['flightbookingclassid'];
        echo $flightbookingclass->getFlightBookingClassDetails($flightbookingclassid);
    }

    // filter booking classes
    if(isset($_GET['filterflightbookingclasses'])){
        $flightbookingid=$_GET['flightbookingid'];
        echo $flightbookingclass->filterFlightBookingClasses($flightbookingid);
    }
?>
<?php
    require_once("../models/flightclasses.php");

    $flightclass = new flightclass();
    // save flight class
    if(isset($_POST['saveflightclass'])){
        $flightclassid=$_POST['flightclassid'];
        $flightid=$_POST['flightid'];
        $bookingclassid=$_POST['bookingclassid'];
        $noofseats=$_POST['noofseats'];
        $price=$_POST['price'];
        $currencyid=$_POST['currencyid'];
        $response=$flightclass->saveFlightClass($flightclassid, $flightid, $bookingclassid, $noofseats, $price, $currencyid);
        echo json_encode($response);
    }

    // get flight classes
    if(isset($_GET['getflightclasses'])){
        echo $flightclass->getFlightClasses();
    }

    // get flight class details
    if(isset($_GET['getflightclassdetails'])){
        $flightclassid=$_GET['flightclassid'];
        echo $flightclass->getFlightClassDetails($flightclassid);
    }

    // delete flight class
    if(isset($_POST['deleteflightclass'])){
        $flightclassid=$_POST['flightclassid'];
        $response=$flightclass->deleteFlightClass($flightclassid);
        echo json_encode($response);
    }

    // filter flight classes
    if(isset($_GET['filterflightclasses'])){
        $flightid=isset($_GET['flightid'])?$_GET['flightid']:'';
        $classname=isset($_GET['classname'])?$_GET['classname']:'';
        echo $flightclass->filterFlightClasses($flightid, $classname);
    }


?>
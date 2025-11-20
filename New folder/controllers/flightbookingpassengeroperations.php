<?php
    require_once("../models/flightbookingpassenger.php");

    $flightbookingpassenger = new flightbookingpassenger();


    // save flight booking passenger
    if(isset($_POST['saveflightbookingpassenger'])){
        $passengerid=$_POST['passengerid'];
        $bookingclassid=$_POST['bookingclassid'];
        $documentid=$_POST['documentid'];
        $travelertypeid=$_POST['travelertypeid'];
        $iddocumentno=$_POST['iddocumentno'];
        $firstname=$_POST['firstname'];
        $middlename=$_POST['middlename'];
        $lastname=$_POST['lastname'];
        $dateofbirth=$_POST['dateofbirth'];
        $gender=$_POST['gender'];
        $nationality=$_POST['nationality'];
        $flightbookingclassid=$_POST['flightbookingclassid'];
        $response=$flightbookingpassenger->saveFlightBookingPassenger($passengerid, $bookingclassid, $documentid, $travelertypeid,$iddocumentno, $firstname, $middlename, $lastname, $dateofbirth, $gender, $nationality, $flightbookingclassid);
        echo json_encode($response);
    };

    // get flight booking passengers
    if(isset($_GET['getflightbookingpassengers'])){
        $response=$flightbookingpassenger->getFlightBookingPassengers();
        echo $response;
    }


    // get flight booking passenger details
    if(isset($_GET['getflightbookingpassengerdetails'])){
        $passengerid=$_GET['passengerid'];
        $response=$flightbookingpassenger->getFlightBookingPassengerDetails($passengerid);
        echo $response;
    }

    // filter flight booking passengers
    if(isset($_GET['filterflightbookingpassengers'])){
        $passengerid=isset($_GET['passengerid'])?$_GET['passengerid']:'';
        $flightbookingclassid=isset($_GET['flightbookingclassid'])?$_GET['flightbookingclassid']:'';
        $bookingclassid=isset($_GET['bookingclassid'])?$_GET['bookingclassid']:'';
        $firstname=isset($_GET['firstname'])?$_GET['firstname']:'';
        $lastname=isset($_GET['lastname'])?$_GET['lastname']:'';
        $dob=isset($_GET['dob'])?$_GET['dob']:'';
        $gender=isset($_GET['gender'])?$_GET['gender']:'';
        $nationality=isset($_GET['nationality'])?$_GET['nationality']:'';
        $iddocumentno=isset($_GET['iddocumentno'])?$_GET['iddocumentno']:'';
        $flightno=isset($_GET['flightno'])?$_GET['flightno']:'';
        $travelertypeid=isset($_GET['travelertypeid'])?$_GET['travelertypeid']:'';
        $response=$flightbookingpassenger->filterFlightBookingPassengers($passengerid, $flightbookingclassid, $bookingclassid, $firstname, $lastname, $dob, $gender, $nationality, $iddocumentno, $flightno, $travelertypeid);
        echo $response;
    }

    // delete flight booking passenger
    if(isset($_POST['deleteflightbookingpassenger'])){
        $passengerid=$_POST['passengerid'];
        $response=$flightbookingpassenger->deleteFlightBookingPassenger($passengerid);
        echo json_encode($response);
    }
?>
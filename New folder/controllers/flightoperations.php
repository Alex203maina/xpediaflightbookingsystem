<?php
    require_once("../models/flights.php");

    $flight = new flight();

    // save flight
// save flight
if (isset($_POST['saveflight'])) {
    $flightid = $_POST['flightid'];
    $flightno = $_POST['flightno'];
    $airlineid = $_POST['airlineid'];
    $departurecityid = $_POST['departurecityid'];
    $departureairportid = $_POST['departureairportid'];
    $destinationcityid = $_POST['destinationcityid'];
    $destinationairportid = $_POST['destinationairportid'];
    $departuretime = $_POST['departuretime'];
    $durationofflight = $_POST['durationofflight'];
    $response = $flight->saveFlight($flightid, $flightno, $airlineid, $departurecityid, $departureairportid, $destinationcityid, $destinationairportid, $departuretime, $durationofflight);
    echo json_encode($response);
}
    // get flights
    if(isset($_GET['getflights'])){
        echo $flight->getFlights();
    }

    // get flight details
    if(isset($_GET['getflightdetails'])){
        $flightid=$_GET['flightid'];
        echo $flight->getFlightDetails($flightid);
    }

    // filter flights
    if(isset($_GET['filterflights'])){
        $airportname=isset($_GET['airportname'])?$_GET['airportname']:'';
        $cityname=isset($_GET['cityname'])?$_GET['cityname']:'';
        $departurecountryname=isset($_GET['departurecountryname'])?$_GET['departurecountryname']:'';
        $destinationcountryname=isset($_GET['destinationcountryname'])?$_GET['destinationcountryname']:'';
        echo $flight->filterFlights($airportname, $cityname, $departurecountryname, $destinationcountryname);}

    // delete flight
    if(isset($_POST['deleteflight'])){
        $flightid=$_POST['flightid'];
        $response=$flight->deleteFlight($flightid);
        echo json_encode($response);
    }


?>
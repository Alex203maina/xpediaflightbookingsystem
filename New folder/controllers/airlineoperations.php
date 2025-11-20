<?php
require_once("../models/airline.php");

$airline = new airline();


// save airline
if(isset($_POST['saveairline'])){
    $airlineid=$_POST['airlineid'];
    $airlinename=$_POST['airlinename'];
    $airlinelogo=$_POST['airlinelogo'];
    $homecountryid=$_POST['homecountryid'];
    $response=$airline->saveAirline($airlineid,$airlinename,$airlinelogo,$homecountryid);
    echo json_encode($response);
}


// get airlines
if(isset($_GET['getairlines'])){
    echo $airline->getAirlines();
}
// function filter airlines
if(isset($_GET['filterairlines'])){
    $airlinename=isset($_GET['airlinename'])?$_GET['airlinename']:'';
    $countryname=isset($_GET['countryname'])?$_GET['countryname']:'';
    echo $airline->filterAirline($airlinename, $countryname);
}


// get airline details
if(isset($_GET['getairlinedetails'])){
    $airlineid=$_GET['airlineid'];
    echo $airline->getAirlineDetails($airlineid);
}

// delete airline
if(isset($_POST['deleteairline'])){
    $airlineid=$_POST['airlineid'];
    $response=$airline->deleteAirline($airlineid);
    echo json_encode($response);
}
?>
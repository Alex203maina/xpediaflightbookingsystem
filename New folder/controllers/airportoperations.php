<?php 
    require_once("../models/airports.php");

    $airport = new airport();

    // save airport

    if(isset($_POST['saveairport'])){
        $airportid=$_POST['airportid'];
        $airportname=$_POST['airportname'];
        $airportcode=$_POST['airportcode'];
        $cityid=$_POST['cityid'];
        $response=$airport->saveAirport($airportid,$airportname,$airportcode,$cityid);
        echo json_encode($response);
    }

    // get airports
    if(isset($_GET['getairports'])){
        echo $airport->getAirports();
    }


    // function filter airports
    if(isset($_GET['filterairports'])){
        $airportname=isset($_GET['airportname'])?$_GET['airportname']:'';
        $airportcode=isset($_GET['airportcode'])?$_GET['airportcode']:'';
        $cityname=isset($_GET['cityname'])?$_GET['cityname']:'';
        $countryname=isset($_GET['countryname'])?$_GET['countryname']:'';
        echo $airport->filterAirports($airportname, $airportcode, $cityname, $countryname);
    }


    // get airport details
    if(isset($_GET['getairportdetails'])){
        $airportid=$_GET['airportid'];
        echo $airport->getAirportDetails($airportid);
    }


    // delete airport
    if(isset($_POST['deleteairport'])){
        $airportid=$_POST['airportid'];
        $response=$airport->deleteAirport($airportid);
        echo json_encode($response);
    }
?>
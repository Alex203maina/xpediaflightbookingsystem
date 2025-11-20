<?php

    require_once("../models/cities.php");

    $city = new city();

    // save city
    if(isset($_POST['savecity'])){
        $cityid=$_POST['cityid'];
        $cityname=$_POST['cityname'];
        $countryid=$_POST['countryid'];
        $response=$city->saveCity($cityid, $cityname, $countryid);
        echo json_encode($response);
    }

    // get cities
    if(isset($_GET['getcities'])){
        echo $city->getCities();
    } 

    // filter cities
    if(isset($_GET['filtercities'])){
        $countryname=isset($_GET['countryname'])?$_GET['countryname']:'';
        $cityname=isset($_GET['cityname'])?$_GET['cityname']:'';
        echo $city->filterCities($countryname, $cityname);
    }

    // get city details
    if(isset($_GET['getcitydetails'])){
        $cityid=$_GET['cityid'];
        echo $city->getCityDetails($cityid);
    }

    // delete city
    if(isset($_POST['deletecity'])){
        $cityid=$_POST['cityid'];
        $response=$city->deleteCity($cityid);
        echo json_encode($response);
    }
?>
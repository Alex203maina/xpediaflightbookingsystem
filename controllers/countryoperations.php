<?php
    require_once("../models/countries.php");

    $country = new country();

    if(isset($_POST['savecountry'])){
        $countryid=$_POST['countryid'];
        $countryname=$_POST['countryname'];
        $response=$country->saveCountry($countryid, $countryname);
        echo json_encode($response);
    }
    if(isset($_GET['getcountries'])){
        echo $country->getCountries();
    }
    if(isset($_GET['getcountrydetails'])){
        $countryid=$_GET['countryid'];
        echo $country->getCountryDetails($countryid);
    }
    if(isset($_POST['deletecountry'])){
        $countryid=$_POST['countryid'];
        $response=$country->deleteCountry($countryid);
        echo json_encode($response);
    }

?>
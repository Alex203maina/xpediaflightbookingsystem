<?php

    require_once("../models/currencies.php");

    $currency = new currency();
    // save currency
    if(isset($_POST['savecurrency'])){
        $currencyid=$_POST['currencyid'];
        $currencyname=$_POST['currencyname'];
        $response=$currency->saveCurrency($currencyid, $currencyname);
        echo json_encode($response);
    }

    // get currencies
    if(isset($_GET['getcurrencies'])){
        echo $currency->getCurrencies();
    }

    // get currency details
    if(isset($_GET['getcurrencydetails'])){
        $currencyid=$_GET['currencyid'];
        echo $currency->getCurrencyDetails($currencyid);
    }
    // delete currency
    if(isset($_POST['deletecurrency'])){
        $currencyid=$_POST['currencyid'];
        $response=$currency->deleteCurrency($currencyid);
        echo json_encode($response);
    }
?>
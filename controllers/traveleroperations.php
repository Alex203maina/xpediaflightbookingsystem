<?php
    require_once("../models/travelers.php");

    $traveler = new travelers();

    // save traveler
    if(isset($_POST['savetraveler'])){
        $travelertypeid=$_POST['travelertypeid'];
        $typename=$_POST['typename'];
        $response=$traveler->saveTraveler($travelertypeid, $typename);
        echo json_encode($response);
    }

    // get travelers
    if(isset($_GET['gettravelers'])){
        echo $traveler->getTravelers();
    }
    // get traveler details
    if(isset($_GET['gettravelerdetails'])){
        $travelertypeid=$_GET['travelertypeid'];
        echo $traveler->getTravelerDetails($travelertypeid);
    }
    // delete traveler
    if(isset($_POST['deletetraveler'])){
        $travelertypeid=$_POST['travelertypeid'];
        $response=$traveler->deleteTraveler($travelertypeid);
        echo json_encode($response);
    }



?>
<?php
    require_once("../models/traveldocuments.php");

    $traveldocument = new traveldocuments();

    // save travel document
    if(isset($_POST['savetraveldocument'])){
        $documentid=$_POST['documentid'];
        $documenttype=$_POST['documenttype'];
        $documentexpires=$_POST['documentexpires'];
        $response=$traveldocument->saveTravelDocument($documentid, $documenttype, $documentexpires);
        echo json_encode($response);
    }

    // get travel documents
    if(isset($_GET['gettraveldocuments'])){
        echo $traveldocument->getTravelDocuments();
    }

    // get travel document details
    if(isset($_GET['gettraveldocumentdetails'])){
        $documentid=$_GET['documentid'];
        echo $traveldocument->getTravelDocumentDetails($documentid);
    }

    // delete travel document
    if(isset($_POST['deletetraveldocument'])){
        $documentid=$_POST['documentid'];
        $response=$traveldocument->deleteTravelDocument($documentid);
        echo json_encode($response);
    }


?>
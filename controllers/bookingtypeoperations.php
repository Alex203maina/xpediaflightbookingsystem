<?php
require_once ("../models/bookingtypes.php");

$bookingtype = new bookingtype();


// save booking type
if(isset($_POST['savebookingtype'])){
    $typeid=$_POST['typeid'];
    $typename=$_POST['typename'];
    $response=$bookingtype->saveBookingType($typeid, $typename);
    echo json_encode($response);
}
// get booking types
if(isset($_GET['getbookingtypes'])){
    echo $bookingtype->getBookingTypes();
}
// get booking type details
if(isset($_GET['getbookingtypedetails'])){
    $typeid=$_GET['typeid'];
    echo $bookingtype->getBookingTypeDetails($typeid);
}

// delete booking type
if(isset($_POST['deletebookingtype'])){
    $typeid=$_POST['typeid'];
    $response=$bookingtype->deleteBookingType($typeid);
    echo json_encode($response);
}


?>
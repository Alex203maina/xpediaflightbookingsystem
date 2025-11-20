<?php
    require_once("../models/payments.php");

    $payment = new payment();

    // save payments
    if(isset($_POST['savepayment'])){
        $paymentid = $_POST['paymentid'];
        $methodname = $_POST['methodname'];

        $response = $payment->savePayment($paymentid, $methodname);
        echo json_encode($response);}

    // get payment
    if(isset($_GET['getpayments'])){
        echo $payment->getPayments();
    }


    // get payment details
    if(isset($_GET['getpaymentsdetails'])){
        $paymentid = $_GET['paymentid'];
        echo $payment->getPaymentDetails($paymentid);
    }

    // delete payments
    if(isset($_POST['deletepayments'])){
        $paymentid = $_POST['paymentid'];
        $response = $payment->detetePayment($paymentid);
        echo json_encode($response);
    }

?>  
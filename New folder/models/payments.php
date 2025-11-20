<?php
    require_once("db.php");


    class payment extends db{

        // function to check payment method
        function checkPayments($paymentid, $methodname){
            $sql = "CALL `sp_checkpayments`({$paymentid}, '{$methodname}')";
            return $this->getData($sql)->rowCount();
        }

        // fnction to  save payment method

        function savePayment($paymentid,$methodname){
            if($this->checkPayments($paymentid, $methodname)){
                return ["status"=>"error","message"=>"Payment already exist"];
            }else{
            $sql = "CALL `sp_savepayment`({$paymentid},'{$methodname}')";
            $this->getData($sql);
            return ["status"=>"success", "message" =>"Payment saved successfully"];
            }
        }

        // function get payments
        function getPayments(){
            $sql = "CALL `sp_getpayments`()";
            return $this->getJson($sql);
        }

        // function get payments details
        function getPaymentDetails($paymentid){
            $sql = "CALL`sp_getpaymentdetails`({$paymentid})";
            return $this->getJson($sql);
        }

        // delete payments 
        function detetePayment($paymentid){
            $sql = "CALL `sp_deletepayment`({$paymentid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Payment deleted successfully"];
        }
    }

?>
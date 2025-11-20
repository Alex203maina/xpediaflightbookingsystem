<?php
    require_once("db.php");

    class currency extends db{
        // check currency if it exists
    function checkCurrency($currencyid, $currencyname){
        $sql = "CALL `sp_checkcurrency`({$currencyid},'{$currencyname}')";
        return $this->getData($sql)->rowCount();
    }

    // save currency
    function saveCurrency($currencyid, $currencyname) {
        if ($this->checkCurrency($currencyid, $currencyname)) {
            return ["status" => "error", "message" => "Currency already exists."];
        } else {
            $sql = "CALL `sp_savecurrency`({$currencyid},'{$currencyname}')";
            $this->getData($sql);
            return ["status" => "success", "message" => "Currency saved successfully."];
        }
    }
    // get currencies
    function getCurrencies(){
        $sql = "CALL `sp_getcurrencies`()";
        return $this->getJSON($sql);
    }   

    // get currency details
    function getCurrencyDetails($currencyid){
        $sql = "CALL `sp_getcurrencydetails`({$currencyid})";
        return $this->getJSON($sql);
    }

    // delete currency
    function deleteCurrency($currencyid){
        $sql = "CALL `sp_deletecurrency`({$currencyid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Currency deleted successfully."];
}
    }
?>
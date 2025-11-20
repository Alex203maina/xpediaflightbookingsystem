<?php
    require_once("db.php");

    class flight extends db{
        // check flight if it exists
    function checkFlights($flightno,$airlineid, $departurecityid,$destinationcityid,$departuretime){
        $sql = "CALL `sp_checkflight`('{$flightno}',{$airlineid},{$departurecityid},{$destinationcityid},'{$departuretime}')";
        return $this->getData($sql)->rowCount();
    }

    // save flight
function saveFlight($flightid, $flightno, $airlineid, $departurecityid, $departureairportid, $destinationcityid, $destinationairportid, $departuretime, $durationofflight) {
    if ($this->checkFlights($flightno, $airlineid, $departurecityid, $destinationcityid, $departuretime)) {
        return ["status" => "error", "message" => "Flight already exists."];
    } else {
        $sql = "CALL `sp_saveflights`({$flightid},'{$flightno}', {$airlineid},{$departurecityid},{$departureairportid},{$destinationcityid},{$destinationairportid} ,'{$departuretime}','{$durationofflight}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight saved successfully."];
    }
}

    // get flights
    function getFlights(){
        $sql = "CALL `sp_getflights`()";
        return $this->getJSON($sql);
    }

    // get flight details
    function getFlightDetails($flightid){
        $sql = "CALL `sp_getflightdetails`({$flightid})";
        return $this->getJSON($sql);
    }

    // filter flights
    function filterFlights($airportname, $cityname, $departurecountryname, $destinationcountryname){
        $sql = "CALL `sp_flightdetails`('{$airportname}','{$cityname}','{$departurecountryname}','{$destinationcountryname}')";
        return $this->getJSON($sql);
    }
    // delete flight
    function deleteFlight($flightid){
        $sql = "CALL `sp_deleteflight`({$flightid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight deleted successfully."];
    }
}
?>
<?php
    require_once("db.php");

    class travelers extends db{

        // function to check traveler
        function CheckTraveler($travelertypeid, $typename){
            $sql = "CALL `sp_checktravelertype`({$travelertypeid}, '{$typename}')";
            return $this->getData($sql)->rowCount();

        }
        // function to save traveler
        function saveTraveler($travelertypeid, $typename){
            if($this->CheckTraveler($travelertypeid, $typename)){
                return ["status"=>"error","message"=>"Traveler already exist"];
            }else{
            $sql = "CALL `sp_savetravelers`({$travelertypeid},'{$typename}')";
            $this->getData($sql);
            return ["status"=>"success", "message" =>"Traveler saved successfully"];
            }
    }
        // function get travelers
        function getTravelers(){
            $sql = "CALL `sp_gettravelers`()";
            return $this->getJson($sql);
        }
        // function get traveler details
        function getTravelerDetails($travelertypeid){
            $sql = "CALL`sp_gettravelersdetails`({$travelertypeid})";
            return $this->getJson($sql);
        }
        // delete traveler
        function deleteTraveler($travelertypeid){
            $sql = "CALL `sp_deletetravelers`({$travelertypeid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Traveler deleted successfully"];
        }
}
?>
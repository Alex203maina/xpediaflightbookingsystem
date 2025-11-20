<?php
    require_once("db.php");

    class traveldocuments extends db{

        // function to check travel document
        function checkTravelDocument($documentid, $documenttype){
            $sql = "CALL `sp_checktraveldocument`({$documentid}, '{$documenttype}')";
            return $this->getData($sql)->rowCount();
        }

        // function save travel document
        function saveTravelDocument($documentid,$documenttype, $documentexpires){
            if($this->checkTravelDocument($documentid, $documenttype)){
                return ["status"=>"error","message"=>"Travel document already exist"];
            }else{
            $sql = "CALL `sp_savetraveldocuments`({$documentid},'{$documenttype}', '{$documentexpires}')";
            $this->getData($sql);
            return ["status"=>"success", "message" =>"Travel document saved successfully"];
            }
        }
        // function get travel documents
        function getTravelDocuments(){
            $sql = "CALL `sp_gettraveldocuments`()";
            return $this->getJson($sql);
        }

        // function get travel document details
        function getTravelDocumentDetails($documentid){
            $sql = "CALL`sp_gettraveldocumentdetails`({$documentid})";
            return $this->getJson($sql);
        }

        // delete travel document
        function deleteTravelDocument($documentid){
            $sql = "CALL `sp_deletetraveldocument`({$documentid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Travel document deleted successfully"];
        }
    }
?>
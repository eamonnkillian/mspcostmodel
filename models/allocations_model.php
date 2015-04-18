<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Allocations_Model extends Model {

    function __construct() {
        parent::__construct();
    }

    public function ajax_allocationsShow() {
        $tableName = $_POST['tableName'];
        $statement = $this->database->prepare("SHOW COLUMNS FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $labourtables = $statement->fetchAll();
        $newarr=array();
        foreach ($labourtables as $val) {
            array_push($newarr,$val['Field']);
        }
        $newarr1=array();
        
        foreach ($newarr as $value) {
            $statement = $this->database->prepare("SELECT $value FROM $tableName");
            $statement->setFetchMode(PDO::FETCH_ASSOC);
            $statement->execute();
            $entries = $statement->fetchAll();
            
            array_push($newarr1,$value,$entries);
        }
        echo json_encode($newarr1);
    }

    public function ajax_allocationsAdd() {
        $tableName = $_POST['tableName'];
        $insertString = "INSERT INTO ".$tableName." (";
        foreach ($_POST as $key => $value) {
            if ($key != "tableName") {
                $insertString.="".$key.",";
            }
        }
        $insertString = rtrim($insertString, ",");
        $insertString.=") VALUES (";
        foreach ($_POST as $key => $value) {
            if ($key != "tableName") {
                $insertString.="'".$value."',";
            }
        }    
        $insertString = rtrim($insertString, ",");
        $insertString.=");";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "done";
    }

    public function ajax_allocationsDelete() {
        $id = $_POST['id'];
        $tableName = $_POST['tableName'];
        $insertString = "DELETE FROM mspCostModel.".$tableName." WHERE (id) ='".$id."';";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "done";
    }
    
    public function ajax_allocationsModify() {
        $tableName=$_POST['tableName'];
        $insertString = "UPDATE ".$tableName." SET ";
        foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "currentupdater" && $key != "id" && $key != "lastupdated" && $key != "tableName") {
                $insertString .= $key."='".$value."',";            
            } 
        }
        $insertString .= "lastupdatedby='".$_POST['currentupdater']."' WHERE (id) ='".$_POST['id']."';";        
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "done";
    }
    
    public function ajax_checkForDuplicate() {
        $tableName = $_GET['tableName'];
        $entry = $_GET['entry'];
        $value = $_GET['value'];
        $statement = $this->database->prepare("SELECT id FROM ".$tableName." WHERE ".$entry."='$value';");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $id=$data[0]['id'];
        
        if ($id) {
            echo "true";
        } else {
            echo "false";
        }
        
    }
    
    public function ajax_getInformation() {
        $tablename = $_POST['tablename'];
        $insertString = "SELECT product_name FROM ".$tablename.";";
        $statement = $this->database->prepare($insertString);
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        $newarr1=array();
        foreach ($array as $key => $value) {
            foreach($value as $k => $v) {
                array_push($newarr1, $v);
            }
        }
        echo json_encode($newarr1);
    }
    
    public function ajax_getAssignment() {
        $tableName = $_GET['tableName'];
        $statement = $this->database->prepare("SELECT assignment_type FROM assignments;");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $newarr1=array();
        foreach ($data as $key => $value) {
            foreach($value as $k => $v) {
                array_push($newarr1, $v);
            }
        }
        echo json_encode($newarr1);
    }

    public function ajax_getResources() {
        $tableName = $_POST['tablename'];
        $productName = $_POST['productname'];
        if ($tableName === "iaas_physical_machine_products") {
            $statement = $this->database->prepare("SELECT product_source,amount_of_physical_cores,amount_of_memory_MBs,amount_of_storage_GBs FROM ".$tableName." WHERE product_name='".$productName."';");
        } else if ($tableName === "iaas_physical_san_products" OR $tableName === "iaas_physical_nas_products" OR $tableName === "iaas_virtual_san_products" OR $tableName === "iaas_virtual_nas_products") {
            $statement = $this->database->prepare("SELECT product_source,amount_of_storage_GBs FROM ".$tableName." WHERE product_name='".$productName."';");
        } else if ($tableName === "bandwidth_service_products"){
            $statement = $this->database->prepare("SELECT product_source,amount_of_bandwidth FROM ".$tableName." WHERE product_name='".$productName."';");
        } else if ($tableName === "consulting_service_products"){
            $statement = $this->database->prepare("SELECT product_source,amount_of_person_days FROM ".$tableName." WHERE product_name='".$productName."';");
        } else {
            $statement = $this->database->prepare("SELECT product_source,amount_of_VMs,amount_of_memory_MBs,amount_of_storage_GBs FROM ".$tableName." WHERE product_name='".$productName."';");
        }
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $newarr1=array();
        foreach ($data as $key => $value) {
            foreach($value as $k => $v) {
                array_push($newarr1, $v);
            }
        }
        echo json_encode($newarr1);
     
    }
    
    public function runQuery($arg) {
        $insertString = $arg;
        $statement = $this->database->prepare($insertString);
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return $array;
    }
}

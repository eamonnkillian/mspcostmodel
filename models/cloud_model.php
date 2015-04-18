<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Cloud_Model extends Model {

    function __construct() {
        parent::__construct();
    }

    public function ajax_cloudShow() {
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

    public function ajax_cloudAdd() {
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
        echo "true";
    }

    public function ajax_cloudDelete() {
        $id = $_POST['id'];
        $tableName = $_POST['tableName'];
        $insertString = "DELETE FROM mspCostModel.".$tableName." WHERE (id) ='".$id."';";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo $insertString;
    }
    
    public function ajax_cloudModify() {
        $tableName=$_POST['tableName'];
        $insertString = "UPDATE ".$tableName." SET ";
        foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "currentupdater" && $key != "id" && $key != "lastupdated" && $key != "tableName") {
                $insertString .= $key."='".$value."',";            
            } 
        }
        $insertString .= "lastupdatedby='".$_POST['lastupdatedby']."' WHERE (id) ='".$_POST['id']."';";        
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "Complete";
    }
    
    public function ajax_checkForDuplicate() {
        $tableName = $_GET['tableName'];
        $type = $_GET['type'];
        $provider = $_GET['provider'];
        $typeColumn = $_GET['typeCol'];
        $providerColumn = $_GET['providerCol'];
        
        $statement = $this->database->prepare("SELECT id FROM ".$tableName." WHERE ".$typeColumn."='$type' AND ".$providerColumn."='$provider';");
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
    
    public function ajax_getProvider() {
        $statement = $this->database->prepare("SELECT cloudprovider_name FROM cloudprovider;");
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
    
    public function ajax_getCurrency() {
        $statement = $this->database->prepare("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS where table_name='fx';");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $newarr1=array();
        foreach ($data as $key => $value) {
            foreach($value as $k => $v) {
                if ($v != "id" AND $v != "lastupdated" AND $v != "lastupdatedby") {
                   array_push($newarr1, $v);
                } 
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
    
}

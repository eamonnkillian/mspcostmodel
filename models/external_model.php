<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class External_Model extends Model {

    function __construct() {
        parent::__construct();
    }
    
    public function ajax_externalShowColumnEntries($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("select * from ".$tableName. ";");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function ajax_externalShowColumns($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("select column_name from information_schema.columns where table_name='$tableName';");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }

       
    public function ajax_externalModify() {
        $tableName=$_POST['tableName'];
        $insertString = "UPDATE ".$tableName." SET ";
        foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "id" && $key != "lastupdated" && $key != "tableName") {
                $insertString .= "`".$key."`='".$value."',";            
            } 
        }
        $insertString .= "lastupdatedby='".$_POST['lastupdatedby']."' WHERE (id) ='".$_POST['id']."';";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "true";
    }
    
    public function ajax_checkForDuplicate() {
        $tableName = $_GET['tableName'];
        $entry = $_GET['entry'];
        $value = $_GET['value'];
        $location = $_GET['location'];
        $locationField = $tableName."_location";
        
        $statement = $this->database->prepare("SELECT id FROM ".$tableName." WHERE ".$entry."='$value' AND ".$locationField."='$location';");
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
    
    public function ajax_getLocation() {
        $statement = $this->database->prepare("SELECT assets_location FROM dcassets;");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $newarr1=array();
        foreach ($data as $key => $value) {
            foreach($value as $k => $v) {
                array_push($newarr1, $v);
            }
        }
        $statement = $this->database->prepare("SELECT office_name FROM offices;");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
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
        return $newarr1;
    }
    
    public function getCurrentCurrency($tableName) {
        $statement = $this->database->prepare("SELECT original_currency FROM $tableName;");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $newarr1=array();
        foreach ($data as $key => $value) {
            foreach($value as $k => $v) {
                   $currentcurrency = $v;
                } 
            }
        return $currentcurrency;  
    }   
    
}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Cloudprovider_Model extends Model {

    function __construct() {
        parent::__construct();
    }

    public function ajax_cloudproviderShow() {
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

    public function ajax_cloudproviderAdd() {
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

    public function ajax_cloudproviderDelete() {
        $id = $_POST['id'];
        $tableName = $_POST['tableName'];
        $insertString = "DELETE FROM ".$tableName." WHERE (id) ='".$id."';";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo $insertString;
    }
    
    public function ajax_cloudproviderModify() {
        $tableName = $_POST['tableName'];
        $insertString = "UPDATE ".$tableName." SET ";
        foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "currentupdater" && $key != "id" && $key != "lastupdated" && $key != "tableName") {
                $insertString .= $key."='".$value."',";            
            } 
        }
        $insertString .= "lastupdatedby='".$_POST['currentupdater']."' WHERE (id) ='".$_POST['id']."';";        
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo $insertString;
    }
    
    public function ajax_checkForDuplicate() {
        $cloudprovider = $_GET['value'];
        $tableName = $_GET['tableName'];
        $statement = $this->database->prepare("SELECT id FROM ".$tableName." WHERE cloudprovider_name='$cloudprovider'");
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
}

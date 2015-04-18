<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Usermgmt_Model extends Model {

    function __construct() {
        parent::__construct();
    }

    public function ajax_usermgmtShow() {
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

    public function ajax_usermgmtAdd() {
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
            if ($key != "tableName" && $key != "password") {
                $insertString.="'".$value."',";
            } else if ($key === "password") {
                $password = Hash::create('md5', $value, HASH_SALT);
                $insertString.="'".$password."',";
            }
        }    
        $insertString = rtrim($insertString, ",");
        $insertString.=");";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "true";
    }

    public function ajax_usermgmtDelete() {
        $id = $_POST['id'];
        $tableName = $_POST['tableName'];
        $insertString = "DELETE FROM ".$tableName." WHERE (id) ='".$id."';";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo $insertString;
    }
    
    public function ajax_usermgmtModify() {
        $tableName = $_POST['tableName'];
        $insertString = "UPDATE ".$tableName." SET ";
        $checkPass = $_POST['password'];
        if ($checkPass === 'FALSE') {
            foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "currentupdater" && $key != "id" && $key != "lastupdated" && $key != "tableName" && $key != "password") {
                $insertString .= $key."='".$value."',";            
                }
            }
        } else {
            foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "currentupdater" && $key != "id" && $key != "lastupdated" && $key != "tableName") {
                    if ($key === "password") {
                        echo $value;
                        $password = Hash::create('md5', $value, HASH_SALT);
                        $insertString .= $key."='".$password."',";
                    } else {
                        $insertString .= $key."='".$value."',";   
                    }
                   
                } 
            }
        }
        $insertString .= "lastupdatedby='".$_POST['currentupdater']."' WHERE (id) ='".$_POST['id']."';";     
        $statement = $this->database->prepare($insertString);
        $statement->execute();
    }
    
    public function ajax_checkForDuplicate() {
        $tableName = $_GET['tableName'];
        $value = $_GET['value'];
        $statement = $this->database->prepare("SELECT id FROM ".$tableName." WHERE login='$value';");
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
    
    public function ajax_getRole() {
        $statement = $this->database->prepare("SELECT userroletype FROM roles;");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        echo json_encode($data);
    }
}
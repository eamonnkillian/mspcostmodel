<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Customers_Model extends Model {

    function __construct() {
        parent::__construct();
    }

    public function ajax_customersShow() {
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

    public function ajax_customersAdd() {
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
        echo $insertString;
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo "true";
    }

    public function ajax_customersDelete() {
        $id = $_POST['id'];
        $insertString = "DELETE FROM mspCostModel.customers WHERE (id) ='".$id."';";
        $statement = $this->database->prepare($insertString);
        $statement->execute();
        echo $insertString;
    }
    
    public function ajax_customersModify() {
        $insertString = "UPDATE mspCostModel.customers SET ";
        foreach ($_POST as $key => $value) {
            if ($key != "lastupdatedby" && $key != "currentupdater" && $key != "id" && $key != "lastupdated") {
                $insertString .= $key."='".$value."',";            
            } 
        }
        $insertString .= "lastupdatedby='".$_POST['currentupdater']."' WHERE (id) ='".$_POST['id']."';";        
        $statement = $this->database->prepare($insertString);
        $statement->execute();
    }
    
    public function ajax_checkForDuplicate() {
        $customer = $_GET['value'];
        $statement = $this->database->prepare("SELECT id FROM customers WHERE customer_name='$customer'");
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
    
}

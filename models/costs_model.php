<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Costs_Model extends Model {

    function __construct() {
        parent::__construct();
    }
 
    public function getLocations($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("SELECT assets_location FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getOffices($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("SELECT office_name FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getHWTypes($arg) {
        $tableName = $arg;
        $table_column = $arg."_type";
        $statement = $this->database->prepare("SELECT $table_column FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getSWTypes($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("SELECT software_type FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getServerTypes($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("SELECT server_type FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getPrinterTypes($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("SELECT printer_type FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getlabour($arg) {
        $tableName = $arg;
        $statement = $this->database->prepare("SELECT employee_category FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function getCloudServicesCosts($arg) {
        $tableName = $arg;
        $type = $tableName."_type";
        $statement = $this->database->prepare("SELECT $type FROM $tableName");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return ($array);
    }
    
    public function runQuery($arg) {
        $insertString = $arg;
        $statement = $this->database->prepare($insertString);
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $array = $statement->fetchAll();
        return $array;
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
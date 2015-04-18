<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Salesforecasting_Model extends Model {

    function __construct() {
        parent::__construct();
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

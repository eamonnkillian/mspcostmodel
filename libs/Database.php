<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Database extends PDO {

    public function __construct() {
        parent:: __construct(DATABASE_TYPE.':host='.DATABASE_HOST.';port='.DATABASE_PORT.';dbname='.DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD);  
    }

}
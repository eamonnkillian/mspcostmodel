<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Register_Model extends Model{

    function __construct() {
        parent::__construct();
    }
    
    public function checkForDuplicate() {
        $login = $_GET['login'];      
        $statement = $this->database->prepare("SELECT id FROM users WHERE login='$login'");
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        $data = $statement->fetchAll();
        $id=$data[0]['id'];
        
        if ($id) {
            echo "Failure";
        } else {
            echo "Success";
        }
        
    }
    
    public function registerExecute() {
        $login = $_POST['login'];
        $password = Hash::create('md5', $_POST['password'], HASH_SALT);
        $firstname = $_POST['firstname'];
        $middlename = $_POST['middlename'];
        $surname = $_POST['surname'];
        $mobilephonenumber = $_POST['mobilephonenumber'];
        $landphonenumber = $_POST['landphonenumber'];
        $userrole = $_POST['userrole'];
        $lastupdatedby = $login;
        $statement = $this->database->prepare("INSERT INTO users (login,password,first_name,middle_name,surname,mobile_phonenumber,land_phonenumber,user_role,lastupdatedby) VALUES (:login,:password,:firstname,:middlename,:surname,:mobilephonenumber,:landphonenumber,:userrole,:lastupdatedby);");
        $statement->execute(array(':login' => $login,':password' => $password,':firstname' => $firstname,':middlename' => $middlename,':surname' => $surname,':mobilephonenumber' => $mobilephonenumber,':landphonenumber' => $landphonenumber,':userrole' => $userrole,':lastupdatedby' => $lastupdatedby));
        echo "Success";
    } 
    
}
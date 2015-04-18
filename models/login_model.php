<?php

/*
  Created originally on : 01-07-2014
  Modifications on : 12-09-2014
  
  Company     : SaaSify Ltd.
  Author      : Eamonn Killian
  Web         : www.eamonnkillian.com
  Contact     : eamonnkillian@gmail.com

  This is the main view controller file required to deliver the application functionality.
  
*/

class Login_Model extends Model {

    function __construct() {
        parent::__construct();
    }

    public function loginExecute() {
        $statement = $this->database->prepare("SELECT id FROM users WHERE login= :login AND password = :password");
        $statement->execute(array(
            ':login' => $_POST['loginname'],
            ':password' => Hash::create('md5', $_POST['password'], HASH_SALT)
        ));

        $data = $statement->fetchAll();
        $count = $statement->rowCount();
        if ($count == 1) {
            Session::init();
            Session::set('loggedIn', true);
            Session::set('loginname', $_POST['loginname']);
            Session::set('lastTimeActive',time());
            $statement = $this->database->prepare("SELECT currency FROM aboutus where id='1';");
            $statement->execute();            
            $currency = $statement->fetchAll();
            foreach ($currency as $key=>$value) {
                foreach($value as $k => $v) {
                    Session::set('currency', $v);
                }
            }
            
            $statement = $this->database->prepare("SELECT first_name FROM users WHERE login= :login AND user_role='Administrator';");
            $statement->execute(array(
                ':login' => $_POST['loginname'],
            ));            
            $data = $statement->fetchAll();
            $count = $statement->rowCount();
            if ($count == 1) {
                Session::set('Admin', true);
            }
            
            echo "success";
            
            //header('location: ../dashboard');
        
            
            } else {
            //header('location: ../login');
        
            echo "failure";
        }
    }

}

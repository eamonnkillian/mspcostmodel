<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Controller {

    function __construct() {
        $this->view = new View();
    }
    
    public function load_model($name) {
        $location = 'models/'.$name.'_model.php';
      
        if (file_exists($location)){
            require 'models/'.$name.'_model.php';
            $modelName = $name.'_Model';    
            $this->model = new $modelName();
        }
    }

}
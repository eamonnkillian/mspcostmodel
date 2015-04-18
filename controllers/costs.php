<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Costs extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->css = array('css/public/costs.css');
        $this->view->js = array('js/public/costs.js');
    }
    
    function index() {
        $this->view->render('costs/index');
    }
    
}

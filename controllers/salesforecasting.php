<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Salesforecasting extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/salesforecasting.js');
        $this->view->css = array('css/public/salesforecasting.css');
    }
    
    function index() {
        $this->view->render('salesforecasting/index');
    }
    
}

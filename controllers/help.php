<?php

/* 
 * 
 * The main controller for the web site.
 * 
 */

class Help extends Controller {
    function __construct() {
        parent::__construct();  
    }
    
    function index() {
        $this->view->render('help/index');
    }
   
}
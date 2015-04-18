<?php

/*
 * 
 * The main controller for the web site.
 * 
 */

class Index extends Controller {

    function __construct() {
        parent::__construct();
    }

    function index() {
        $this->view->render('index/index');
    }
    
    function details() {
               
    }

}

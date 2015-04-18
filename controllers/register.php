<?php

/*
 * 
 * The main controller for the web site.
 * 
 */

class Register extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/register.js');
        $this->view->css = array('css/public/register.css');
        $this->view->crypto = array('js/libs/md5.js');
    }

    function index() {
        $this->view->render('register/index');
    }

    function registerExecute() {
        $this->model->registerExecute();
    }
    
    function success() {
        $this->view->render('register/success');
    }
    
    function checkForDuplicate() {
        $this->model->checkForDuplicate();
    }
    
}

<?php

/*
 * 
 * The main controller for the web site.
 * 
 */

class Login extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/login.js');
        $this->view->css = array('css/public/login.css');
        $this->view->crypto = array('js/libs/md5.js');
    }

    function index() {
        $this->view->render('login/index');
    }
    
    function loginExecute() {
        $this->model->loginExecute();
    }
}

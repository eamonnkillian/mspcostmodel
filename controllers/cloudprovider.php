<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Cloudprovider extends Controller {

    function __construct() {
        parent::__construct();
        Session::init();
        $logged = Session::get('loggedIn');
        if ($logged == false) {
            header('location: ../login');
            exit;
        } 
        $this->view->js = array('js/public/cloudprovider.js');
        $this->view->css = array('css/public/cloudprovider.css');
    }
    
    function index() {
        $this->view->render('cloudprovider/index');
    }
    
    function ajax_cloudproviderAdd() {
        $this->model->ajax_cloudproviderAdd();
    }

    function ajax_cloudproviderShow() {
        $this->model->ajax_cloudproviderShow();
    }
    
    function ajax_cloudproviderDelete() {
        $this->model->ajax_cloudproviderDelete();
    }
    
    function ajax_cloudproviderModify() {
        $this->model->ajax_cloudproviderModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
}

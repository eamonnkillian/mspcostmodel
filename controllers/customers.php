<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Customers extends Controller {

    function __construct() {
        parent::__construct();
        Session::init();
        $logged = Session::get('loggedIn');
        if ($logged == false) {
            header('location: ../login');
            exit;
        } 
        $this->view->js = array('js/public/customers.js');
        $this->view->css = array('css/public/customers.css');
    }
    
    function index() {
        $this->view->render('customers/index');
    }
    
    function ajax_customersAdd() {
        $this->model->ajax_customersAdd();
    }

    function ajax_customersShow() {
        $this->model->ajax_customersShow();
    }
    
    function ajax_customersDelete() {
        $this->model->ajax_customersDelete();
    }
    
    function ajax_customersModify() {
        $this->model->ajax_customersModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
}

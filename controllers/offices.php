<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Offices extends Controller {

    function __construct() {
        parent::__construct();
        Session::init();
        $logged = Session::get('loggedIn');
        if ($logged == false) {
            header('location: ../login');
            exit;
        } 
        $this->view->js = array('js/public/offices.js');
        $this->view->css = array('css/public/offices.css');
    }
    
    function index() {
        $this->view->render('offices/index');
    }
    
    function ajax_officesAdd() {
        $this->model->ajax_officesAdd();
    }

    function ajax_officesShow() {
        $this->model->ajax_officesShow();
    }
    
    function ajax_officesDelete() {
        $this->model->ajax_officesDelete();
    }
    
    function ajax_officesModify() {
        $this->model->ajax_officesModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
}

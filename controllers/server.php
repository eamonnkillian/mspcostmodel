<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Server extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/server.js');
        $this->view->css = array('css/public/server.css');
    }
    
    function index() {
        $this->view->render('server/index');
    }
    
    function ajax_serverAdd() {
        $this->model->ajax_serverAdd();
    }

    function ajax_serverShow() {
        $this->model->ajax_serverShow();
    }
    
    function ajax_serverDelete() {
        $this->model->ajax_serverDelete();
    }
    
    function ajax_serverModify() {
        $this->model->ajax_serverModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
    
    function ajax_getAssignment() {
        $this->model->ajax_getAssignment();
    }
}

<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Network extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/network.js');
        $this->view->css = array('css/public/network.css');
    }
    
    function index() {
        $this->view->render('network/index');
    }
    
    function ajax_networkAdd() {
        $this->model->ajax_networkAdd();
    }

    function ajax_networkShow() {
        $this->model->ajax_networkShow();
    }
    
    function ajax_networkDelete() {
        $this->model->ajax_networkDelete();
    }
    
    function ajax_networkModify() {
        $this->model->ajax_networkModify();
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

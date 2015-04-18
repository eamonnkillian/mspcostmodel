<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Cloud extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/cloud.js');
        $this->view->css = array('css/public/cloud.css');
    }
    
    function index() {
        $this->view->render('cloud/index');
    }
    
    function ajax_cloudAdd() {
        $this->model->ajax_cloudAdd();
    }

    function ajax_cloudShow() {
        $this->model->ajax_cloudShow();
    }
    
    function ajax_cloudDelete() {
        $this->model->ajax_cloudDelete();
    }
    
    function ajax_cloudModify() {
        $this->model->ajax_cloudModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getProvider() {
        $this->model->ajax_getProvider();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
    
    function ajax_getAssignment() {
        $this->model->ajax_getAssignment();
    }
}

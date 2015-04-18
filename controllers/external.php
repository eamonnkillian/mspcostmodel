<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class External extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/external.js');
        $this->view->css = array('css/public/external.css');
    }
    
    function index() {
        $this->view->render('external/index');
    }
    
    function ajax_externalAdd() {
        $this->model->ajax_externalAdd();
    }

    function ajax_externalShow() {
        $this->model->ajax_externalShow();
    }
    
    function ajax_externalDelete() {
        $this->model->ajax_externalDelete();
    }
    
    function ajax_externalModify() {
        $this->model->ajax_externalModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_externalShowColumns() {
        $this->model->ajax_externalShowColumns();
    }
    
    function ajax_externalShowColumnEntries() {
        $this->model->ajax_externalShowColumnEntries();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
}

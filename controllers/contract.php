<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Contract extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/contract.js');
        $this->view->css = array('css/public/contract.css');
    }
    
    function index() {
        $this->view->render('contract/index');
    }
    
    function ajax_contractAdd() {
        $this->model->ajax_contractAdd();
    }

    function ajax_contractShow() {
        $this->model->ajax_contractShow();
    }
    
    function ajax_contractDelete() {
        $this->model->ajax_contractDelete();
    }
    
    function ajax_contractModify() {
        $this->model->ajax_contractModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_contractShowColumns() {
        $this->model->ajax_contractShowColumns();
    }
    
    function ajax_contractShowColumnEntries() {
        $this->model->ajax_contractShowColumnEntries();
    }
}

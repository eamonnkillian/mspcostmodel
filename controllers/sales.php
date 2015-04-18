<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Sales extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/sales.js');
        $this->view->css = array('css/public/sales.css');
    }
    
    function index() {
        $this->view->render('sales/index');
    }
    
    function ajax_salesAdd() {
        $this->model->ajax_salesAdd();
    }

    function ajax_salesShow() {
        $this->model->ajax_salesShow();
    }
    
    function ajax_salesDelete() {
        $this->model->ajax_salesDelete();
    }
    
    function ajax_salesModify() {
        $this->model->ajax_salesModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_salesShowColumns() {
        $this->model->ajax_salesShowColumns();
    }
    
    function ajax_salesShowColumnEntries() {
        $this->model->ajax_salesShowColumnEntries();
    }
}

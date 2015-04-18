<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Printer extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/printer.js');
        $this->view->css = array('css/public/printer.css');
    }
    
    function index() {
        $this->view->render('printer/index');
    }
    
    function ajax_printerAdd() {
        $this->model->ajax_printerAdd();
    }

    function ajax_printerShow() {
        $this->model->ajax_printerShow();
    }
    
    function ajax_printerDelete() {
        $this->model->ajax_printerDelete();
    }
    
    function ajax_printerModify() {
        $this->model->ajax_printerModify();
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

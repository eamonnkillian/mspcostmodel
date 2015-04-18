<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Software extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/software.js');
        $this->view->css = array('css/public/software.css');
    }
    
    function index() {
        $this->view->render('software/index');
    }
    
    function ajax_softwareAdd() {
        $this->model->ajax_softwareAdd();
    }

    function ajax_softwareShow() {
        $this->model->ajax_softwareShow();
    }
    
    function ajax_softwareDelete() {
        $this->model->ajax_softwareDelete();
    }
    
    function ajax_softwareModify() {
        $this->model->ajax_softwareModify();
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

<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Allocations extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/allocations.js');
        $this->view->css = array('css/public/allocations.css');
    }
    
    function index() {
        $this->view->render('allocations/index');
    }
    
    function ajax_allocationsAdd() {
        $this->model->ajax_allocationsAdd();
    }

    function ajax_allocationsShow() {
        $this->model->ajax_allocationsShow();
    }
    
    function ajax_allocationsDelete() {
        $this->model->ajax_allocationsDelete();
    }
    
    function ajax_allocationsModify() {
        $this->model->ajax_allocationsModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getInformation() {
        $this->model->ajax_getInformation();
    }
    
    function ajax_getResources() {
        $this->model->ajax_getResources();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
    
    function ajax_getAssignment() {
        $this->model->ajax_getAssignment();
    }
    
    function runQuery() {
        $this->model->runQuery();
    }
}

<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Storage extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/storage.js');
        $this->view->css = array('css/public/storage.css');
    }
    
    function index() {
        $this->view->render('storage/index');
    }
    
    function ajax_storageAdd() {
        $this->model->ajax_storageAdd();
    }

    function ajax_storageShow() {
        $this->model->ajax_storageShow();
    }
    
    function ajax_storageDelete() {
        $this->model->ajax_storageDelete();
    }
    
    function ajax_storageModify() {
        $this->model->ajax_storageModify();
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

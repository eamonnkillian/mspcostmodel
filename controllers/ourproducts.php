<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Ourproducts extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/ourproducts.js');
        $this->view->css = array('css/public/ourproducts.css');
    }
    
    function index() {
        $this->view->render('ourproducts/index');
    }
    
    function ajax_ourproductsAdd() {
        $this->model->ajax_ourproductsAdd();
    }

    function ajax_ourproductsShow() {
        $this->model->ajax_ourproductsShow();
    }
    
    function ajax_ourproductsDelete() {
        $this->model->ajax_ourproductsDelete();
    }
    
    function ajax_ourproductsModify() {
        $this->model->ajax_ourproductsModify();
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
    
    function ajax_getInternalorExternal() {
        $this->model->ajax_getInternalorExternal();
    }
}

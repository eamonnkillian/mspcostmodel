<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Product extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/product.js');
        $this->view->css = array('css/public/product.css');
    }
    
    function index() {
        $this->view->render('product/index');
    }
    
    function ajax_productAdd() {
        $this->model->ajax_productAdd();
    }

    function ajax_productShow() {
        $this->model->ajax_productShow();
    }
    
    function ajax_productDelete() {
        $this->model->ajax_productDelete();
    }
    
    function ajax_productModify() {
        $this->model->ajax_productModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_productShowColumns() {
        $this->model->ajax_productShowColumns();
    }
    
    function ajax_productShowColumnEntries() {
        $this->model->ajax_productShowColumnEntries();
    }
}

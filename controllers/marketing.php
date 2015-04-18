<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Marketing extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/marketing.js');
        $this->view->css = array('css/public/marketing.css');
    }
    
    function index() {
        $this->view->render('marketing/index');
    }
    
    function ajax_marketingAdd() {
        $this->model->ajax_marketingAdd();
    }

    function ajax_marketingShow() {
        $this->model->ajax_marketingShow();
    }
    
    function ajax_marketingDelete() {
        $this->model->ajax_marketingDelete();
    }
    
    function ajax_marketingModify() {
        $this->model->ajax_marketingModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_marketingShowColumns() {
        $this->model->ajax_marketingShowColumns();
    }
    
    function ajax_marketingShowColumnEntries() {
        $this->model->ajax_marketingShowColumnEntries();
    }
}

<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Labour extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/labour.js');
        $this->view->css = array('css/public/labour.css');
    }
    
    function index() {
        $this->view->render('labour/index');
    }

    function ajax_LabourAdd() {
        $this->model->ajax_LabourAdd();
    }

    function ajax_LabourShow() {
        $this->model->ajax_LabourShow();
    }
    
    function ajax_LabourDelete() {
        $this->model->ajax_LabourDelete();
    }
    
    function ajax_LabourModify() {
        $this->model->ajax_LabourModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
    
}

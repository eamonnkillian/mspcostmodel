<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Enduser extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/enduser.js');
        $this->view->css = array('css/public/enduser.css');
    }
    
    function index() {
        $this->view->render('enduser/index');
    }
    
    function ajax_enduserAdd() {
        $this->model->ajax_enduserAdd();
    }

    function ajax_enduserShow() {
        $this->model->ajax_enduserShow();
    }
    
    function ajax_enduserDelete() {
        $this->model->ajax_enduserDelete();
    }
    
    function ajax_enduserModify() {
        $this->model->ajax_enduserModify();
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

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Usermgmt extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/usermgmt.js');
        $this->view->css = array('css/public/usermgmt.css');
        $this->view->crypto = array('js/libs/md5.js');
    }
    
    function index() {
        $this->view->render('usermgmt/index');
    }
    
    function ajax_usermgmtAdd() {
        $this->model->ajax_usermgmtAdd();
    }

    function ajax_usermgmtShow() {
        $this->model->ajax_usermgmtShow();
    }
    
    function ajax_usermgmtDelete() {
        $this->model->ajax_usermgmtDelete();
    }
    
    function ajax_usermgmtModify() {
        $this->model->ajax_usermgmtModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getRole() {
        $this->model->ajax_getRole();
    }
}

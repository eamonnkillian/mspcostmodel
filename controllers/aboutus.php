<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Aboutus extends Controller {

    function __construct() {
        parent::__construct();
        Session::init();
        $logged = Session::get('loggedIn');
        if ($logged == false) {
            header('location: ../login');
            exit;
        } 
        $this->view->js = array('js/public/aboutus.js');
        $this->view->css = array('css/public/aboutus.css');
    }
    
    function index() {
        $this->view->render('aboutus/index');
    }
    
    function ajax_aboutusAdd() {
        $this->model->ajax_aboutusAdd();
    }

    function ajax_aboutusShow() {
        $this->model->ajax_aboutusShow();
    }
    
    function ajax_aboutusDelete() {
        $this->model->ajax_aboutusDelete();
    }
    
    function ajax_aboutusModify() {
        $this->model->ajax_aboutusModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
}

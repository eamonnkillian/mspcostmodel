<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class dcassets extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/dcassets.js');
        $this->view->css = array('css/public/dcassets.css');
    }
    
    function index() {
        $this->view->render('dcassets/index');
    }
    
    function ajax_dcAssetsAdd() {
        $this->model->ajax_dcAssetsAdd();
    }

    function ajax_dcAssetsShow() {
        $this->model->ajax_dcAssetsShow();
    }
    
    function ajax_dcAssetsDelete() {
        $this->model->ajax_dcAssetsDelete();
    }
    
    function ajax_dcAssetsModify() {
        $this->model->ajax_dcAssetsModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getCurrency() {
        $this->model->ajax_getCurrency();
    }
    
}

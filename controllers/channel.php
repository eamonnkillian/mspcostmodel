<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Channel extends Controller {

    function __construct() {
        parent::__construct();
        $this->view->js = array('js/public/channel.js');
        $this->view->css = array('css/public/channel.css');
    }
    
    function index() {
        $this->view->render('channel/index');
    }
    
    function ajax_channelAdd() {
        $this->model->ajax_channelAdd();
    }

    function ajax_channelShow() {
        $this->model->ajax_channelShow();
    }
    
    function ajax_channelDelete() {
        $this->model->ajax_channelDelete();
    }
    
    function ajax_channelModify() {
        $this->model->ajax_channelModify();
    }
    
    function ajax_checkForDuplicate() {
        $this->model->ajax_checkForDuplicate();
    }
    
    function ajax_getLocation() {
        $this->model->ajax_getLocation();
    }
    
    function ajax_channelShowColumns() {
        $this->model->ajax_channelShowColumns();
    }
    
    function ajax_channelShowColumnEntries() {
        $this->model->ajax_channelShowColumnEntries();
    }
}

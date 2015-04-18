<?php

/*
 * A PHP program to create the views end users of the application will see. 
 * Some significant modifications made on the 27th May 2014 to make sure 
 * unlogged in users cannot get to any content within the application.
 * 
 */

class View {

    function __construct() {
        
    }

    public function render($name, $noInclude = false) {
        Session::init();

        if (!$_SESSION['loggedIn'] && $_SERVER['REQUEST_URI'] != URI_TEST . 'index' && $_SERVER['REQUEST_URI'] != URI_TEST . 'login' && $_SERVER['REQUEST_URI'] != URI_TEST . 'register' && $_SERVER['REQUEST_URI'] != URI_TEST . 'register/success') {
            header('location: ' . URL . 'login');
        } else {

            if (isset($_SESSION['lastTimeActive']) && (time() - $_SESSION['lastTimeActive'] > 900)) {
                session_destroy();
                session_unset();
                header('location: ' . URL . 'login');
            }

            $_SESSION['lastTimeActive'] = time();

            if ($noInclude == true) {
                require 'views/' . $name . '.php';
            } else {
                require 'views/Header.php';
                require 'views/' . $name . '.php';
                require 'views/Footer.php';
            }
        }
    }
}

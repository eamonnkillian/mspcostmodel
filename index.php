<?php

/*
  Created originally on : 01-07-2014
  Author      : Eamonn Killian
  Web         : www.eamonnkillian.com
  Contact     : eamonnkillian@gmail.com

  This is the main index file for the service provider web application which is designed
  to provide a secure login authenticated application for Service Inc's user companies to 
  login and manage their own assets which they sub-contract from Service Inc. In turn those
  assets are also sub-contracted from AWS, SoftLayer, Google, Azure or other by Service Inc.

  The application includes:
  1) A responsive front end web interface utilising CSS styling and JQuery animation
  2) A set of application code for viewing, creating and managing the customers assets
  3) A set of objects to link to AWS, SoftLayer or other
  4) A database back end in MySQL for storing information

  The business objective for the application is to enable an MSP business to build their 
  IaaS business without ever owning a single IT network, server or storage asset.
 
  None of this would have been possible without the incredible tutorials provided by:
     - http://jream.com/lab

 */

require 'config/Paths.php';
require 'config/Database.php';
require 'config/Constants.php';

function __autoload ($class) {
    require LIBS . $class . ".php";
}

$app = new Bootstrap();

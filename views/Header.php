<!DOCTYPE html>
<!--
Created originally on : 01-07-2014
  Modifications on : 10-04-2015

  Company     : SaaSify Ltd.
  Author      : Eamonn Killian
  Web         : www.eamonnkillian.com
                www.saasifyltd.com
  Contact     : eamonnkillian@gmail.com

  The index file for the mspcostmodel application.

  The core functionality of the application itself is written in PHP with a MySQL database and 
  leverages JavaScript/JQuery/AJAX extensively to deliver dynamicism at the front end.  
  This can be hosted on a Cloud platform in a two tier application architecture. That architecture is 
  delivered using standard LAMP implementation with PHP-APC for accelerated performance. 
  
  As always it is worth noting that little (indeed hardly any) of this web site and 
  and the application code provided from it would have been possible without the 
  incredible OpenSource community in particular:
  
  - http://jream.com/lab
  - http://getbootstrap.com/
  - http://www.chartjs.org/
  - https://jquery.com/
  - http://www.jamieking.co.uk/
  - http://opensource.org/licenses/MIT
  - http://www.freepik.com/
  - http://stackoverflow.com/

  "Standing on the shoulders of giants" ...
  Many thanks - Eamonn Killian


  PS: Remember to change the config files Database.php and Paths.php to get this code to work!!

-->
<html>
    <head>
        <title>MSP Cost Model</title>
        <meta charset="UTF-8">
        <meta name="keywords" content="cost, financial, pricing, modelling, model"/>
        <meta name="viewport" content="width=device-width">
        <link type="text/css" rel="stylesheet" href="<?php echo URL; ?>css/libs/jquery-ui-1.10.4.custom.min.css">  
        <link type="text/css" rel="stylesheet" href="<?php echo URL; ?>css/public/mspCostModel.css">  
        <script type="text/javascript" src="<?php echo URL; ?>js/libs/jquery.min.2-1-0.js"></script>
        <script type="text/javascript" src="<?php echo URL; ?>js/libs/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="<?php echo URL; ?>js/public/slide-description.js"></script>

        <?php
        if (isset($this->js)) {
            foreach ($this->js as $js) {
                echo '<script type="text/javascript" src="' . URL . $js . '"></script>';
            }
        }
        if (isset($this->crypto)) {
            foreach ($this->crypto as $crypto) {
                echo '<script type="text/javascript" src="' . URL . $crypto . '"></script>';
            }
        }
        if (isset($this->css)) {
            foreach ($this->css as $css) {
                echo '<link type="text/css" rel="stylesheet" href="' . URL . $css . '">';
            }
        }
        
        ?>
    </head>
    <body>
        <nav class="menu push-menu-right">
            <ul>
                <li class="close-menu">&rarr;</li>
                <li class="li-header">Baseline Information</li>
                <?php
                if ($_SESSION['Admin']) {
                    echo "<li><a href='" . URL . "usermgmt/index'>User Management</a></li>";
                }
                ?>
                <li><a href="<?php echo URL; ?>aboutus/index">Company Information</a></li>
                <li><a href="<?php echo URL; ?>customers/index">Customer Information</a></li>
                <li><a href="<?php echo URL; ?>cloudprovider/index">Cloud Providers</a></li>
                <li><a href="<?php echo URL; ?>external/index">External Cost Variables</a></li>
                <li class="li-header">Direct Cost Components</li>
                <li><a href="<?php echo URL; ?>dcassets/index">Data Center Costs</a></li>
                <li><a href="<?php echo URL; ?>offices/index">Office Costs</a></li>
                <li><a href="<?php echo URL; ?>labour/index">Labour Costs</a></li>
                <li><a href="<?php echo URL; ?>network/index">Network Costs</a></li>
                <li><a href="<?php echo URL; ?>enduser/index">End User Costs</a></li>
                <li><a href="<?php echo URL; ?>server/index">Server Costs</a></li>
                <li><a href="<?php echo URL; ?>storage/index">Storage Costs</a></li>
                <li><a href="<?php echo URL; ?>printer/index">Printer Costs</a></li>
                <li><a href="<?php echo URL; ?>software/index">Software Costs</a></li>
                <li><a href="<?php echo URL; ?>cloud/index">Cloud Provider Costs</a></li>
                <li class="li-header">Indirect Cost Components</li>
                <li><a href="<?php echo URL; ?>product/index">Product Development</a></li>
                <li><a href="<?php echo URL; ?>marketing/index">Marketing Management</a></li>
                <li><a href="<?php echo URL; ?>sales/index">Sales Management</a></li>
                <li><a href="<?php echo URL; ?>channel/index">Channel Management</a></li>
                <li><a href="<?php echo URL; ?>contract/index">Contractual Obligations</a></li>
                <li class="li-header">Review & Reporting</li>
                <li><a href="<?php echo URL; ?>costs/index">Cost Overview</a></li>
                <li><a href="<?php echo URL; ?>ourproducts/index">Build the Product Catalogue</a></li>
                <li><a href="<?php echo URL; ?>allocations/index">Sales Forecasting</a></li>
                <li><a href="#">Resources Current Usage</a></li>
                <li><a href="#">Management Reporting</a></li>
            </ul>
        </nav><!-- /push menu right -->
        <div id="outer-wrapper">
            <?php Session::init(); ?>
            <?php if (Session::get('loggedIn') == true): ?>
                <button id="menu-show" class="nav-toggler toggle-push-right"><img src="<?php echo URL; ?>img/menu.png" width="40" height="30"/></button>
                <script src="<?php echo URL; ?>js/libs/classie.js"></script>
                <script src="<?php echo URL; ?>js/libs/nav.js"></script>
            <?php endif; ?>  
            <div id="wrapper">    

                <div id="divider-bar"></div>
                <div id="top-banner">
                    <div id="top-banner-left">
                        <div id="top-banner-left-inner">
                            <span id="span-logo">Cost Modeller</span><br/>
                            By //EJK
                        </div>
                    </div>
                    <div id="top-banner-right">
                        <!--- put menu in here --->
                        <div id="top-banner-right-inner">
                            <ul>
                                <li><a href='<?php echo URL; ?>index'>HOME</a></li>
                                <?php if (Session::get('loggedIn') == true): ?>
                                    <li><a href='<?php echo URL; ?>dashboard/logout'>LOGOUT</a>&nbsp</li>
                                    <!--<li><a href='<?php echo URL; ?>dashboard/index'>DASHBOARD</a>&nbsp</li>-->
                                <?php else: ?>
                                    <li><a href='<?php echo URL; ?>login'>LOGIN</a>&nbsp</li>
                                    <li><a href='<?php echo URL; ?>register'>REGISTER</a>&nbsp</li>
                                <?php endif; ?>  



                                <li><a href='<?php echo URL; ?>help'>HELP</a></li>
                                <li><a href='#' onClick="parent.location = 'mailto:eamonnkillian@gmail.com?subject=Getting in touch...'">MESSAGE</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="divider-bar1"></div>
                
                
                
                
                
                
                
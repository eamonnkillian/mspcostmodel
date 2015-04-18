<?php

function getTotalPotentialVMs() {
    $serverDataArray = array("intel_servers", "amd_servers", "power_servers", "mainframe_servers");
    $numberofphysicalcores = 0;
    $vcpuPerpcpu = 8;

    foreach ($serverDataArray as $value) {
        $statement = "SELECT server_number_processors * server_number_cores_per_processor * server_qty FROM " . $value . " where ASSIGNMENT='production';";
        $data = new Allocations_Model();
        $array = $data->runQuery($statement);
        foreach ($array as $piece) {
            foreach ($piece as $key => $value) {
                $numberofphysicalcores += $value;
            }
        }
    }

    return $numberofphysicalcores * $vcpuPerpcpu;
}

function getTotalGBsofStorage() {
    $storageDataArray = array("flash_storage", "nas_storage", "san_storage");
    $amountofphysicalStorageTBs = 0;

    foreach ($storageDataArray as $value) {
        if ($value === "san_storage") {
            $statement = "SELECT san_formatted_capacity_TB * san_storage_qty FROM " . $value . " where ASSIGNMENT='production';";
        } else if ($value === "nas_storage") {
            $statement = "SELECT nas_formatted_capacity_TB FROM * nas_storage_qty " . $value . " where ASSIGNMENT='production';";
        } else if ($value === "flash_storage") {
            $statement = "SELECT flash_formatted_capacity_TB FROM * flash_storage_qty" . $value . " where ASSIGNMENT='production';";
        }
        $data = new Allocations_Model();
        $array = $data->runQuery($statement);
        foreach ($array as $piece) {
            foreach ($piece as $key => $value) {
                $amountofphysicalStorageTBs += $value;
            }
        }
    }

    return $amountofphysicalStorageTBs * 1024;
}

function getTotalMBsofMemory() {
    $serverDataArray = array("intel_servers", "amd_servers", "power_servers", "mainframe_servers");
    $amountofphysicalmemoryGBs = 0;

    foreach ($serverDataArray as $value) {
        $statement = "SELECT server_memory_GB * server_qty FROM " . $value . " where ASSIGNMENT='production';";
        $data = new Allocations_Model();
        $array = $data->runQuery($statement);
        foreach ($array as $piece) {
            foreach ($piece as $key => $value) {
                $amountofphysicalmemoryGBs += $value;
            }
        }
    }

    return $amountofphysicalmemoryGBs * 1024;
}

function getTotalBandwidth() {
    $totalbandwidth = 0;
    $statement = "SELECT bandwidth_available_gbps FROM bandwidth WHERE assignment='production';";
    $data = new Allocations_Model();
    $array = $data->runQuery($statement);
    foreach ($array as $piece) {
        foreach ($piece as $key => $value) {
            $totalbandwidth += ($value * 1024);
        }
    }

    return $totalbandwidth;
}

function getTotalPersonDays() {
    $totalpersondays = 0;
    $standardPersonDaysPerAnnum = 160;
    $statement = "SELECT numbers_of_this_employee FROM labour WHERE employee_type='On-site Performer';;";
    $data = new Allocations_Model();
    $array = $data->runQuery($statement);
    foreach ($array as $piece) {
        foreach ($piece as $key => $value) {
            $totalpersondays += ($value * $standardPersonDaysPerAnnum);
        }
    }

    return $totalpersondays;
}

function getOverSubscriptionRatio() {
    $oversubscription = 0;
    $statement = "SELECT over_subscription_ratio FROM aboutus;";
    $data = new Allocations_Model();
    $array = $data->runQuery($statement);
    foreach ($array as $piece) {
        foreach ($piece as $key => $value) {
            $oversubscription += $value;
        }
    }

    return $oversubscription;
}

function getUsedVMs() {
    $numberofusedVMs = 0;
    $vcpuPerpcpu = 8;
    $coresUsedArray = array();

    $productsArray = array("iaas_virtual_machine_products", "iaas_physical_machine_products", "paas_service_products", "saas_service_products", "byod_service_products");

    foreach ($productsArray as $item) {
        $statement = "SELECT product_name FROM " . $item . ";";
        $data = new Allocations_Model();
        $array = $data->runQuery($statement);
        foreach ($array as $piece) {
            foreach ($piece as $key => $value) {
                if ($item === "iaas_physical_machine_products") {
                    $statement1 = "SELECT amount_of_physical_cores FROM " . $item . " WHERE product_name='" . $value . "' AND product_source='Internal_Infrastructure';";
                    $data1 = new Allocations_Model();
                    $array1 = $data1->runQuery($statement1);
                    $productQty = $array1[0]['amount_of_physical_cores'] * $vcpuPerpcpu;
                } else {
                    $statement1 = "SELECT amount_of_VMs FROM " . $item . " WHERE product_name='" . $value . "' AND product_source='Internal_Infrastructure';";
                    $data1 = new Allocations_Model();
                    $array1 = $data1->runQuery($statement1);
                    $productQty = $array1[0]['amount_of_VMs'];
                }

                $statement1 = "SELECT product_name,SUM(purchased_qty) FROM " . $item . "_sales WHERE product_name='" . $value . "' GROUP BY product_name;";
                $data1 = new Allocations_Model();
                $array1 = $data1->runQuery($statement1);
                $purchasedQty = $array1[0]['SUM(purchased_qty)'];

                $numberofusedVMs += $productQty * $purchasedQty;
            }
        }
    }
    return $numberofusedVMs;
}

function getUsedMBs() {
    $numberofusedMBs = 0;
    $productsArray = array("iaas_virtual_machine_products", "iaas_virtual_SAN_products", "iaas_virtual_NAS_products", "iaas_physical_machine_products", "iaas_physical_NAS_products", "iaas_physical_SAN_products", "paas_service_products", "saas_service_products", "byod_service_products");

    foreach ($productsArray as $item) {
        $statement = "SELECT product_name FROM " . $item . ";";
        $data = new Allocations_Model();
        $array = $data->runQuery($statement);
        foreach ($array as $piece) {
            foreach ($piece as $key => $value) {
                $statement1 = "SELECT amount_of_memory_MBs FROM " . $item . " WHERE product_name='" . $value . "' AND product_source='Internal_Infrastructure';";
                $data1 = new Allocations_Model();
                $array1 = $data1->runQuery($statement1);
                $productQty = $array1[0]['amount_of_memory_MBs'];

                
                $statement1 = "SELECT product_name,SUM(purchased_qty) FROM " . $item . "_sales WHERE product_name='" . $value . "' GROUP BY product_name;";
                $data1 = new Allocations_Model();
                $array1 = $data1->runQuery($statement1);
                $purchasedQty = $array1[0]['SUM(purchased_qty)'];

                $numberofusedMBs += $productQty * $purchasedQty;
            }
        }
    }

    return $numberofusedMBs;
}

function getUsedGBs() {
    $productsArray = array("iaas_virtual_machine_products", "iaas_virtual_SAN_products", "iaas_virtual_NAS_products", "iaas_physical_machine_products", "iaas_physical_NAS_products", "iaas_physical_SAN_products", "paas_service_products", "saas_service_products", "byod_service_products");
    $numberofusedGBs = 0;

    foreach ($productsArray as $item) {
        $statement = "SELECT product_name FROM " . $item . ";";
        $data = new Allocations_Model();
        $array = $data->runQuery($statement);
        foreach ($array as $piece) {
            foreach ($piece as $key => $value) {
                $statement1 = "SELECT amount_of_storage_GBs FROM " . $item . " WHERE product_name='" . $value . "' AND product_source='Internal_Infrastructure';";
                $data1 = new Allocations_Model();
                $array1 = $data1->runQuery($statement1);
                $productQty = $array1[0]['amount_of_storage_GBs'];

                $statement1 = "SELECT product_name,SUM(purchased_qty) FROM " . $item . "_sales WHERE product_name='" . $value . "' GROUP BY product_name;";
                $data1 = new Allocations_Model();
                $array1 = $data1->runQuery($statement1);
                $purchasedQty = $array1[0]['SUM(purchased_qty)'];

                $numberofusedGBs += $productQty * $purchasedQty;
            }
        }
    }

    return $numberofusedGBs;
}

function getUsedBandwidth() {
    $numberofusedMbps = 0;
    $statement = "SELECT product_name FROM bandwidth_service_products;";
    $data = new Allocations_Model();
    $array = $data->runQuery($statement);
    foreach ($array as $piece) {
        foreach ($piece as $key => $value) {
            $statement1 = "SELECT amount_of_bandwidth FROM bandwidth_service_products WHERE product_name='" . $value . "' AND product_source='Internal_Infrastructure';";
            $data1 = new Allocations_Model();
            $array1 = $data1->runQuery($statement1);
            $productQty = $array1[0]['amount_of_bandwidth'];
            
            $statement1 = "SELECT product_name,SUM(purchased_qty) FROM bandwidth_service_products_sales WHERE product_name='" . $value . "' GROUP BY product_name;";
            $data1 = new Allocations_Model();
            $array1 = $data1->runQuery($statement1);
            $purchasedQty = $array1[0]['SUM(purchased_qty)'];

            $numberofusedMbps += $productQty * $purchasedQty;
        }
    }
    return $numberofusedMbps;
}

function getUsedPersonDays() {
    $numberofPersonDaysUsed = 0;
    $statement = "SELECT product_name FROM consulting_service_products;";
    $data = new Allocations_Model();
    $array = $data->runQuery($statement);
    foreach ($array as $piece) {
        foreach ($piece as $key => $value) {
            $statement1 = "SELECT amount_of_person_days FROM consulting_service_products WHERE product_name='" . $value . "';";
            $data1 = new Allocations_Model();
            $array1 = $data1->runQuery($statement1);
            $productQty = $array1[0]['amount_of_person_days'];
            
            $statement1 = "SELECT product_name,SUM(purchased_qty) FROM consulting_service_products_sales WHERE product_name='" . $value . "' GROUP BY product_name;";
            $data1 = new Allocations_Model();
            $array1 = $data1->runQuery($statement1);
            $purchasedQty = $array1[0]['SUM(purchased_qty)'];
            
            $numberofPersonDaysUsed += $productQty * $purchasedQty;
        }
    }
    return $numberofPersonDaysUsed;
}

?>



<div id="allocationsMain">


    <div id="TopBanner">
        <div id="BannerLeft">
            <h2>Product Sales Forecasting</h2>
        </div>
        <div id="BannerRight">
            <span id="header">Available Internal Resources Capacity</span>
            <table>
                <tr>
                    <th>Virtual Machines</th>
                    <th>Memory (MBs)</th>
                    <th>Storage (GBs)</th>
                    <th>Bandwidth (Mbps)</th>
                    <th>Person Days</th>
                </tr>
                <tr>
                    <td id="totalVMsAvailable">
                        <?php
                        $numberofVMs = getTotalPotentialVMs();
                        $usedVMs = getUsedVMs();
                        $oversubscription = getOverSubscriptionRatio();
                        $numberavailable = ($numberofVMs * $oversubscription) - $usedVMs;
                        echo number_format($numberavailable, 0);
                        ?>
                    </td>
                    <td id="totalMBsAvailable">
                        <?php
                        $numberofMBs = getTotalMBsofMemory() * $oversubscription;
                        $usedMBs = getUsedMBs();
                        echo number_format(($numberofMBs - $usedMBs), 0);
                        ?>
                    </td>
                    <td id="totalGBsAvailable">
                        <?php
                        $numberofGBs = getTotalGBsofStorage() * $oversubscription;
                        $numberUsedGBs = getUsedGBs();
                        echo number_format(($numberofGBs - $numberUsedGBs), 0);
                        ?>
                    </td>
                    <td id="totalBandwidthAvailable">
                        <?php
                        $bandwidth = getTotalBandwidth() * $oversubscription;
                        $numberUsedMbps = getUsedBandwidth();
                        echo number_format(($bandwidth-$numberUsedMbps), 0);
                        ?>
                    </td>
                    <td id="totalPersonDaysAvailable">
                        <?php
                        $numberofPersonDays = getTotalPersonDays() * $oversubscription;
                        $numberofusedDays = getUsedPersonDays();
                        echo number_format(($numberofPersonDays-$numberofusedDays), 0);
                        ?>
                    </td>
                </tr>
            </table>  


        </div>
    </div>

    <div id="allocationsMainScreen">
        <div id="allocationsMainMIDMainSectionLHS">
            <form id="allocationsFormDelete" method="post" action="ajax_allocationsShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <div id="dropdownPosition">
                    <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                    <p>
                        <select id="allocationsSelect" name="list" class="allocationsInputSel">
                            <option selected value="">Choose a Product Type ...</option>
                            <option value="iaas_virtual_machine_products_sales">IaaS Virtual Machines Sales</option>
                            <option value="iaas_virtual_nas_products_sales">IaaS Virtual NAS Storage Sales</option>
                            <option value="iaas_virtual_san_products_sales">IaaS Virtual SAN Storage Sales</option>
                            <option value="iaas_physical_machine_products_sales">IaaS Physical Machines Sales</option>
                            <option value="iaas_physical_nas_products_sales">IaaS Physical NAS Storage Sales</option>
                            <option value="iaas_physical_san_products_sales">IaaS Physical SAN Storage Sales</option>
                            <option value="paas_service_products_sales">PaaS Services Sales</option>
                            <option value="saas_service_products_sales">SaaS Services Sales</option>
                            <option value="byod_service_products_sales">BYOD Services Sales</option>
                            <option value="voip_service_products_sales">VoIP Services Sales</option>
                            <option value="bandwidth_service_products_sales">Bandwidth Services Sales</option>
                            <option value="backup_service_products_sales">Backup Services Sales</option>
                            <option value="security_service_products_sales">Security Services Sales</option>
                            <option value="consulting_service_products_sales">Consulting Services Sales</option>
                        </select>
                    </p>
                </div>
                <div id="allocationsMenu">
                    <div class="allocationsSelector">
                        <input class="allocationsInputSubmit" id="allocationsMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="allocationsSelector">
                        <input class="allocationsInputSubmit" id="allocationsMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="allocationsSelector"> 
                        <input class="allocationsInputSubmit" id="allocationsMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="allocationsSelector">
                        <input class="allocationsInputSubmit" id="allocationsMenuChoiceDelete" type="button" value="Delete"/>
                    </div>
                </div>
            </form>
        </div>
        <div id="allocationsMainMIDMainSectionRHS">
            <div id="allocationsFormforAdd"></div>


        </div>       
    </div>

</div>

<div id="costsMain">
    <div id="costsMainMID">

        <input type="hidden" id="toggleItem" name="toggleItem" value=""/>
        <input type="hidden" id="toggleItemMinor" name="toggleItemMinor" value=""/>
        <h1>Total Costs Review</h1>
        The following sections provide a review of the total costs for the provision of services. Those
        costs are identified across the seven categories of:
        <ul>
            <li>Technology & Labour Costs</li>
            <li>Externally Influenced Costs</li>
            <li>Product Development Costs</li>
            <li>Marketing Costs</li>
            <li>Sales Costs</li>
            <li>Channel Costs</li>
            <li>Contractual Obligations Costs</li>
        </ul>
        <h1>Year 1 Costs Overview: Cost Components as Percentage of Total</h1>
        <!-- Unreserved and many many thanks to the brilliant jqBarGraph found at www.workshop.rs/jqbargraph -->
        <!-- Unreserved and many many thanks also to the brilliant Chart.js found at www.chartjs.org -->
        <div class="blockGap">&nbsp;</div>
        <br/>
        <div id="theGraph">
            <div id='exampleSimple'></div>
            <div class='exampleMenu'>
                <ul>
                    <li><a href='javascript:void(0);' id='simpleSortAsc'>Sort Ascending</a></li>
                    <li><a href='javascript:void(0);' id='simpleSortDesc'>Sort Descending</a></li>
                    <li><a href='javascript:void(0);' id='simplePositionTop'>From Top Position</a></li>
                    <li><a href='javascript:void(0);' id='simpleClear'>Standard</a></li>
                </ul>
            </div>
            <script type='text/javascript' src='../js/libs/jqBarGraph.1.1.min.js'></script>
            <script type='text/javascript' src='../js/libs/Chart.js'></script>
        </div>

        <div class="blockGap">&nbsp;</div>
        <hr/>

        <h1>Baseline Costs</h1>

        <?php

        function produceName($arg) {
            $formattedString = str_replace('_', ' ', $arg);
            $formattedString = ucwords($formattedString);
            return $formattedString;
        }

        function findCostElement($string, $findbit) {
            $cutstring = substr($string, 0, strpos($string, $findbit));
            return $cutstring;
        }

        function buildTotalCostArray($costs, $opex) {
            $year1 = $costs;
            $year2plus = $costs - $opex;
            
            $newarray = array();
            for ($i = 2014; $i < 2021; $i++) {
                if ($i === 2014) {
                    $newarray[$i] = $costs;
                } else {
                    $newarray[$i] = $year2plus;
                }
            }
            return $newarray;
        }

        function addArrays($array1, $array2) {
            $newarray = array();
            foreach ($array1 as $key => $value) {
                $newarray[$key] = ($value + $array2[$key]);
            }
            return $newarray;
        }

        function addLinearlyToArray($array1, $array2) {
            $newarray = array();
            $total = 0;
            foreach ($array2 as $key => $value) {
                $total += $value;
            }
            foreach ($array1 as $key => $value) {
                $newarray[$key] = ($value + $total);
            }
            return ($newarray);
        }

        function getCertsCostsPerAnnum($array) {
            $total = 0;
            foreach ($array as $key => $value) {
                $total += $value;
            }
            return ($total);
        }

        function addPercentArrays($array1, $array2) {
            $newarray = array();
            foreach ($array1 as $key => $value) {
                $newarray[$key] = $value + ($value * ($array2[$key] / 100));
            }
            return $newarray;
        }

        function inflationArray($array1, $array2) {
            $newarray = array();
            foreach ($array1 as $key => $value) {
                if ($key === "2014") {
                    $newarray[$key] = $value;
                } else {
                    $newarray[$key] = $value + ($value * ($array2[$key - 1] / 100));
                }
            }
            return $newarray;
        }

        function createGraphNumbers($graph) {
            $costNumbers = array();
            $graphNumbers = array();
            $count = count($graph) - 1;

            for ($i = $count; $i >= 0; $i--) {
                $element = $graph[$i] - $graph[$i - 1];
                array_push($costNumbers, $element);
            }

            foreach ($costNumbers as $value) {
                $num = (($value / $graph[$count]) * 100);
                $numForm = number_format($num, 2);
                array_push($graphNumbers, $numForm);
            }

            return $graphNumbers;
        }

        function createTable($array, $name, $reportCurrency, $rate, $originaltotalcosts, $thesecosts) {
            $tableString .= "<hr><div class='innerDisplay'><strong>Adjusted Total Costs including " . ucwords($name) . " in " . $reportCurrency . " is: </strong><br/>";
            $tableString .= "<table><tr><td class='emptyTH'></td>";
            foreach ($array as $key => $value) {
                $tableString .= "<th>" . $key . "</th>";
            }
            $tableString .= "</tr><tr><th>Origin Cost</th>";
            foreach ($originaltotalcosts as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr><tr><th>" . ucwords($name) . "</th>";
            foreach ($thesecosts as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr><tr><th>Cumulative Costs</th>";
            foreach ($array as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr></table></div>";
            return $tableString;
        }

        function createTableLinear($array, $name, $reportCurrency, $rate, $originaltotalcosts, $linearcosts) {
            $tableString .= "<hr><div class='innerDisplay'><strong>Adjusted Total Costs including " . ucwords($name) . " in " . $reportCurrency . " is: </strong><br/>";
            $tableString .= "<table><tr><td class='emptyTH'></td>";
            $count = 0;
            foreach ($array as $key => $value) {
                $tableString .= "<th>" . $key . "</th>";
            }
            $tableString .= "</tr><tr><th>Origin Cost</th>";
            foreach ($originaltotalcosts as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
                $count++;
            }
            $tableString .= "</tr><tr><th>" . ucwords($name) . "</th>";
            for ($i = 0; $i < $count; $i++) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($linearcosts, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr><tr><th>Cumulative Costs</th>";
            foreach ($array as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr></table></div>";
            return $tableString;
        }

        function createPercentTable($array, $name, $reportCurrency, $rate, $originaltotalcosts, $thesecosts) {
            $tableString .= "<hr><div class='innerDisplay'><strong>Adjusted Total Costs including " . ucwords($name) . " in " . $reportCurrency . " is: </strong><br/>";
            $tableString .= "<table><tr><td class='emptyTH'></td>";
            foreach ($array as $key => $value) {
                $tableString .= "<th>" . $key . "</th>";
            }
            $tableString .= "</tr><tr><th>Origin Cost</th>";
            foreach ($originaltotalcosts as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr><tr><th>" . ucwords($name) . "</th>";
            foreach ($thesecosts as $key => $value) {
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . " %</td>";
            }
            $tableString .= "</tr><tr><th>Cumulative Costs</th>";
            foreach ($array as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td>" . number_format($value, 2, '.', ',') . "</td>";
            }
            $tableString .= "</tr></table></div>";
            return $tableString;
        }

        function createFinalTable($array, $name, $reportCurrency, $rate) {
            $tableString .= "<hr><div class='innerDisplay'><strong>" . ucwords($name) . " in " . $reportCurrency . " is: </strong><br/>";
            $tableString .= "<table><tr><td class='emptyTH'></td>";
            foreach ($array as $key => $value) {
                $tableString .= "<th>" . $key . "</th>";
            }
            $tableString .= "</tr><tr><th nowrap>Final Costs</th>";
            foreach ($array as $key => $value) {
                if ($reportCurrency !== "GBP") {
                    $value = $value * $rate;
                }
                $tableString .= "<td><strong>" . number_format($value, 2, '.', ',') . "<strong></td>";
            }

            $tableString .= "</tr></table></div>";
            return $tableString;
        }

        function getCurrentCurrency($tableName) {
            $costs = new Costs_Model();
            $currentcurrency = $costs->getCurrentCurrency($tableName);
            return $currentcurrency;
        }

        function getReportingCurrency() {
            $statement = "SELECT currency FROM aboutus;";
            $costs = new Costs_Model();
            $array = $costs->runQuery($statement);
            foreach ($array as $piece) {
                foreach ($piece as $key => $value) {
                    $currency = $value;
                }
            }
            return $currency;
        }

        function getExternal($tableName) {
            $statement = "SELECT * FROM $tableName;";
            $costs = new Costs_Model();
            $array = $costs->runQuery($statement);
            $externalValues = array();
            foreach ($array as $piece) {
                foreach ($piece as $key => $value) {
                    if ($key !== "id" && $key !== "lastupdatedby" && $key !== "lastupdated" && $key !== "original_currency") {
                        $externalValues[$key] = $value;
                    }
                }
            }
            return $externalValues;
        }

        function getConversionRate($currency) {
            $statement = "SELECT $currency FROM fx;";
            $costs = new Costs_Model();
            $array = $costs->runQuery($statement);
            foreach ($array as $piece) {
                foreach ($piece as $key => $value) {
                    $conversionrate = $value;
                }
            }
            return $conversionrate;
        }

        function gbpEntries($element) {
            $entries = getExternal($element);
            $currentcurrency = getCurrentCurrency($element);
            if ($currentcurrency !== "GBP") {
                $conversiontoGBP = getConversionRate($currentcurrency);
                foreach ($entries as $key => $value) {
                    $gbpValue = $value / $conversiontoGBP;
                    $entries[$key] = $gbpValue;
                }
            }
            return $entries;
        }

        function getTotalPotentialVMs() {
                $serverDataArray = array("intel_servers","amd_servers","power_servers","mainframe_servers");
                $numberofphysicalprocessors = 0;
                $numberofphysicalcoresperprocessor = 0;
                $vcpuPerpcpu = 8;

                foreach($serverDataArray as $value) {
                    $statement = "SELECT server_number_processors FROM ".$value." where ASSIGNMENT='production';";
                    $data = new Costs_Model();
                    $array = $data->runQuery($statement);
                    foreach ($array as $piece) {
                        foreach ($piece as $key => $value) {
                        $numberofphysicalprocessors += $value;
                        }
                    }
                }

                foreach($serverDataArray as $value) {
                    $statement = "SELECT server_number_cores_per_processor FROM ".$value." where ASSIGNMENT='production';";
                    $data = new Costs_Model();
                    $array = $data->runQuery($statement);
                    foreach ($array as $piece) {
                        foreach ($piece as $key => $value) {
                        $numberofphysicalcoresperprocessor += $value;
                        }
                    }
                }
                return $numberofphysicalprocessors*$numberofphysicalcoresperprocessor*$vcpuPerpcpu;
            }
            
            function getTotalPlainPotentialGBs() {
                $storageDataArray = array("san_storage","nas_storage");
                $numberofusableTBs = 0;
                foreach($storageDataArray as $value) {
                    if ($value === "san_storage") {
                        $statement = "SELECT san_formatted_capacity_TB FROM ".$value." where ASSIGNMENT='production';";
                    } else {
                        $statement = "SELECT nas_formatted_capacity_TB FROM ".$value." where ASSIGNMENT='production';";
                    }
                    
                    $data = new Costs_Model();
                    $array = $data->runQuery($statement);
                    foreach ($array as $piece) {
                        foreach ($piece as $key => $value) {
                        $numberofusableTBs += $value;
                        }
                    }
                }
                return $numberofusableTBs*1024;
            }

        function getDCCosts($table) {

            $costs = new Costs_Model();
            $tabarray = $costs->getLocations($table);
            $totaldccosts = 0;
            $insertString = "";
            $totaldccapexcosts = 0;

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;
                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where assets_location='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);
                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if (stripos($ky, "cost") !== false) {
                            $stringPiece = findCostElement($ky, "_cost");

                            if (strpos($ky, "depreciation") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "maintenance") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "insurance") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "_KWH") !== FALSE) {
                                $quantityofelement = $allthebits[0][$stringPiece . "_qty"];
                                $annualcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            } else {
                                $quantityofelement = $allthebits[0][$stringPiece . "_qty"];
                                $capexcharge += ($va * $quantityofelement);
                                $capexaccumulator += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            }
                        }
                    }

                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totaldccosts += $costaccumulator;
                        $totaldccapexcosts += $capexaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totaldccosts += $costaccumulator / $conversionrate;
                        $totaldccapexcosts += $capexaccumulator / $conversionrate;
                    }
                }
            }
            return array($totaldccosts, $insertString, $totaldccapexcosts);
        }

        function getOfficeCosts($table) {

            $costs = new Costs_Model();
            $tabarray = $costs->getOffices($table);
            $totalofficecosts = 0;
            $totalofficecapexcosts = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where office_name='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);
                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if (stripos($ky, "cost") !== false) {
                            $stringPiece = findCostElement($ky, "_cost");

                            if (strpos($ky, "depreciation") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "system") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "maintenance") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "panel") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "insurance") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "furniture") !== FALSE) {
                                $capexcharge += $va;
                                $capexaccumulator += $va;
                                $costaccumulator += $va;
                            } else {
                                $quantityofelement = $allthebits[0][$stringPiece . "_qty"];
                                $capexcharge += ($va * $quantityofelement);
                                $capexaccumulator += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            }
                        }
                    }
                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totalofficecosts += $costaccumulator;
                        $totalofficecapexcosts += $capexaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totalofficecosts += $costaccumulator / $conversionrate;
                        $totalofficecapexcosts += $capexaccumulator / $conversionrate;
                    }
                }
            }
            return array($totalofficecosts, $insertString, $totalofficecapexcosts);
        }

        function getLabourCosts($table) {

            $costs = new Costs_Model();
            $tabarray = $costs->getLabour($table);
            $totallabourcosts = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where employee_category='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);
                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if ($ky === "salary") {
                            $salary = $va;
                        }

                        if ($ky === "numbers_of_this_employee") {
                            $qty = $va;
                        }

                        if ($ky !== "employee_category" && $ky !== "id" && $ky !== "lastupdatedby" && $ky !== "lastupdated" && $ky !== "numbers_of_this_employee") {

                            if (strpos($ky, "allocation") !== FALSE) {
                                $annualcharge += ($salary * ($va / 100));
                                $costaccumulator += ($salary * ($va / 100));
                            } else {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            }
                        }
                    }
                    $capexcharge = $capexcharge * $qty;
                    $annualcharge = $annualcharge * $qty;
                    $costaccumulator = $costaccumulator * $qty;
                    $insertString .= "There are " . $qty . " of " . $value . "'s employed currently<br/>";
                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total Annual Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totallabourcosts += $costaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totallabourcosts += $costaccumulator / $conversionrate;
                    }
                }
            }
            return array($totallabourcosts, $insertString);
        }

        function getHWCosts($table) {
            $costs = new Costs_Model();
            $tabarray = $costs->getHWTypes($table);
            $totalhwcosts = 0;
            $totalhwcapexcost = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {

                    $statement = "select * from " . $table . " where " . $table . "_type='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);
                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if (stripos($ky, "cost") !== false) {
                            $stringPiece = findCostElement($ky, "_cost");
                            $quantityofelement = $allthebits[0][$table . "_qty"];
                            if (strpos($ky, "depreciation") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "system") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "maintenance") !== FALSE) {
                                $annualcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            } else if (strpos($ky, "airtime") !== FALSE) {
                                $annualcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            } else if (strpos($ky, "panel") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "insurance") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else {
                                $capexcharge += ($va * $quantityofelement);
                                $capexaccumulator += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            }
                        }
                    }

                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";
                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totalhwcosts += $costaccumulator;
                        $totalhwcapexcost += $capexaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totalhwcosts += $costaccumulator / $conversionrate;
                        $totalhwcapexcost += $capexaccumulator / $conversionrate;
                    }
                }
            }
            return array($totalhwcosts, $insertString, $totalhwcapexcost);
        }

        function getSWCosts($table) {
            $costs = new Costs_Model();
            $tabarray = $costs->getSWTypes($table);
            $totalswcosts = 0;
            $totalswcapexcosts = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where software_type='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);

                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if (stripos($ky, "cost") !== false) {
                            $stringPiece = findCostElement($ky, "_cost");
                            $quantityofelement = $allthebits[0]["software_licences_qty"];
                            if (strpos($ky, "depreciation") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "maintenance") !== FALSE) {
                                $annualcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            } else if (strpos($ky, "subscription") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else {
                                $capexcharge += ($va * $quantityofelement);
                                $capexaccumulator += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            }
                        }
                    }
                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totalswcosts += $costaccumulator;
                        $totalswcapexcosts += $capexaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totalswcosts += $costaccumulator / $conversionrate;
                        $totalswcapexcosts += $capexaccumulator / $conversionrate;
                    }
                }
            }
            return array($totalswcosts, $insertString, $totalswcapexcosts);
        }

        function getServerCosts($table) {
            $costs = new Costs_Model();
            $tabarray = $costs->getServerTypes($table);
            $totalservercosts = 0;
            $totalservercapexcost = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where server_type='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);

                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if (stripos($ky, "cost") !== false) {
                            $stringPiece = findCostElement($ky, "_cost");
                            $quantityofelement = $allthebits[0]["server_qty"];
                            if (strpos($ky, "depreciation") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "system") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "maintenance") !== FALSE) {
                                $annualcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            } else {
                                $capexcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                                $capexaccumulator += ($va * $quantityofelement);
                            }
                        }
                    }
                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totalservercosts += $costaccumulator;
                        $totalservercapexcost += $capexaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totalservercosts += $costaccumulator / $conversionrate;
                        $totalservercapexcost += $capexaccumulator / $conversionrate;
                    }
                }
            }
            return array($totalservercosts, $insertString, $totalservercapexcost);
        }

        function getPrinterCosts($table) {
            $costs = new Costs_Model();
            $tabarray = $costs->getPrinterTypes($table);
            $totalprintercosts = 0;
            $totalprintercapexcosts = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $capexaccumulator = 0;
                $capexcharge = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where printer_type='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);

                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }

                        if (stripos($ky, "cost") !== false) {
                            $stringPiece = findCostElement($ky, "_cost");
                            $quantityofelement = $allthebits[0]["printer_qty"];
                            $quantityofcomsumables = $allthebits[0]["estimated_consumables_qty"];
                            if (strpos($ky, "depreciation") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "system") !== FALSE) {
                                $annualcharge += $va;
                                $costaccumulator += $va;
                            } else if (strpos($ky, "consumables") !== FALSE) {
                                $annualcharge += ($va * $quantityofcomsumables);
                                $costaccumulator += ($va * $quantityofcomsumables);
                            } else if (strpos($ky, "maintenance") !== FALSE) {
                                $annualcharge += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            } else {
                                $capexcharge += ($va * $quantityofelement);
                                $capexaccumulator += ($va * $quantityofelement);
                                $costaccumulator += ($va * $quantityofelement);
                            }
                        }
                    }
                    $insertString .= "CAPEX cost of $value is: " . $currency . " " . number_format($capexcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totalprintercosts += $costaccumulator;
                        $totalprintercapexcosts += $capexaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totalprintercosts += $costaccumulator / $conversionrate;
                        $totalprintercapexcosts += $capexaccumulator / $conversionrate;
                    }
                }
            }
            return array($totalprintercosts, $insertString, $totalprintercapexcosts);
        }

        function getCloudServicesCosts($table) {
            $costs = new Costs_Model();
            $tabarray = $costs->getCloudServicesCosts($table);
            $totalcloudservicesscosts = 0;
            $insertString = "";

            foreach ($tabarray as $val) {
                $costaccumulator = 0;
                $annualcharge = 0;

                foreach ($val as $key => $value) {
                    $statement = "select * from " . $table . " where " . $table . "_type ='" . $value . "';";
                    $allthebits = $costs->runQuery($statement);

                    foreach ($allthebits[0] as $ky => $va) {
                        if ($ky === "currency") {
                            $currency = $va;
                        }
                        if (stripos($ky, "cost_per_physical_machine") !== false) {
                            $physicalcostpermonth = $allthebits[0]["iaas_baseline_cost_per_physical_machine_monthly"];
                            $quantityofphysical = $allthebits[0]["iaas_anticipated_physical_machine_qty"];
                            $annualcharge += ($physicalcostpermonth * 12 * $quantityofphysical);
                            $costaccumulator += ($physicalcostpermonth * 12 * $quantityofphysical);
                        } else if (stripos($ky, "cost_per_virtual_machine") !== false) {
                            $virtualcostpermonth = $allthebits[0]["iaas_baseline_cost_per_virtual_machine_monthly"];
                            $quantityofvirtual = $allthebits[0]["iaas_anticipated_virtual_machine_qty"];
                            $annualcharge += ($virtualcostpermonth * 12 * $quantityofvirtual);
                            $costaccumulator += ($virtualcostpermonth * 12 * $quantityofvirtual);
                        } else if (stripos($ky, "cost_per_virtual_storage") !== false) {
                            $virtualcostpermonth = $allthebits[0]["iaas_baseline_cost_per_virtual_storage_monthly"];
                            $quantityofvirtual = $allthebits[0]["iaas_anticipated_virtual_storage_qty"];
                            $annualcharge += ($virtualcostpermonth * 12 * $quantityofvirtual);
                            $costaccumulator += ($virtualcostpermonth * 12 * $quantityofvirtual);
                        } else if (stripos($ky, "cost_per_physical_storage") !== false) {
                            $physicalcostpermonth = $allthebits[0]["iaas_baseline_cost_per_physical_storage_monthly"];
                            $quantityofphysical = $allthebits[0]["iaas_anticipated_physical_storage_qty"];
                            $annualcharge += ($physicalcostpermonth * 12 * $quantityofphysical);
                            $costaccumulator += ($physicalcostpermonth * 12 * $quantityofphysical);
                        } else if (stripos($ky, "paas_baseline_cost") !== false) {
                            $paascostpermonth = $allthebits[0]["paas_baseline_cost_per_month_each"];
                            $quantityofusers = $allthebits[0]["paas_number_users"];
                            $anticipatedextras = $allthebits[0]["paas_anticipated_additional_cost_per_month_each"];
                            $annualcharge += (($paascostpermonth + $anticipatedextras) * 12 * $quantityofusers);
                            $costaccumulator += (($paascostpermonth + $anticipatedextras) * 12 * $quantityofusers);
                        } else if (stripos($ky, "saas_baseline_cost") !== false) {
                            $saascostpermonth = $allthebits[0]["saas_baseline_cost_per_month_each"];
                            $quantityofusers = $allthebits[0]["saas_number_users"];
                            $anticipatedextras = $allthebits[0]["saas_anticipated_additional_cost_per_month_each"];
                            $annualcharge += (($saascostpermonth + $anticipatedextras) * 12 * $quantityofusers);
                            $costaccumulator += (($saascostpermonth + $anticipatedextras) * 12 * $quantityofusers);
                        }
                    }

                    $insertString .= "ANNUAL cost of $value is: " . $currency . " " . number_format($annualcharge, 2, '.', ',') . "<br/>";
                    $insertString .= "Total Anticipated YEAR 1 Cost of $value is: " . $currency . " " . number_format($costaccumulator, 2, '.', ',') . "<br/><hr>";

                    $reportCurrency = getReportingCurrency();

                    if ($currency === "GBP") {
                        $totalcloudservicesscosts += $costaccumulator;
                    } else {
                        $conversionrate = getConversionRate($currency);
                        $totalcloudservicesscosts += $costaccumulator / $conversionrate;
                    }
                }
            }
            return array($totalcloudservicesscosts, $insertString);
        }

        function makeDoughnut($array,$reportCurrency,$rate) {
            $pieColors = array("#FF0000","#FF6699","#CC66FF","#0066FF","#00CC99","#33CC33","#FFFF00","#FF6600","#FF9900","#FF3399");
            $pieString = "<div class='blockGap'></div>";
            $pieString .= "<div id='pieContainer'><canvas id='technology' width='300' height='300'></canvas>";
            $pieString .= "<div id='pieLegend'>";
            $count=0;
            $result = count($array);
            for($i=1;$i<$result;$i+=2) {
                if ($reportCurrency != "GBP") {
                    $figure = number_format($array[$i-1]*$rate,2);
                } else {
                    $figure = number_format($array[$i-1],2);
                }
                $pieString .= "<div id='legendBox' style='background-color:".$pieColors[$count]."'></div><div id='legendText'>&nbsp".$array[$i].":&nbsp <strong>".$reportCurrency."</strong>&nbsp".$figure."</div>";
                $count++;
            }
            $pieString .= "</div></div>";
            $pieString .= "<script type='text/javascript'>";
            $pieString .= "var technology = document.getElementById('technology').getContext('2d');";
            $pieString .= "var data = [";
            $count=0;
            for($i=0;$i<$result;$i+=2) {
                $pieString .= "{ value: ".$array[$i].", color: '".$pieColors[$count]."' },";
                $count++;
            }
            $pieString = rtrim($pieString, ',');
            $pieString .= "]; var pieOptions = { segmentShowStroke: true, segmentStrokeWidth : 1, segmentStrokeColor : '#fcf7ec', animateScale: true }; new Chart(technology).Doughnut(data,pieOptions);";
            $pieString .= "</script>";

            return $pieString;
        }

        function makeLineChart($array,$reportCurrency,$rate,$costpVM,$costpGB) {
            if ($reportCurrency !== "GBP") {
                $costperVM = $costpVM * $rate;
                $costperGB = $costpGB * $rate;
            } else {
                $costperVM = $costpVM;
                $costperGB = $costpGB;
            }
            
            $lineString .= "<div id='lineContainer'><canvas id='totalCostLine' width='650' height='300'></canvas>";
            $lineString .= "</div><div id='vmCosts'>Average Monthly Cost per Small VM per month<h2>$reportCurrency $costperVM</h2>Average Monthly Cost per Gigabyte per month<br/><h2>$reportCurrency $costperGB</h2></div>";
            $lineString .= "<script type='text/javascript'>";
            $lineString .= "var totalCostLine = document.getElementById('totalCostLine').getContext('2d');";
            $lineString .= "var data = { labels : [";
            foreach ($array as $key=>$value) {
                $lineString .= "'".$key."',";
            }
            $lineString = rtrim($lineString, ',');
            $lineString .= "], datasets : [{ fillColor: 'rgba(243,168,62,1)',
			strokeColor : 'rgba(220,220,220,1)',
			pointColor : 'rgba(220,220,220,1)',
			pointStrokeColor : '#fff', data : [";
            foreach ($array as $key=>$value) {
                if ($reportCurrency != "GBP") {
                    $LineNumber = number_format(($value*$rate),2,'.','');
                } else {
                    $LineNumber = number_format(($value),2,'.','');
                }
                $lineString .= "'".$LineNumber."',";
            }
            $lineString = rtrim($lineString, ',');
            $lineString .= "]}]};";
            $lineString .= "var lineOptions = {scaleLineColor : 'rgba(0,0,0,1)' };";
            $lineString .= "new Chart(totalCostLine).Line(data,lineOptions);";
            $lineString .= "</script>";

            return $lineString;
        }
        
        function writeCosts($perVM, $perGB, $lastupdatedby) {
            $costs = new Costs_Model();
            $statement = "INSERT INTO costsperUnit (`perVM`,`perGB`,`lastupdatedby`) VALUES ('".$perVM."','".$perGB."','".$lastupdatedby."');";
            $costs->runQuery($statement);
        }

        /*
         *  Main Program
         */
        $graph = array();
        $totalofallcosts = 0;
        $totalofallCAPEX = 0;
        $totalofallOPEX = 0;
        $reportCurrency = getReportingCurrency();

        if ($reportCurrency !== "GBP") {
            $rate = getConversionRate($reportCurrency);
        }

        /*
         * The arrays below are hardcoded which is unfortunate ... I originally had a simple function that grabbed the
         * elements of all cost from the database using the INFORMATION_SCHEMAs comment column ... this could be instanced
         * again easily ... I took the design decision not to on the basis that maintenance of the db is as cumbersome as
         * maintaining these arrays ... and both should be fairly static ...
         */

        $baselinesarrayTable = array("dcassets", "offices", "labour");
        $networkingarrayTable = array("switches", "routers", "loadbalancers", "accelerators", "firewalls", "telecoms"
            , "intrusion", "voipdevices", "modems", "wifiaccess", "bandwidth", "cables");
        $enduserarrayTable = array("desktop", "laptop", "tablet", "mobile_phone", "projector", "home_hub");
        $storagearrayTable = array("flash_storage", "nas_storage", "san_storage", "san_switches", "portable_drives", "tape_drives"
            , "tape_media", "spare_drives", "storage_cabling");
        $serversarrayTable = array("amd_servers", "intel_servers", "power_servers", "mainframe_servers");
        $printersarrayTable = array("handheld_printer", "label_printer", "laser_desktop", "inkjet_desktop", "dot_matrix_printer"
            , "laser_workgroup", "laser_multifunction", "wide_format", "cutsheet_production", "continuous_form");
        $softwarearrayTable = array("office_software", "desktop_software", "tablet_software", "mobile_phone_apps", "server_software",
            "helpdesk_software", "database_software", "security_software", "storage_software");
        $cloudservicesarrayTable = array("iaas_physical_machine_clouds", "iaas_virtual_machine_clouds", "iaas_virtual_storage_clouds"
            , "iaas_physical_storage_clouds", "paas_clouds", "saas_clouds");

        /*
         * Set up the baseline costs display
         */

        $baselineCostsArray = array();

        foreach ($baselinesarrayTable as $element) {
            switch ($element) {
                case($element === "dcassets"):
                    $returnArray = getDCCosts($element);

                    if ($reportCurrency === "GBP") {
                        $totaldccosts = $returnArray[0];
                        $totaldccapexcharge = $returnArray[2];
                    } else {
                        $totaldccosts = $returnArray[0] * $rate;
                        $totaldccapexcharge = $returnArray[2] * $rate;
                    }

                    $totalofallcosts += $returnArray[0];
                    $totalofallCAPEX += $returnArray[2];
                    array_push($baselineCostsArray,$totalofallcosts,"Data Center");
                    echo "<div>";
                    echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Data Centers is: " . $reportCurrency . " " . number_format($totaldccosts, 2, '.', ',') . "</strong><br/>";
                    echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totaldccapexcharge, 2, '.', ',') . "</div>";
                    echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='dcassets'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    echo "<div id='dcassets' class='itemForm'>";
                    echo $returnArray[1];
                    echo "</div></div>";
                    break;
                case($element === "offices"):
                    $returnArray = getOfficeCosts($element);

                    if ($reportCurrency === "GBP") {
                        $totalofficecosts = $returnArray[0];
                        $totalofficecapexcharge = $returnArray[2];
                    } else {
                        $totalofficecosts = $returnArray[0] * $rate;
                        $totalofficecapexcharge = $returnArray[2] * $rate;
                    }

                    $totalofallcosts += $returnArray[0];
                    $totalofallCAPEX += $returnArray[2];
                    array_push($baselineCostsArray,$totalofallcosts,"Offices");
                    echo "<div>";
                    echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Offices is: " . $reportCurrency . " " . number_format($totalofficecosts, 2, '.', ',') . "</strong><br/>";
                    echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalofficecapexcharge, 2, '.', ',') . "</div>";
                    echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='offices'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    echo "<div id='offices' class='itemForm'>";
                    echo $returnArray[1];
                    echo "</div></div>";
                    break;
                case($element === "labour"):
                    $returnArray = getLabourCosts($element);

                    if ($reportCurrency === "GBP") {
                        $totallabourcosts = $returnArray[0];
                    } else {
                        $totallabourcosts = $returnArray[0] * $rate;
                    }

                    $totalofallcosts += $returnArray[0];
                    $totalofallCAPEX += $returnArray[2];
                    array_push($baselineCostsArray,$totalofallcosts,"Labour");
                    echo "<div>";
                    echo "<hr><div class='innerDisplay'><strong>Total Annual Costs for all Labour / Employees is: " . $reportCurrency . " " . number_format($totallabourcosts, 2, '.', ',') . "</strong></div>";
                    echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='labour'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    echo "<div id='labour' class='itemForm'>";
                    echo $returnArray[1];
                    echo "</div></div>";
                    break;
            }
        }


        /*
         * Set up the networking costs display
         */

        $totalnetworkcosts = 0;
        $totalnetworkcapexcosts = 0;
        $insertStringNetwork = "";
        foreach ($networkingarrayTable as $element) {
            switch ($element) {
                case($element === "switches"): case($element === "routers"): case($element === "loadbalancers"):
                case($element === "accelerators"): case($element === "firewalls"): case($element === "telecoms"):
                case($element === "intrusion"): case($element === "voipdevices"): case($element === "modems"):
                case($element === "wifiaccess"): case($element === "bandwidth"): case($element === "cables"):
                    $returnArray = getHWCosts($element);
                    $totalhwcosts = $returnArray[0];
                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalhwcosts * $rate;
                    } else {
                        $reportedcosts = $totalhwcosts;
                    }

                    $totalnetworkcapex = $returnArray[2];
                    $totalnetworkcosts += $totalhwcosts;
                    $totalnetworkcapexcosts += $totalnetworkcapex;
                    $totalofallcosts += $totalhwcosts;
                    $totalofallCAPEX += $totalnetworkcapex;
                    $insertStringNetwork .= "<div>";
                    $insertStringNetwork .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 Costs for all " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringNetwork .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringNetwork .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringNetwork .= $returnArray[1];
                    $insertStringNetwork .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalnetworkcosts = $totalnetworkcosts * $rate;
            $totalnetworkcapexcosts = $totalnetworkcapexcosts * $rate;
        }
        array_push($baselineCostsArray,$totalnetworkcosts,"Networking");
        echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Networking is: " . $reportCurrency . " " . number_format($totalnetworkcosts, 2, '.', ',') . "</strong><br/>";
        echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalnetworkcapexcosts, 2, '.', ',') . "</div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='networking'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='networking' class='itemForm'>";
        echo $insertStringNetwork;
        echo "</div>";

        /*
         * Set up the enduser costs display
         */

        $totalendusercosts = 0;
        $totalendusercapexcosts = 0;
        $insertStringEndUser = "";
        foreach ($enduserarrayTable as $element) {
            switch ($element) {
                case($element === "desktop"): case($element === "laptop"): case($element === "tablet"): case($element === "mobile_phone"):
                case($element === "projector"): case($element === "home_hub"): case($element === "flash_storage"):
                case($element === "nas_storage"): case($element === "san_storage"): case($element === "san_switches"):
                case($element === "portable_drives"): case($element === "tape_drives"): case($element === "tape_media"):
                case($element === "spare_drives"): case($element === "storage_cabling"):
                    $returnArray = getHWCosts($element);
                    $totalhwcosts = $returnArray[0];
                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalhwcosts * $rate;
                    } else {
                        $reportedcosts = $totalhwcosts;
                    }

                    $totalhwcapexcosts = $returnArray[2];
                    $totalendusercosts += $totalhwcosts;
                    $totalendusercapexcosts += $totalhwcapexcosts;
                    $totalofallcosts += $totalhwcosts;
                    $totalofallCAPEX += $totalhwcapexcosts;
                    $insertStringEndUser .= "<div>";
                    $insertStringEndUser .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 Costs for all " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringEndUser .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringEndUser .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringEndUser .= $returnArray[1];
                    $insertStringEndUser .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalendusercosts = $totalendusercosts * $rate;
            $totalendusercapexcosts = $totalendusercapexcosts * $rate;
        }
        array_push($baselineCostsArray,$totalendusercosts,"End User");

        echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all End User Devices is: " . $reportCurrency . " " . number_format($totalendusercosts, 2, '.', ',') . "</strong><br/>";
        echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalendusercapexcosts, 2, '.', ',') . "</div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='enduser'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='enduser' class='itemForm'>";
        echo $insertStringEndUser;
        echo "</div>";

        /*
         * Set up the server costs display
         */

        $totalservercosts = 0;
        $totalservercapexcosts = 0;
        $insertStringServers = "";
        foreach ($serversarrayTable as $element) {
            switch ($element) {
                case($element === "amd_servers"): case($element === "intel_servers"): case($element === "power_servers"): case($element === "mainframe_servers"):
                    $returnArray = getServerCosts($element);
                    $totalhwcosts = $returnArray[0];

                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalhwcosts * $rate;
                    } else {
                        $reportedcosts = $totalhwcosts;
                    }
                    $totalservercosts += $totalhwcosts;
                    $totalservercapexcosts += $returnArray[2];
                    $totalofallcosts += $totalhwcosts;
                    $totalofallCAPEX += $returnArray[2];
                    $insertStringServers .= "<div>";
                    $insertStringServers .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 Costs for all " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringServers .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringServers .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringServers .= $returnArray[1];
                    $insertStringServers .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalservercosts = $totalservercosts * $rate;
            $totalservercapexcosts = $totalservercapexcosts * $rate;
        }
        array_push($baselineCostsArray,$totalservercosts,"Server");
        echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Server Hardware is: " . $reportCurrency . " " . number_format($totalservercosts, 2, '.', ',') . "</strong><br/>";
        echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalservercapexcosts, 2, '.', ',') . "</div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='servers'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='servers' class='itemForm'>";
        echo $insertStringServers;
        echo "</div>";

        /*
         * Set up the storage costs display
         */

        $totalstoragecosts = 0;
        $totalstoragecapexcost = 0;
        $insertStringStorage = "";
        foreach ($storagearrayTable as $element) {
            switch ($element) {
                case($element === "flash_storage"): case($element === "nas_storage"): case($element === "san_storage"): case($element === "san_switches"):
                case($element === "portable_drives"): case($element === "tape_drives"): case($element === "tape_media"): case($element === "spare_drives"):
                case($element === "storage_cabling"):
                    $returnArray = getHWCosts($element);
                    $totalforthisstorage = $returnArray[0];
                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalforthisstorage * $rate;
                    } else {
                        $reportedcosts = $totalforthisstorage;
                    }
                    $totalstoragecosts += $returnArray[0];
                    $totalstoragecapexcost += $returnArray[2];
                    $totalofallcosts += $totalforthisstorage;
                    $totalofallCAPEX += $returnArray[2];
                    $insertStringStorage .= "<div>";
                    $insertStringStorage .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 Costs for all " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringStorage .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringStorage .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringStorage .= $returnArray[1];
                    $insertStringStorage .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalstoragecosts = $totalstoragecosts * $rate;
            $totalstoragecapexcost = $totalstoragecapexcost * $rate;
        }
        array_push($baselineCostsArray,$totalstoragecosts,"Storage");
        echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Storage Hardware is: " . $reportCurrency . " " . number_format($totalstoragecosts, 2, '.', ',') . "</strong><br/>";
        echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalstoragecapexcost, 2, '.', ',') . "</div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='storage'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='storage' class='itemForm'>";
        echo $insertStringStorage;
        echo "</div>";

        /*
         * Set up the printer costs display
         */

        $totalprinterhwcosts = 0;
        $totalprinterhwcapexcost = 0;
        $insertStringPrinter = "";
        foreach ($printersarrayTable as $element) {
            switch ($element) {
                case($element === "handheld_printer"): case($element === "label_printer"): case($element === "laser_desktop"):
                case($element === "inkjet_desktop"): case($element === "dot_matrix_printer"): case($element === "laser_workgroup"):
                case($element === "laser_multifunction"): case($element === "wide_format"): case($element === "cutsheet_production"):
                case($element === "continuous_form"):
                    $returnArray = getPrinterCosts($element);
                    $totalforthisprinter = $returnArray[0];
                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalforthisstorage * $rate;
                    } else {
                        $reportedcosts = $totalforthisprinter;
                    }
                    $totalprinterhwcosts += $returnArray[0];
                    $totalprinterhwcapexcost += $returnArray[2];
                    $totalofallcosts += $totalforthisprinter;
                    $totalofallCAPEX += $returnArray[2];
                    $insertStringPrinter .= "<div>";
                    $insertStringPrinter .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 Costs for all " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringPrinter .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringPrinter .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringPrinter .= $returnArray[1];
                    $insertStringPrinter .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalprinterhwcosts = $totalprinterhwcosts * $rate;
            $totalprinterhwcapexcost = $totalprinterhwcapexcost * $rate;
        }
        array_push($baselineCostsArray,$totalprinterhwcosts,"Printers");
        echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Printer Hardware is: " . $reportCurrency . " " . number_format($totalprinterhwcosts, 2, '.', ',') . "</strong><br/>";
        echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalprinterhwcapexcost, 2, '.', ',') . "</div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='printers'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='printers' class='itemForm'>";
        echo $insertStringPrinter;
        echo "</div>";

        /*
         * Set up the software costs display
         */

        $totalsoftwarecosts = 0;
        $totalsoftwarecapexcost = 0;
        $insertStringSoftware = "";
        foreach ($softwarearrayTable as $element) {
            switch ($element) {
                case($element === "office_software"): case($element === "desktop_software"): case($element === "tablet_software"): case($element === "mobile_phone_apps"):
                case($element === "server_software"): case($element === "helpdesk_software"): case($element === "database_software"): case($element === "security_software"):
                case($element === "storage_software"):
                    $returnArray = getSWCosts($element);
                    $totalswcosts = $returnArray[0];
                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalswcosts * $rate;
                    } else {
                        $reportedcosts = $totalswcosts;
                    }
                    $totalsoftwarecosts += $totalswcosts;
                    $totalsoftwarecapexcost += $returnArray[2];
                    $totalofallcosts += $totalswcosts;
                    $totalofallCAPEX += $returnArray[2];
                    $insertStringSoftware .= "<div>";
                    $insertStringSoftware .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 Costs for all " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringSoftware .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringSoftware .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringSoftware .= $returnArray[1];
                    $insertStringSoftware .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalsoftwarecosts = $totalsoftwarecosts * $rate;
            $totalsoftwarecapexcost = $totalsoftwarecapexcost * $rate;
        }
        array_push($baselineCostsArray,$totalsoftwarecosts,"Software");
        echo "<hr><div class='innerDisplay'><strong>Total Year 1 Costs for all Software is: " . $reportCurrency . " " . number_format($totalsoftwarecosts, 2, '.', ',') . "</strong><br/>";
        echo "Total CAPEX charge of: " . $reportCurrency . " " . number_format($totalsoftwarecapexcost, 2, '.', ',') . "</div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='software'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='software' class='itemForm'>";
        echo $insertStringSoftware;
        echo "</div>";

        /*
         * Set up the software costs display
         */

        $totalcloudcosts = 0;
        $insertStringCloud = "";
        foreach ($cloudservicesarrayTable as $element) {
            switch ($element) {
                case($element === "iaas_physical_machine_clouds"): case($element === "iaas_virtual_machine_clouds"):
                case($element === "iaas_physical_storage_clouds"): case($element === "iaas_virtual_storage_clouds"):
                case($element === "paas_clouds"): case($element === "saas_clouds"):
                    $returnArray = getCloudServicesCosts($element);
                    $totalcldcosts = $returnArray[0];
                    if ($reportCurrency !== "GBP") {
                        $reportedcosts = $totalcldcosts * $rate;
                    } else {
                        $reportedcosts = $totalcldcosts;
                    }
                    $totalcloudcosts += $totalcldcosts;
                    $totalofallcosts += $totalcldcosts;
                    $insertStringCloud .= "<div>";
                    $insertStringCloud .= "<hr><div class='innerminorDisplay'><strong>Total Year 1 for " . ucwords($element) . " is: " . $reportCurrency . " " . number_format($reportedcosts, 2, '.', ',') . "</strong></div>";
                    $insertStringCloud .= "<div class='innerminorDisplay1'><a href='#' class='imageClickMinor' name='$element'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
                    $insertStringCloud .= "<div id='$element' class='itemFormMinor'>";
                    $insertStringCloud .= $returnArray[1];
                    $insertStringCloud .= "</div></div>";
                    break;
            }
        }
        if ($reportCurrency !== "GBP") {
            $totalcloudcosts = $totalcloudcosts * $rate;
        }
        array_push($baselineCostsArray,$totalcloudcosts,"Cloud Services");
        echo "<hr><div class='innerDisplay'><strong>Total Annual Costs for all Cloud Services are: " . $reportCurrency . " " . number_format($totalcloudcosts, 2, '.', ',') . "</strong></div>";
        echo "<div class='innerDisplay1'><a href='#' class='imageClick' name='cloud'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        echo "<div id='cloud' class='itemForm'>";
        echo $insertStringCloud;
        echo "</div>";

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $totalofallcosts * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $totalofallcosts;
            array_push($graph, $reportingcosts);
        }


        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 - BASELINE COST = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";

        $doughnutChart = makeDoughnut($baselineCostsArray,$reportCurrency,$rate);
        echo $doughnutChart;

        /*
         * Now we have to add the "External Variables" to the total cost ...
         *
         */

        echo "<hr><h1>Externally Influenced Costs </h1><hr>";

        $externalArrayCosts = array('supplier_liaison', 'penetration_tests', 'ethical_hacking', 'foi', 'indemnity', 'internal_audit', 'external_audit', 'technology_currency', 'certifications');
        $externalArrayPercents = array('service_credits', 'risk', 'inflation');

        $insertString = "<div class='innerMajorDisplay'>External Costed Factors</div>";
        $insertString .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='externals'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString .= "<div id='externals' class='itemForm'>";

        $cumulativeArray = buildTotalCostArray($totalofallcosts, $totalofallCAPEX);

        foreach ($externalArrayCosts as $element) {
            $entries = getExternal($element);
            $entries = gbpEntries($element);


            switch ($element) {
                case ($element === "certifications"):
                    $combinedArray = addLinearlyToArray($cumulativeArray, $entries);
                    $certsCostPerAnnum = getCertsCostsPerAnnum($entries);
                    $insertString .= createTableLinear($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $certsCostPerAnnum);
                    $cumulativeArray = $combinedArray;
                    break;
                case ($element === "foi"):
                    $elementName = "Freedom of Information";
                    $combinedArray = addArrays($cumulativeArray, $entries);
                    $insertString .= createTable($combinedArray, $elementName, $reportCurrency, $rate, $cumulativeArray, $entries);
                    $cumulativeArray = $combinedArray;
                    break;
                default:
                    $combinedArray = addArrays($cumulativeArray, $entries);
                    $insertString .= createTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
                    $cumulativeArray = $combinedArray;
                    break;
            }
        }
        $insertString .= "</div>";
        echo $insertString;


        $insertString1 = "<div class='innerMajorDisplay'>External Percentage Cost Factors</div>";
        $insertString1 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='percentexternals'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString1 .= "<div id='percentexternals' class='itemForm'>";


        foreach ($externalArrayPercents as $element) {
            $entries = getExternal($element);
            switch ($element) {
                case ($element === "service_credits"):
                    $combinedArray = addPercentArrays($cumulativeArray, $entries);
                    $insertString1 .= createPercentTable($combinedArray, "Service Credit Allocation", $reportCurrency, $rate, $cumulativeArray, $entries);
                    $cumulativeArray = $combinedArray;
                    break;
                case ($element === "risk"):
                    $combinedArray = addPercentArrays($cumulativeArray, $entries);
                    $insertString1 .= createPercentTable($combinedArray, "Risk & Quality Assurance", $reportCurrency, $rate, $cumulativeArray, $entries);
                    $cumulativeArray = $combinedArray;
                    break;
                case ($element === "inflation"):
                    $combinedArray = inflationArray($cumulativeArray, $entries);
                    $insertString1 .= createPercentTable($combinedArray, "Inflation", $reportCurrency, $rate, $cumulativeArray, $entries);
                    $cumulativeArray = $combinedArray;
                    break;
            }
        }

        $insertString1 .= "</div>";
        echo $insertString1;

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $cumulativeArray['2014'] * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $cumulativeArray['2014'];
            array_push($graph, $reportingcosts);
        }
        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 WITH EXTERNAL COSTED FACTORS = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";

        /*
         * Now we have to add the "Product Development Costs" to the total cost ...
         *
         */

        echo "<hr><h1>Product Development Costs </h1><hr>";
        $productDevelopment = array('market_intelligence_budget', 'focus_groups_budget', 'competitive_intelligence_budget', 'industry_insights_budget', 'professional_bodies_membership', 'external_design_budget', 'public_relations_budget', 'external_testing_budget', 'product_development_tooling', 'product_partner_evaluation', 'contingency_fund');

        $insertString2 = "<div class='innerMajorDisplay'>Product Development Cost Allocations</div>";
        $insertString2 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='proddevelop'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString2 .= "<div id='proddevelop' class='itemForm'>";

        foreach ($productDevelopment as $element) {

            $entries = gbpEntries($element);
            $combinedArray = addArrays($cumulativeArray, $entries);
            $insertString2 .= createTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
            $cumulativeArray = $combinedArray;
        }
        $insertString2 .= "</div>";
        echo $insertString2;

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $cumulativeArray['2014'] * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $cumulativeArray['2014'];
            array_push($graph, $reportingcosts);
        }
        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 WITH PRODUCT DEVELOPMENT COSTS = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";


        /*
         * Now we have to add the "Marketing Costs" to the total cost ...
         *
         */

        echo "<hr><h1>Marketing Costs </h1><hr>";
        $marketing = array('market_research_budget', 'competition_research_budget', 'merchandise_budget', 'brand_awareness_budget', 'conference_attendance', 'marketing_bodies_membership', 'social_media_budget', 'print_media_budget', 'digital_presence_budget');

        $insertString3 = "<div class='innerMajorDisplay'>Marketing Cost Allocations</div>";
        $insertString3 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='marketing'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString3 .= "<div id='marketing' class='itemForm'>";

        foreach ($marketing as $element) {
            $entries = gbpEntries($element);
            $combinedArray = addArrays($cumulativeArray, $entries);
            $insertString3 .= createTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
            $cumulativeArray = $combinedArray;
        }
        $insertString3 .= "</div>";
        echo $insertString3;

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $cumulativeArray['2014'] * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $cumulativeArray['2014'];
            array_push($graph, $reportingcosts);
        }
        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 WITH MARKETING COSTS = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";

        /*
         * Now we have to add the "Sales Management Costs" to the total cost ...
         *
         */

        echo "<hr><h1>Sales Management Costs </h1><hr>";
        $sales = array('sales_certification_courses', 'sales_training_budget', 'lead_generation_campaigns', 'prospecting_campaigns', 'launch_events', 'sales_events', 'sales_advertising_budget', 'sales_business_development_plan', 'sales_professional_bodies_membership');

        $insertString3 = "<div class='innerMajorDisplay'>Sales Management Cost Allocations</div>";
        $insertString3 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='sales'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString3 .= "<div id='sales' class='itemForm'>";

        foreach ($sales as $element) {
            $entries = gbpEntries($element);
            $combinedArray = addArrays($cumulativeArray, $entries);
            $insertString3 .= createTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
            $cumulativeArray = $combinedArray;
        }

        $insertString3 .= "</div>";
        echo $insertString3;

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $cumulativeArray['2014'] * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $cumulativeArray['2014'];
            array_push($graph, $reportingcosts);
        }
        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 WITH SALES MANAGEMENT COSTS = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";

        /*
         * Now we have to add the "Channel Management Costs" to the total cost ...
         *
         */

        echo "<hr><h1>Channel Management Costs </h1><hr>";

        $channelArrayCosts = array('channel_certification_courses', 'channel_legal_expenses', 'channel_training_budget', 'channel_marketing_support', 'channel_credit_evaluation', 'channel_advertising_budget', 'channel_security_budget', 'channel_professional_bodies_membership');
        $channelArrayPercents = array('tier_1_margin_expectation', 'tier_2_margin_expectation', 'channel_business_development_plan');

        $insertString4 = "<div class='innerMajorDisplay'>Channel Costed Factors</div>";
        $insertString4 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='channel'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString4 .= "<div id='channel' class='itemForm'>";

        foreach ($channelArrayCosts as $element) {
            $entries = gbpEntries($element);
            $combinedArray = addArrays($cumulativeArray, $entries);
            $insertString4 .= createTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
            $cumulativeArray = $combinedArray;
        }

        $insertString4 .= "</div>";
        echo $insertString4;

        $insertString5 = "<div class='innerMajorDisplay'>Channel Percentage Cost Factors</div>";
        $insertString5 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='percentchannel'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString5 .= "<div id='percentchannel' class='itemForm'>";


        foreach ($channelArrayPercents as $element) {
            $entries = getExternal($element);
            $combinedArray = addPercentArrays($cumulativeArray, $entries);
            $insertString5 .= createPercentTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
            $cumulativeArray = $combinedArray;
        }

        $insertString5 .= "</div>";
        echo $insertString5;

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $cumulativeArray['2014'] * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $cumulativeArray['2014'];
            array_push($graph, $reportingcosts);
        }
        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 WITH CHANNEL COSTED FACTORS = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";

        /*
         * Finally we have to add the "Contractural Obligations Costs" to the total cost ...
         *
         */

        echo "<hr><h1>Contractual Obligations Costs </h1><hr>";
        $contract = array('contract_governance', 'contract_administration', 'transition_charges', 'service_operation_charges', 'asset_acquisition_charges', 'third_party_contracts_management', 'consents_maintenance', 'benchmarking_charges', 'business_continuity_plan_maintenance', 'business_continuity_testing', 'exit_services', 'change_management', 'change_administration', 'termination_for_convenience_charges', 'termination_for_cause_charges', 'temporary_services_extension', 'confidentiality_obligations', 'intellectual_property_rights', 'indemnities', 'insurances', 'regulatory_compliance', 'audits', 'data_privacy', 'step_in_rights', 'survival', 'severability', 'technology_currency');

        $insertString6 = "<div class='innerMajorDisplay'>Contractual Obligations Cost Allocations</div>";
        $insertString6 .= "<div class='innerMajorDisplay1'><a href='#' class='imageClick' name='contract'><img src='../img/plusred.png' width='20px' height='20px'/></a></div><hr/>";
        $insertString6 .= "<div id='contract' class='itemForm'>";

        foreach ($contract as $element) {
            $entries = gbpEntries($element);
            $combinedArray = addArrays($cumulativeArray, $entries);
            $insertString6 .= createTable($combinedArray, produceName($element), $reportCurrency, $rate, $cumulativeArray, $entries);
            $cumulativeArray = $combinedArray;
        }

        $insertString6 .= "</div>";
        echo $insertString6;

        if ($reportCurrency !== "GBP") {
            $reportingcosts = $cumulativeArray['2014'] * $rate;
            array_push($graph, $reportingcosts);
        } else {
            $reportingcosts = $cumulativeArray['2014'];
            array_push($graph, $reportingcosts);
        }
        echo "<hr><div class='MajorDisplay'>TOTAL YEAR 1 WITH CONTRACT OBLIGATIONS COSTS = " . $reportCurrency . " " . number_format($reportingcosts, 2, '.', ',') . "</div><hr>";

        echo "<hr><h1>Total Year 1 Costs and Forecast</h1><hr>";


        $insertString7 .= createFinalTable($cumulativeArray, "Total Costs with Forecast", $reportCurrency, $rate);
        $insertString7 .= "<div class='blockGap'> &nbsp</div>";
        echo $insertString7;
        
        $graphNumbers = array_reverse(createGraphNumbers($graph));
        $graphHeaders = array("Technology & Labour", "External Factors", "Product Development", "Marketing Costs", "Selling Costs", "Channel Costs", "Contractual Obligations");
        $graphColours = array("#34495e", "#95a5a6", "#9b59b6", "#27ae60", "#e74c3c", "#16a085", "#f39c12");
        $insertStringEJK = "<script>";

        $insertStringEJK .= "arrayOfData = new Array(";
        $count = 0;
        foreach ($graphNumbers as $value) {
            $insertStringEJK .= "[" . $value . ",'" . $graphHeaders[$count] . "','" . $graphColours[$count] . "'],";
            $count++;
        }
        $insertStringEJK = rtrim($insertStringEJK, ',');
        $insertStringEJK .= ");";

        $insertStringEJK .= "arrayOfData1 = new Array(";
        $count = 0;
        foreach ($graphNumbers as $value) {
            $insertStringEJK .= "[" . $value . ",'" . $graphHeaders[$count] . "','" . $graphColours[$count] . "'],";
            $count++;
        }
        $insertStringEJK = rtrim($insertStringEJK, ',');
        $insertStringEJK .= ");";
        $insertStringEJK .= "$('#exampleSimple').jqbargraph({data: arrayOfData});";
        $insertStringEJK .= "


        $('#simpleSortAsc').click(function() {
        $('.exampleSimpleColors').show();
        $('#exampleSimple').html('');
        $('#exampleSimple').jqbargraph({data: arrayOfData, sort: 'asc'});
        $('#simpleDyn').html(',<br />&nbsp;&nbsp; sort: \"asc\"');
        });

        $('#simpleSortDesc').click(function() {
        $('.exampleSimpleColors').show();
        $('#exampleSimple').html('');
        $('#exampleSimple').jqbargraph({data: arrayOfData, sort: 'desc'});
        $('#simpleDyn').html(\",<br />&nbsp;&nbsp; sort: 'desc'\");
        });

        $('#simpleLegend').click(function() {
        $('.exampleSimpleColors').show();
        $('#exampleSimple').html('');
        $('#exampleSimple').jqbargraph({data: arrayOfData, legend: true});
        $('#simpleDyn').html(\",<br />&nbsp;&nbsp; legend: true\");
        });

        $('#simpleClear').click(function() {
        $('.exampleSimpleColors').show();
        $('#exampleSimple').html('');
        $('#exampleSimple').jqbargraph({data: arrayOfData1});
        $('#simpleDyn').html(\"\");
        });

        $('#simpleColors').click(function() {
        $('#exampleSimple').html('');
        $('.exampleSimpleColors').hide();
        $('#exampleSimple').jqbargraph({data: arrayOfData, colors: ['#666', '#000']});
        $('#simpleDyn').html(\",<br />&nbsp;&nbsp; colors: ['#666','#000']\");
        });

        $('#simpleColorsLegend').click(function() {
        $('#exampleSimple').html('');
        $('.exampleSimpleColors').hide();
        $('#exampleSimple').jqbargraph({data: arrayOfData, colors: ['#666', '#000'], legends: ['gray', 'black'], legend: true});
        $('#simpleDyn').html(\",<br />&nbsp;&nbsp; colors: ['#666','#000'],<br />&nbsp;&nbsp; legends: ['gray','black'],<br />&nbsp;&nbsp; legend: true\");
        });

        $('#simplePositionTop').click(function() {
        $('.exampleSimpleColors').show();
        $('#exampleSimple').html('');
        $('#exampleSimple').jqbargraph({data: arrayOfData1, position: 'top'});
        $('#simpleDyn').html(\",<br />&nbsp;&nbsp; position: 'top'\");
        });

        </script>";
        
        /*
         * Lets add the per VM and per TB analysis ...
         */
        
        $straightLineCost = 0;
        for ($i=2014;$i<=2018;$i++) {
            $straightLineCost += $cumulativeArray[$i];
        }
        
        echo $insertStringEJK;
        $numberofVMs = getTotalPotentialVMs();
        $smallVMCost = number_format(($straightLineCost/$numberofVMs/60),2);
        $numberofGBs = getTotalPlainPotentialGBs();
        $averageGBCost = number_format(($straightLineCost/$numberofGBs/60),2);

        $lineChart = makeLineChart($cumulativeArray, $reportCurrency, $rate, $smallVMCost, $averageGBCost);
        echo $lineChart;
        
        $lastupdatedby = $_SESSION['loginname'];
        writeCosts($smallVMCost, $averageGBCost, $lastupdatedby);

        ?>
    </div>
</div>
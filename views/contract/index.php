<div id="contractMain">
    
    <div id="contractMainMID">
        <h2>Contractual Obligations Cost Management</h2>
        <input type="hidden" id="toggleItem" name="toggleItem" value=""/>
        
        <?php
        
        function makeHeader($arg) {
            $output = str_replace('_', ' ', $arg);
            $string = ucwords($output);
            return $string;
        }
        
        function makeEntry($arg,$formName,$currency) {
            $header = makeHeader($arg);
            $lastupdatedby = $_SESSION['loginname'];
            
            $insertString = "<div class='menuItems'>";
            $insertString .= "<form id='$formName' method='post'>";
            $insertString .= "<input type='hidden' id='tableName' name='tableName' value='$arg'>";
            $insertString .= "<input type='hidden' id='lastupdatedby' name='lastupdatedby' value='$lastupdatedby'/>";
            $insertString .= "<table class='menuTable'><td class='textTD'>$header</td>";
            $insertString .= "<td class='imgTD'><a class='imageClick' name='$arg' href='#'><img src='../img/plusred.png' width='20px' height='20px'/></a></td>";
            $insertString .= "</table>";
            $insertString .= "<div id='$arg' class='itemForm'><table class='displayTable'><thead class='null'><tr class='null'>";
            
                
            $contract = new Contract_Model();
            $array = $contract->ajax_contractShowColumns($arg);
            $count = 0;
            
            foreach ($array as $val) {
                foreach ($val as $key => $value) {
                    if ($value == "id" OR $value == "lastupdatedby" OR $value == "lastupdated") {
                        $insertString .= "<td class='emptyTD'><input id='".$arg."tr" . $count . "' class='tableInputTD' type='text' name='" . $key . "' value='" . $value . "' readonly/></td>";
                    } else if ($value == "original_currency") {
                        $insertString .= "<th class='tableTH'><input id='".$arg."tr" . $count . "' class='tableInputTH' type='text' name='" . $key . "' value='Currency' readonly/></th>";
                    } else {
                        $insertString .= "<th class='tableTH'><input id='".$arg."tr" . $count . "' class='tableInputTH' type='text' name='" . $key . "' value='" . $value . "' readonly/></th>";
                    }
                     $count++;
                }
            }
            
            $insertString .= "</tr></thead><tbody class='null'><tr class='null'>";
            
            $contract = new Contract_Model();
            $array = $contract->ajax_contractShowColumnEntries($arg);
            $currentcurrency = $contract->getCurrentCurrency($arg);
            $count = 0;
            
            foreach ($array as $val) {
                foreach ($val as $key => $value) {
                    if ($key == "id" OR $key == "lastupdatedby" OR $key == "lastupdated") {
                        $insertString .= "<td nowrap class='emptyTD'><input id='".$arg."td" . $count . "' class='tableInputTD' type='hidden' name='" . $key . "' value='" . $value . "' /></td>";
                    } else if ($key == "original_currency") {
                        $insertString .= "<td nowrap class='tableTD'><select id='".$arg."currencyselect".$count."' name='original_currency' class='selectCurrency'>";
                        foreach ($currency as $value) {
                            if ($currentcurrency === $value) {
                                $insertString .= "<option value='".$value."' selected='selected'>".$value."</option>";
                            } else {
                                $insertString .= "<option value='".$value."'>".$value."</option>";
                            }
                        }
                        $insertString .= "</select></td>";
                    } else {
                        $insertString .= "<td nowrap class='tableTD'><input id='".$arg."td" . $count . "' class='tableInputTD' type='text' name='" . $key . "' value='" . $value . "' maxlength='10' /></td>";
                    }
                    $count++;
                }
            }
            $insertString .= "</tr></tbody></table><p>";
            $insertString .= "<input class='updateButton' type='submit' name='update' value='Update'/>&nbsp;&nbsp;<span id='".$arg."errorSpan' class='errorSpan'></span>";
            $insertString .= "</p></div></form></div>";
            echo $insertString;
        }    
        
        $array = array('contract_governance','contract_administration','transition_charges','service_operation_charges','asset_acquisition_charges','third_party_contracts_management','consents_maintenance','benchmarking_charges','business_continuity_plan_maintenance','business_continuity_testing','exit_services','change_management','change_administration','termination_for_convenience_charges','termination_for_cause_charges','temporary_services_extension','confidentiality_obligations','intellectual_property_rights','indemnities','insurances','regulatory_compliance','audits','data_privacy','step_in_rights','survival','severability','technology_currency');
        
        $contract = new Contract_Model();
        $currency = $contract->ajax_getCurrency();
        
        
        foreach ($array as $element) {
            $formName = $element."Form";
            makeEntry($element,$formName,$currency,$currentcurrency);
        }
            
        ?>
        
    </div>
</div>


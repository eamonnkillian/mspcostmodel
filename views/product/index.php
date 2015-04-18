<div id="productMain">
    
    <div id="productMainMID">
        <h2>Product Development Cost Management</h2>
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
            
                
            $product = new Product_Model();
            $array = $product->ajax_productShowColumns($arg);
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
            
            $product = new Product_Model();
            $array = $product->ajax_productShowColumnEntries($arg);
            $currentcurrency = $product->getCurrentCurrency($arg);
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
        
        $array = array('market_intelligence_budget','focus_groups_budget','competitive_intelligence_budget','industry_insights_budget','professional_bodies_membership','external_design_budget','public_relations_budget','external_testing_budget','product_development_tooling','product_partner_evaluation','contingency_fund');
        
        $product = new Product_Model();
        $currency = $product->ajax_getCurrency();
        
        
        foreach ($array as $element) {
            $formName = $element."Form";
            makeEntry($element,$formName,$currency,$currentcurrency);
        }
            
        ?>
        
    </div>
</div>


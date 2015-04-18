
    <div id="dashboardMainMID">
        <h1>DashBoard</h1>
        <div id="dashboardTable">
            <table><th>Baseline Information</th></table>
            <table class="dashboardTable">
                
                <?php
                if ($_SESSION['Admin']) {
                    echo "<td><a href='" . URL . "usermgmt/index'>";
                    echo '<button class="fancybutton" value=>User Management</button>';
                    echo "</a></td>";
                }
                ?>
                <td>
                     <a href="<?php echo URL; ?>aboutus/index">
                        <button class="fancybutton" value=>About Us</button>
                    </a>
                </td>
                <td>
                     <a href="<?php echo URL; ?>customers/index">
                        <button class="fancybutton" value=>Customer Management</button>
                    </a>
                </td>
                <td>
                    <a href="<?php echo URL; ?>cloudprovider/index">
                        <button class="fancybutton" value=>Cloud Providers</button>
                    </a>
                    
                </td>  
                <td>
                   
                    <a href="<?php echo URL; ?>dcassets/index">
                        <button class="fancybutton" value=>Data Center Locations</button>
                    </a>
                </td>  
                <td>
                   
                    <a href="<?php echo URL; ?>offices/index">
                        <button class="fancybutton" value=>Office Locations</button>
                    </a>
                </td>  

                
                <td>
                    <a href="<?php echo URL; ?>labour/index">
                        <button class="fancybutton" value=>Labour Management</button>
                    </a>
                    
                </td>  
                <td>
                    <a href="<?php echo URL; ?>external/index">
                        <button class="fancybutton" value=>External Variables</button>
                    </a>
                    
                </td>  
                </table>
            <table><th>Assets Cost Information</th></table>
            <table class="dashboardTable">
               
                <td>
                    <a href="<?php echo URL; ?>network/index">
                        <button class="fancybutton" value=>Network Assets</button>
                    </a>
                </td>  
            

                <td>    
                    <a href="<?php echo URL; ?>enduser/index">
                        <button class="fancybutton" value=>End User Assets</button>
                    </a>
                </td>        
                <td>    
                    <a href="<?php echo URL; ?>software/index">
                        <button class="fancybutton" value=>Software Assets</button>
                    </a>
                </td>        

                <td>
                    <a href="<?php echo URL; ?>storage/index">
                        <button class="fancybutton" value=>Storage Assets</button>
                    </a>
                </td>   
            
                <td>        
                    <a href="<?php echo URL; ?>server/index">
                        <button class="fancybutton" value=>Server Assets</button>
                    </a>
                </td> 
                <td>        
                    <a href="<?php echo URL; ?>printer/index">
                        <button class="fancybutton" value=>Printer Assets</button>
                    </a>
                </td> 
                <td>        
                    <a href="<?php echo URL; ?>cloud/index">
                        <button class="fancybutton" value=>Cloud Assets</button>
                    </a>
                </td>   
            </table>
            <table><th>Sales & Marketing Cost Information</th></table>
            <table class="dashboardTable">
                <tr>
                <td>        
                    <a href="<?php echo URL; ?>product/index">
                        <button class="fancybutton" value=>Product Development</button>
                    </a>
                </td>

                <td>        
                    <a href="<?php echo URL; ?>marketing/index">
                        <button class="fancybutton" value=>Marketing Management</button>
                    </a>
                </td>        
                <td>        
                    <a href="<?php echo URL; ?>sales/index">
                        <button class="fancybutton" value=>Sales Management</button>
                    </a>
                </td>        
                <td>        
                    <a href="<?php echo URL; ?>channel/index">
                        <button class="fancybutton" value=>Channel Management</button>
                    </a>
                </td>  
                <td>        
                    <a href="<?php echo URL; ?>contract/index">
                        <button class="fancybutton" value=>Contractual Obligations</button>
                    </a>
                </td>     
                </tr>
            </table>
            <table><th>Allocations & Reporting</th></table>
            <table class="dashboardTable">
                <td>        
                    <a href="<?php echo URL; ?>costs/index">
                        <button class="fancybutton" value=>Total Costs Breakdown</button>
                    </a>
                </td>   
                <td>        
                    <a href="<?php echo URL; ?>ourproducts/index">
                        <button class="fancybutton" value=>Our Products</button>
                    </a>
                </td>  
                <td>        
                    <a href="<?php echo URL; ?>salesforecasting/index">
                        <button class="fancybutton" value=>Sales Forecasting</button>
                    </a>
                </td>  
                <td>        
                    <a href="#">
                        <button class="fancybutton" value=>Resource Usage Allocations Management</button>
                    </a>
                </td>
                <td>        
                    <a href="#">
                        <button class="fancybutton" value=>Management Reports</button>
                    </a>
                </td>
            </table>
        </div>
    </div>

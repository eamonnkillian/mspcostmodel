<div id="salesMain">
    <div id="salesMainLHS"></div>
    <div id="salesMainMID">
        <?php 
            function getTotalPotentialVMs() {
                $serverDataArray = array("intel_servers","amd_servers","power_servers","mainframe_servers");
                $numberofphysicalprocessors = 0;
                $numberofphysicalcoresperprocessor = 0;
                $vcpuPerpcpu = 8;
                
                foreach($serverDataArray as $value) {
                    $statement = "SELECT server_number_processors FROM ".$value." where ASSIGNMENT='production';";
                    $data = new Salesforecasting_Model();
                    $array = $data->runQuery($statement);
                    foreach ($array as $piece) {
                        foreach ($piece as $key => $value) {
                        $numberofphysicalprocessors += $value;
                        }
                    }
                }
                
                foreach($serverDataArray as $value) {
                    $statement = "SELECT server_number_cores_per_processor FROM ".$value." where ASSIGNMENT='production';";
                    $data = new Salesforecasting_Model();
                    $array = $data->runQuery($statement);
                    foreach ($array as $piece) {
                        foreach ($piece as $key => $value) {
                        $numberofphysicalcoresperprocessor += $value;
                        }
                    }
                }
                return $numberofphysicalprocessors*$numberofphysicalcoresperprocessor*$vcpuPerpcpu;
            }
            
            
        
        ?>
        <h1>Sales Forecasting Management</h1>
        <table>
                <tr><th>VM's Available</th><th>Storage Available(GBs)</th></tr>
                <tr><td><?php $numberofVMs = getTotalPotentialVMs(); echo $numberofVMs; ?></td><td>144</td></tr>
        </table>
        <?php $numberofphysicalprocessors = getTotalPotentialVMs(); echo $numberofphysicalprocessors; ?>
        
    <div id="salesMainRHS"></div>
    </div>
</div>



        
<div id="networkMain">
    
    <div id="networkMainMID">



        <div id="networkMainMIDMainSectionLHS">
            <h2>Network Assets Cost Management</h2>
            <form id="networkFormDelete" method="post" action="ajax_networkShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="networkSelect" name="list" class="networkInputSel">
                    <option selected value="">Choose a Network Asset ...</option>
                    <option value="switches">Switches</option>
                    <option value="routers">Routers</option>
                    <option value="loadbalancers">Load Balancers</option>
                    <option value="accelerators">WAN Accelerators</option>
                    <option value="firewalls">Firewalls</option>
                    <option value="intrusion">Intrusion Applicances</option>
                    <option value="telecoms">Telecom Devices</option>
                    <option value="voipdevices">VoIP Devices</option>
                    <option value="modems">Modems</option>
                    <option value="wifiaccess">Wifi Access Points</option>
                    <option value="bandwidth">Bandwidth</option>
                    <option value="cables">Cables</option>
                </select>
                </p>
                <div id="networkMenu">
                    <div class="networkSelector">
                        <input class="networkInputSubmit" id="networkMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="networkSelector">
                        <input class="networkInputSubmit" id="networkMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="networkSelector">   
                        <input class="networkInputSubmit" id="networkMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="networkSelector">    
                        <input class="networkInputSubmit" id="networkMenuChoiceDelete" type="button" value="Delete"/>
                        
                    </div>    
                </div>
            </form>
        </div>
        <div id="networkMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
    
</div>
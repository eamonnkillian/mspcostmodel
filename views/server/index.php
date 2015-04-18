<div id="serverMain">
    
    <div id="serverMainMID">
        <div id="serverMainMIDMainSectionLHS">
            <h2>Server Assets Cost Management</h2>
            <form id="serverFormDelete" method="post" action="ajax_serverShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="serverSelect" name="list" class="serverInputSel">
                    <option selected value="">Choose a Server Asset ...</option>
                    <option value="intel_servers">Intel Server</option>
                    <option value="amd_servers">AMD Server</option>
                    <option value="power_servers">Power Server</option>
                    <option value="mainframe_servers">Mainframe Server</option>
                </select>
                </p>
                <div id="serverMenu">
                    <div class="serverSelector">
                        <input class="serverInputSubmit" id="serverMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="serverSelector">
                        <input class="serverInputSubmit" id="serverMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="serverSelector">
                        <input class="serverInputSubmit" id="serverMenuChoiceModify" type="button" value="Modify"/>
                     </div>
                    <div class="serverSelector">
                        <input class="serverInputSubmit" id="serverMenuChoiceDelete" type="button" value="Delete"/>
                    </div> 
                </div>
            </form>
        </div>
        <div id="serverMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
    
</div>
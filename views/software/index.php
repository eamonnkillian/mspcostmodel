<div id="softwareMain">
    
    <div id="softwareMainMID">
        <div id="softwareMainMIDMainSectionLHS">
            <h2>Software Assets Cost Management</h2>
            <form id="softwareFormDelete" method="post" action="ajax_softwareShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="softwareSelect" name="list" class="softwareInputSel">
                    <option selected value="">Choose a Software Asset ...</option>
                    <option value="office_software">Office Software</option>
                    <option value="desktop_software">Desktop Software</option>
                    <option value="tablet_software">Tablet Software</option>
                    <option value="mobile_phone_apps">Mobile Phone Apps</option>
                    <option value="server_software">Server Software</option>
                    <option value="helpdesk_software">Helpdesk Software</option>
                    <option value="database_software">Database Software</option>
                    <option value="security_software">Security Software</option>
                    <option value="storage_software">Storage Software</option>
                </select>
                </p>
                <div id="softwareMenu">
                    <div class="softwareSelector">
                        <input class="softwareInputSubmit" id="softwareMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="softwareSelector">
                        <input class="softwareInputSubmit" id="softwareMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="softwareSelector">
                        <input class="softwareInputSubmit" id="softwareMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="softwareSelector">
                        <input class="softwareInputSubmit" id="softwareMenuChoiceDelete" type="button" value="Delete"/>
                    </div>
                </div>
            </form>
        </div>
        <div id="softwareMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
    
</div>
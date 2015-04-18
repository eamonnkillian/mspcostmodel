<div id="enduserMain">
    
    <div id="enduserMainMID">
        <div id="enduserMainMIDMainSectionLHS">
            <h2>End User Assets Cost Management</h2>
            <form id="enduserFormDelete" method="post" action="ajax_enduserShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="enduserSelect" name="list" class="enduserInputSel">
                    <option selected value="">Choose an End User Asset ...</option>
                    <option value="desktop">Desktop</option>
                    <option value="laptop">Laptop</option>
                    <option value="tablet">Tablet</option>
                    <option value="mobile_phone">Mobile Phone</option>
                    <option value="projector">Projector</option>
                    <option value="home_hub">Home Hub</option>
                </select>
                </p>
                <div id="enduserMenu">
                    <div class="enduserSelector">
                        <input class="enduserInputSubmit" id="enduserMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="enduserSelector">
                        <input class="enduserInputSubmit" id="enduserMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="enduserSelector">
                        <input class="enduserInputSubmit" id="enduserMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="enduserSelector">
                        <input class="enduserInputSubmit" id="enduserMenuChoiceDelete" type="button" value="Delete"/>
                    </div>
                </div>
            </form>
        </div>
        <div id="enduserMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
    
</div>
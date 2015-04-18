<div id="storageMain">
    
    <div id="storageMainMID">
        <div id="storageMainMIDMainSectionLHS">
            <h1>Storage Assets Cost Management</h1>
            <form id="storageFormDelete" method="post" action="ajax_storageShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="storageSelect" name="list" class="storageInputSel">
                    <option selected value="">Choose a Storage Asset ...</option>
                    <option value="flash_storage">Flash Storage</option>
                    <option value="nas_storage">NAS Storage</option>
                    <option value="san_storage">SAN Storage</option>
                    <option value="san_switch">SAN Switches</option>
                    <option value="portable_drive">Portable Drives</option>
                    <option value="tape_drive">Tape Drives</option>
                    <option value="tape_media">Tape Media</option>
                    <option value="spare_drive">Spare Drives</option>
                    <option value="storage_cabling">Storage Cabling</option>
                </select>
                </p>
                <div id="storageMenu">
                    <div class="storageSelector">
                        <input class="storageInputSubmit" id="storageMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="storageSelector">
                        <input class="storageInputSubmit" id="storageMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="storageSelector">
                        <input class="storageInputSubmit" id="storageMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="storageSelector">  
                        <input class="storageInputSubmit" id="storageMenuChoiceDelete" type="button" value="Delete"/>
                    </div>    
                </div>
            </form>
        </div>
        <div id="storageMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
   
</div>
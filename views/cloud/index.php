<div id="cloudMain">
    
    <div id="cloudMainMID">
        <div id="cloudMainMIDMainSectionLHS">
            <h2>Cloud Assets Cost Management</h2>
            <form id="cloudFormDelete" method="post" action="ajax_cloudShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="cloudSelect" name="list" class="cloudInputSel">
                    <option selected value="">Choose a Cloud Asset ...</option>
                    <option value="iaas_virtual_machine_clouds">IAAS Virtual Machine Clouds</option>
                    <option value="iaas_physical_machine_clouds">IAAS Physical Machine Clouds</option>
                    <option value="iaas_virtual_storage_clouds">IAAS Virtual Storage Clouds</option>
                    <option value="iaas_physical_storage_clouds">IAAS Physical Storage Clouds</option>
                    <option value="paas_clouds">PAAS Clouds</option>
                    <option value="saas_clouds">SAAS Clouds</option>
                </select>
                </p>
                <div id="cloudMenu">
                    <div class="cloudSelector">
                        <input class="cloudInputSubmit" id="cloudMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="cloudSelector">
                        <input class="cloudInputSubmit" id="cloudMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="cloudSelector">   
                        <input class="cloudInputSubmit" id="cloudMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="cloudSelector">
                        <input class="cloudInputSubmit" id="cloudMenuChoiceDelete" type="button" value="Delete"/>
                    </div>    
                </div>
            </form>
        </div>
        <div id="cloudMainMIDMainSectionRHS"></div>       
    </div>
   
</div>
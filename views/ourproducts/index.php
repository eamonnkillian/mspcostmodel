
<div id="ourproductsMain">

    <div id="ourproductsMainMID">
        <div id="ourproductsMainMIDMainSectionLHS">
            <h2>Building the Product Catalogue</h2>
            

            <form id="ourproductsFormDelete" method="post" action="ajax_ourproductsShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <div id="dropdownPosition">
                    <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                    <p>
                        <select id="ourproductsSelect" name="list" class="ourproductsInputSel">
                            <option selected value="">Choose a Product Type ...</option>
                            <option value="iaas_virtual_machine_products">IaaS Virtual Machines</option>
                            <option value="iaas_virtual_nas_products">IaaS Virtual NAS Storage</option>
                            <option value="iaas_virtual_san_products">IaaS Virtual SAN Storage</option>
                            <option value="iaas_physical_machine_products">IaaS Physical Machines</option>
                            <option value="iaas_physical_nas_products">IaaS Physical NAS Storage</option>
                            <option value="iaas_physical_san_products">IaaS Physical SAN Storage</option>
                            <option value="paas_service_products">PaaS Services</option>
                            <option value="saas_service_products">SaaS Services</option>
                            <option value="byod_service_products">BYOD Services</option>
                            <option value="voip_service_products">VoIP Services</option>
                            <option value="bandwidth_service_products">Bandwidth Services</option>
                            <option value="backup_service_products">Backup Services</option>
                            <option value="security_service_products">Security Services</option>
                            <option value="consulting_service_products">Consulting Services</option>
                        </select>
                    </p>
                </div>
                <div id="ourproductsMenu">
                    <div class="ourproductsSelector">
                        <input class="ourproductsInputSubmit" id="ourproductsMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="ourproductsSelector">
                        <input class="ourproductsInputSubmit" id="ourproductsMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="ourproductsSelector"> 
                        <input class="ourproductsInputSubmit" id="ourproductsMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="ourproductsSelector">
                        <input class="ourproductsInputSubmit" id="ourproductsMenuChoiceDelete" type="button" value="Delete"/>
                    </div>
                </div>
            </form>
        </div>
        <div id="ourproductsMainMIDMainSectionRHS">
            <div id="ourproductsFormforAdd"></div>


        </div>       
    </div>

</div>
<div id="labourMain">

    <div id="labourMainMID">



        <div id="labourMainMIDMainSectionLHS">
            <h2>Labour Cost Management</h2>
            <div class="labourSelector">
                <form id="labourFormShow" method="post" action="<?php echo URL; ?>labour/ajax_LabourShow">
                    <input type="hidden" name="tableName" value="labour"/>
                    <input class="labourInputSubmit" type="button" value="Show Labour"/>
                </form>
            </div>
            <div class="labourSelector">
                <form id="labourFormAdd" method="post" action="<?php echo URL; ?>labour/ajax_LabourShow">
                    <input type="hidden" name="tableName" value="labour"/>
                    <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                    <input class="labourInputSubmit" id="labourRevealAddForm" type="button" value="Add Labour" />
                </form>
            </div>
            <div class="labourSelector">
                <form id="labourFormModify" method="post" action="<?php echo URL; ?>labour/ajax_LabourShow">
                    <input type="hidden" name="tableName" value="labour"/>
                    <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                    <input class="labourInputSubmit" type="submit" value="Modify Labour"/>
                </form>
            </div>
            <div class="labourSelector">
                <form id="labourFormDelete" method="post" action="<?php echo URL; ?>labour/ajax_LabourShow">
                    <input type="hidden" name="tableName" value="labour"/>
                    <input class="labourInputSubmit" type="submit" value="Delete Labour"/>
                </form>
            </div>

        </div>
        <div id="labourMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>

</div>
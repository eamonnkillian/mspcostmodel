<div id="officesMain">
    <div id="officesMainMID">



        <div id="officesMainMIDMainSectionLHS">
            <h2>Office Locations</h2>
            <div class="officeSelector">

            <form id="officesFormShow" method="post" action="<?php echo URL; ?>offices/ajax_officesShow">
                <input type="hidden" id="tableName" name="tableName" value="offices"/>
                <input class="officesInputSubmit" type="button" value="Show Offices"/>
            </form>
            </div>
            <div class="officeSelector">
            
            <form id="officesFormAdd" method="post" action="<?php echo URL; ?>offices/ajax_officesShow">
                <input type="hidden" id="tableName" name="tableName" value="offices"/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="officesInputSubmit" id="officesRevealAddForm" type="button" value="Add Offices" />
            </form>
            </div>
            <div class="officeSelector">
            <form id="officesFormModify" method="post" action="<?php echo URL; ?>offices/ajax_officesShow">
                <input type="hidden" name="tableName" value="offices"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="officesInputSubmit" type="submit" value="Modify Offices"/>
            </form>
</div>
            <div class="officeSelector">
            <form id="officesFormDelete" method="post" action="<?php echo URL; ?>offices/ajax_officesShow">
                <input type="hidden" name="tableName" value="offices"/>
                <input class="officesInputSubmit" type="submit" value="Delete Offices"/>
            </form>
            </div>
        </div>
        <div id="officesMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
</div>
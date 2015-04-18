<div id="customersMain">
    <div id="customersMainMIDMainSectionLHS">
        <h2>Customer Management</h2>
        <div class="customersSelector">
            <form id="customersFormShow" method="post" action="<?php echo URL; ?>customers/ajax_customersShow">
                <input type="hidden" id="tableName" name="tableName" value="customers"/>
                <input class="customersInputSubmit" type="button" value="Show Customers"/>
            </form>
        </div>
        <div class="customersSelector">
            <form id="customersFormAdd" method="post" action="<?php echo URL; ?>customers/ajax_customersShow">
                <input type="hidden" id="tableName" name="tableName" value="customers"/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="customersInputSubmit" id="customersRevealAddForm" type="button" value="Add Customers" />
            </form>
        </div>
        <div class="customersSelector">
            <form id="customersFormModify" method="post" action="<?php echo URL; ?>customers/ajax_customersShow">
                <input type="hidden" name="tableName" value="customers"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="customersInputSubmit" type="submit" value="Modify Customers"/>
            </form>
        </div>
        <div class="customersSelector">
            <form id="customersFormDelete" method="post" action="<?php echo URL; ?>customers/ajax_customersShow">
                <input type="hidden" name="tableName" value="customers"/>
                <input class="customersInputSubmit" type="submit" value="Delete Customers"/>
            </form>
        </div>
    </div>
    <div id="customersMainMIDMainSectionRHS">
        <div id="usermgmtFormforAdd"></div>

    </div>
</div>       

<?php
if (!$_SESSION['Admin']) {
    header("Location: " . URL . "dashboard/index");
    exit;
}
?>
<div id="usermgmtMain">
<div id="usermgmtMainMIDMainSection">

    <div id="usermgmtMainMIDMainSectionLHS">
        <h2>User Management</h2>
        <div class="usermgmtSelector">
            <form id="usermgmtFormShow" method="post" action="<?php echo URL; ?>usermgmt/ajax_usermgmtShow">
                <input type="hidden" name="tableName" value="users"/>
                <input class="usermgmtInputSubmit" type="submit" value="Show Users"/>
            </form>
        </div>

        <div class="usermgmtSelector">
            <form id="usermgmtFormAdd" method="post" action="<?php echo URL; ?>usermgmt/ajax_usermgmtShow">
                <input type="hidden" name="tableName" value="users"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="usermgmtInputSubmit" type="submit" value="Add Users"/>
            </form>
        </div>
        <div class="usermgmtSelector">
            <form id="usermgmtFormModify" method="post" action="<?php echo URL; ?>usermgmt/ajax_usermgmtShow">
                <input type="hidden" name="tableName" value="users"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="usermgmtInputSubmit" type="submit" value="Modify Users"/>
            </form>
        </div>
        <div class="usermgmtSelector">
            <form id="usermgmtDeleteForm" method="post" action="<?php echo URL; ?>usermgmt/ajax_usermgmtShow">
                <input type="hidden" name="tableName" value="users"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="usermgmtInputSubmit" type="submit" value="Delete Users"/>
            </form>
        </div>


    </div>
    <div id="usermgmtMainMIDMainSectionRHS">

    </div>
</div>
</div>

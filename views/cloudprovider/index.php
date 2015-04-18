<div id="cloudproviderMain">
<div id="cloudproviderMainMIDMainSectionLHS">
    <h2>Cloud Provider Management</h2>
    <div class="cloudproviderSelector">
        <form id="cloudproviderFormShow" method="post" action="<?php echo URL; ?>cloudprovider/ajax_cloudproviderShow">
            <input type="hidden" id="tableName" name="tableName" value="cloudprovider"/>
            <input class="cloudproviderInputSubmit" type="button" value="Show Cloud Providers"/>
        </form>
    </div>
    <div class="cloudproviderSelector">
        <form id="cloudproviderFormAdd" method="post" action="<?php echo URL; ?>cloudprovider/ajax_cloudproviderShow">
            <input type="hidden" id="tableName" name="tableName" value="cloudprovider"/>
            <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
            <input class="cloudproviderInputSubmit" id="cloudproviderRevealAddForm" type="button" value="Add a Cloud Prvider" />
        </form>
    </div>
    <div class="cloudproviderSelector">
        <form id="cloudproviderFormModify" method="post" action="<?php echo URL; ?>cloudprovider/ajax_cloudproviderShow">
            <input type="hidden" name="tableName" value="cloudprovider"/>
            <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
            <input class="cloudproviderInputSubmit" type="submit" value="Modify a Cloud Provider"/>
        </form>
    </div>
    <div class="cloudproviderSelector">
        <form id="cloudproviderFormDelete" method="post" action="<?php echo URL; ?>cloudprovider/ajax_cloudproviderShow">
            <input type="hidden" name="tableName" value="cloudprovider"/>
            <input class="cloudproviderInputSubmit" type="submit" value="Delete a Cloud Provider"/>
        </form>
    </div>
</div>
<div id="cloudproviderMainMIDMainSectionRHS">
    <div id="usermgmtFormforAdd"></div>
</div>       
</div>

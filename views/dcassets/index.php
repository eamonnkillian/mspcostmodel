<div id="dcassetsMain">
<div id="dcAssetsMainMID">
    <div id="dcAssetsMainMIDMainSectionLHS">
        <h2>Data Center Assets Cost Management</h2>
        <div class="dcAssetsSelector">

            <form id="dcAssetsFormShow" method="post" action="<?php echo URL; ?>dcassets/ajax_dcAssetsShow">
                <input type="hidden" name="tableName" value="dcassets"/>
                <input class="dcAssetsInputSubmit" type="button" value="Show DC Assets"/>
            </form>
        </div>
        <div class="dcAssetsSelector">
            <form id="dcAssetsFormAdd" method="post" action="<?php echo URL; ?>dcassets/ajax_dcAssetsShow">
                <input type="hidden" name="tableName" value="dcassets"/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="dcAssetsInputSubmit" id="dcAssetsRevealAddForm" type="button" value="Add DC Assets" />
            </form>
        </div>
        <div class="dcAssetsSelector">
            <form id="dcAssetsFormModify" method="post" action="<?php echo URL; ?>dcassets/ajax_dcAssetsShow">
                <input type="hidden" name="tableName" value="dcassets"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="dcAssetsInputSubmit" type="submit" value="Modify DC Assets"/>
            </form>
        </div>
        <div class="dcAssetsSelector">
            <form id="dcAssetsFormDelete" method="post" action="<?php echo URL; ?>dcassets/ajax_dcAssetsShow">
                <input type="hidden" name="tableName" value="dcassets"/>
                <input class="dcAssetsInputSubmit" type="submit" value="Delete DC Assets"/>
            </form>
        </div>
    </div>
    <div id="dcAssetsMainMIDMainSectionRHS"></div>       
</div>
</div>
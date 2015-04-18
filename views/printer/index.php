<div id="printerMain">
    
    <div id="printerMainMID">
        <div id="printerMainMIDMainSectionLHS">
            <h2>Printer Assets Cost Management</h2>
            <form id="printerFormDelete" method="post" action="ajax_printerShow">
                <input id="tableName" type="hidden" name="tableName" value=""/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <p>
                <select id="printerSelect" name="list" class="printerInputSel">
                    <option selected value="">Choose a Printer Asset ...</option>
                    <option value="handheld_printer">Handheld Printer</option>
                    <option value="label_printer">Label Printer</option>
                    <option value="laser_desktop">Laser Desktop Printer</option>
                    <option value="inkjet_desktop">Inkjet Desktop Printer</option>
                    <option value="dot_matrix_printer">Dot Matrix Printer</option>
                    <option value="laser_workgroup">Laser Workgroup</option>
                    <option value="laser_multifunction">Laser Multi-function Device</option>
                    <option value="wide_format">Wide Format Printer</option>
                    <option value="cutsheet_production">Cut Sheet Production Device</option>
                    <option value="continuous_form">Continuous Form Device</option>
                </select>
                </p>
                <div id="printerMenu">
                    <div class="printerSelector"> 
                        <input class="printerInputSubmit" id="printerMenuChoiceShow" type="button" value="Show"/>
                    </div>
                    <div class="printerSelector"> 
                        <input class="printerInputSubmit" id="printerMenuChoiceAdd" type="button" value="Add"/>
                    </div>
                    <div class="printerSelector"> 
                        <input class="printerInputSubmit" id="printerMenuChoiceModify" type="button" value="Modify"/>
                    </div>
                    <div class="printerSelector"> 
                        <input class="printerInputSubmit" id="printerMenuChoiceDelete" type="button" value="Delete"/>
                    </div>
                </div>
            </form>
        </div>
        <div id="printerMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
    
</div>
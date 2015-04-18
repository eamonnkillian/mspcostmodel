<div id="aboutusMain">
    <div id="aboutusMainMID">
        
        <!--
        // This is the beginnings of a function to stop having more than
        // one registered "Us" ...
        //
        //<script type="text/javascript">
        //    $(document).ready(function(){
        //       var url = 'ajax_aboutusShow';
        //       var tableName = "aboutus";
        //       $.post(url, {'tableName':tableName}, function(response) {
        //           alert(response);
        //       });
        //       return false;
        //    });
        //</script>
        -->


        <div id="aboutusMainMIDMainSectionLHS">
            <h2>Company Information</h2>
            <div class="aboutusSelector">
            <form id="aboutusFormShow" method="post" action="<?php echo URL; ?>aboutus/ajax_aboutusShow">
                <input type="hidden" id="tableName" name="tableName" value="aboutus"/>
                <input class="aboutusInputSubmit" type="button" value="Show Our Details"/>
            </form>
            </div>
            <!--<p>&nbsp;</p>

            <br/>
            <form id="aboutusFormAdd" method="post" action="<?php echo URL; ?>aboutus/ajax_aboutusShow">
                <input type="hidden" id="tableName" name="tableName" value="aboutus"/>
                <input type="hidden" id="lastupdatedby" name="lastupdatedby" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="aboutusInputSubmit" id="aboutusRevealAddForm" type="button" value="Add Our Details" />
            </form>-->
            
            <div class="aboutusSelector">
            <form id="aboutusFormModify" method="post" action="<?php echo URL; ?>aboutus/ajax_aboutusShow">
                <input type="hidden" name="tableName" value="aboutus"/>
                <input type="hidden" id="currentupdater" name="currentupdater" value="<?php echo $_SESSION['loginname']; ?>"/>
                <input class="aboutusInputSubmit" type="submit" value="Modify Our Details"/>
            </form>
            </div>
            <!--<p>&nbsp;</p>
            <br/>

            <form id="aboutusFormDelete" method="post" action="<?php echo URL; ?>aboutus/ajax_aboutusShow">
                <input type="hidden" name="tableName" value="aboutus"/>
                <input class="aboutusInputSubmit" type="submit" value="Delete Our Details"/>
            </form>-->

        </div>
        <div id="aboutusMainMIDMainSectionRHS">
            <div id="usermgmtFormforAdd"></div>


        </div>       
    </div>
</div>
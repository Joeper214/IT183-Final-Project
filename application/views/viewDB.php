<?php $this->load->view('header'); ?>
<div class="jumbotron panel-default">
   <h3> Viewing Database: </h3><h2><?php echo $PDB ."</h2><small> size: ". $DBsize->Size;?></small> 

   <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
   <span class="glyphicon glyphicon-compressed"></span>Dump Database
   </button>

</div>
<div class="row">

<div class="col-sm-6 panel-default">
   <h3>Tables</h3>
<table class="table table-striped">
<tr>
<th> Table Name </th>
<th> Size </th>
<th> Operation</th>
</tr>
<?php
foreach($tb_name as $tables){
  echo "<tr><td>".$tables->TABLE_NAME."</td>";
  $this->load->model('Dbmodel');
  echo "<td>".$this->Dbmodel->viewTBSize($tables->TABLE_NAME,$PDB)."</td>";
  echo "<td><a href='#' data-toggle='modal' data-target='#{$tables->TABLE_NAME}'><span class='glyphicon glyphicon-compressed'></span>Dump Table</a></td></tr>";
 }
?>
</table>
</div>

<div class="col-sm-6 panel-default">
   <h3>Access Privilege</h3>
   <table class="table table-condensed">
   <tr>
   <th>Select</th>
   <th>Update</th>
   <th>Insert</th>
   <th>Delete</th>
   </table>

</div>
</div>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Create Backup: <?php echo $PDB; ?></h4>
      </div>
      <div class="modal-body">


   <form  method="post" action="<?php echo $base;?>/index.php/dbm/runBackup">
   <input type="text" maxlength="10" required="true" name="bk_name" placeholder="Enter filename here..">.sql
   <input type="hidden" name="db_name" value="<?php echo $PDB ?>">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save Changes">
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



</div>
<?php foreach($tb_name as $tables){?>
<!-- Modal Per  Tables -->
<div class="modal fade" id="<?php echo  $tables->TABLE_NAME; ?>" 
tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Create backup for table:<b> <?php echo $tables->TABLE_NAME; ?></b></h4>
      </div>
      <div class="modal-body">


   <form  method="post" action="<?php echo $base;?>/index.php/dbm/BackupTB">
   <input type="text" required="true" name="bk_name" placeholder="Enter filename here..">.sql
   <input type="hidden" name="db_name" value="<?php echo $PDB ?>">
   <input type="hidden" name="tb_name" value="<?php echo $tables->TABLE_NAME;?>">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save Changes">
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
				   <?php }?>

</div>


</div>





 </div>
</body>
</html>
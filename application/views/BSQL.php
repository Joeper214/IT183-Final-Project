<?php $this->load->view('header'); 
if(isset($message)){
  echo "<h3 class='alert alert-success'>$message</h3>";
  unset($message);
}
?>
<div class='jumbotron'>
  <h2><?php echo $mytitle; ?></h2>
  
  </div>

<div class="col-sm-6 panel-default">
<table class="table table-striped">
    <th>filename</th>
    <th>backup_type</th>
</tr>
<?php foreach($backupDBs as $row){
          echo "<tr>
                <td>
          <a class='btn btn-success' href='#'  data-toggle='modal' data-target='#{$row->backup_id}'>
          <span class='glyphicon glyphicon-import'></span> Restore</a>
                ".$row->file."</td>
                <td>".$row->backup_type."</td>
               </tr>";
}
?>
</table>
</div>

<?php foreach($backupDBs as $tables){?>
<!-- Modal Per  Tables -->
<div class="modal fade" id="<?php echo  $tables->backup_id; ?>" 
tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Confirm Restore:<b> <?php echo $tables->file; ?></b></h4>
      </div>
      <div class="modal-body">

   <form  class="from-horizontal" method="post" action="<?php echo $base;?>/index.php/dbm/restoreDB" role="form">
   <div class="form-group">
   <label for="newDB" class="col-sm-4 control-label">New Database name: </label>
      <div class="col-sm-6">				     
          <input type="text" name="new_db" placeholder="Enter new database name here.." id="newDB" class="">
      </div>
   </div>
   </br></br>
   <div class="form-group">
      
   <label for="dbType" class="col-sm-4 control-label">Database Type: </label>
      <div class="col-sm-8">
        <input id="dbType" type="radio" name="dbtype" value="production" checked="true" required="true"> Primary Database <small class="text-info">[ On production database type]</small></br>
        <input id="dbType" type="radio" name="dbtype" value="backup" required="true"> Backup Database <small  class="text-info">[Backup only database type]</small>
      </div>
   </div>
   
   <input type="hidden" name="db_name" value="<?php echo $tables->db_name?>">
   <input type="hidden" name="tb_name" value="<?php echo $tables->tb_name;?>">
   <input type="hidden" name="file" value="<?php echo $tables->file;?>">
</br></br></br></br></br></br>
  <div class="col-sm-12">
  <p class="alert-warning"> <span class="glyphicon glyphicon-warning-sign"></span> Note: if the Entered database already exists, it will be reused for uniqueness. </p>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save Changes">
      </form>
    </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
				   <?php }?>



 </div>
</body>
</html>

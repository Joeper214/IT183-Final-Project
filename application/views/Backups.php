<?php $this->load->view('header'); 
if(isset($message)){
  echo "<h3 class='alert alert-success'>$ms</h3>";
  unset($message);

}
?>
   <div class='jumbotron'>
  <h2><?php echo $mytitle; ?></h2>
  
  </div>
<?php if($backupDBs != NULL){ ?>
   <div class="col-sm-6 panel panel-default">
   <table class="table">
   <tr><th>Database Name</th>
    <th>Date Restored</th>
    <th>Total Execution Time</th>
</tr>
<?php
  $this->load->helper('date');

  foreach($backupDBs as $row){
    if($row->db_type == 0){
    $unix = mysql_to_unix($row->date_restored);
    echo "<tr><td>
    <form method='post' action='$base/index.php/dbm/BackupDB'>
    <input type='hidden' name='action' value='$row->db_name'>
    <button class='btn btn-primary' type='submit'>
".$row->db_name."</button>
</td>
                <td>".unix_to_human($unix)."</td>
                <td>".$row->runtime." second(s)</td>
                </tr>";}
  }
}else{
  echo "<div class='col-md-4'><h3>No backup Databases yet.</h3></div>";
}

?>
</table>
</div>
 </div>
</body>
</html>




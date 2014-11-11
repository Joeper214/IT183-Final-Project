<?php $this->load->view('header');  ?>

   <div class='jumbotron'>
  <h2><?php echo $mytitle; ?> <button class="btn btn-danger btn-lg" data-toggle="modal" data-target="#addUser">
           <span class="glyphicon glyphicon-plus"></span> Add User
      </button></h2>
       
   </div>
      <
<!-- Modal -->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Add new User</h4>
      </div>
      <div class="modal-body">


   <form  method="post" action="<?php echo $base;?>/index.php/dbm/addUser">
      <label> Username: </label>  <input type="text" maxlength="10" required="true" name="username" placeholder="Enter Username here..."> </br>
      <label> Password: </label> <input type="password" maxlength="10" required="true" name="password" placeholder="Enter Password here...">
   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save Changes">
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




      
      
      <div class="container">
      <h3><?php if(isset($msg)){
      echo "<span class='alert alert-{$alert}'>".$msg."</span>"; 
    }
?></h3> 
<div class="col-sm-6 panel panel-default">
      
      <table class="table table-condensed"> 
      <tr>
      <th> Operation  </th>
      <th>Username</th>

      
      </tr>
      <?php foreach($accounts as $account){ 
      if($account->username == NULL || $account->username == "root" || $account->username == "pma"){
      }else{
	?>
	<tr>
	<td><a href="#" class='link'  data-toggle="modal" data-target="#<?php echo $account->username; ?>"> <span>Edit access</a></td>
	<td><?php echo $account->username;?></td>
	
	</tr>
	<?php }} ?>
</table>
</div>
</div>





<!-- Edit Access Modal  --- >



<!-- Modal -->


    <?php foreach($accounts as $account){ 
      
      if($account->username == NULL || $account->username == "root" || $account->username == "pma"){

      }else{
	
	
	?>
	
	<div class="modal fade" id="<?php echo $account->username; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	  <div class="modal-content">
	  <div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												 <h4 class="modal-title" id="myModalLabel">Edit Access Privilege: <b> <?php echo $account->username; ?></b> </h4>
      </div>
      <div class="modal-body">

   <form  class="form-inline" method="post" action="<?php echo $base;?>/index.php/dbm/editAccess">
	
   <select class="form-control" name="db_name"> 
      <?php foreach($dbs as $row){  ?>
   if($row->db_name == "cdocl" || $row->db_name == "information_schema" || $row->db_name == "mysql" || $row->db_name == "performance_schema" || $row->db_name == "phpmyadmin"|| $row->db_name == "test" || $row->db_name == "cdcol"){
   }
   else{?>
      <option value="<?php echo $row->db_name; ?>"> <?php echo $row->db_name; ?> </option>
	<?php }
	 ?>
   </select>																								       
    
    <input type="hidden" name="username" value="<?php echo $account->username;?>">
    <input type="hidden" name="password" value="<?php echo $account->password;?>">
																								       
    <input type="radio" name="type" value="grant" class="form-control">Grant
    <input type="radio" name="type" value="revoke" class="form-control">Revoke</br>
    <input type="checkbox" name="select" value="select" class="form-control">Select
       <input type="checkbox" name="update" value="update" class="form-control">Update
       <input type="checkbox" name="delete" value="delete" >Delete
       <input type="checkbox" name="insert" value="insert" class="form-control">Insert
											    




      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save Changes">
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

       <?php 
	}}?>
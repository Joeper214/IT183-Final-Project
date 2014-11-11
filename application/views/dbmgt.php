<?php $this->load->view('header'); 
      $this->load->helper('text');
?>
<body>
   <div class='jumbotron'>
 <h2><?php echo $mytitle; ?></h2>

   </div>
 <div class='col-sm-8 panel-default controls'>
 <h3> Please Select a Database:  </h3>
   <form class="form-inline"  method="post" action="<?php echo $base;?>/index.php/dbm/PrimaryDB">
     <select name='action' class="form-control">
	<?php foreach ($query as $row) {
   if($row->db_name == "cdocl" || $row->db_name == "information_schema" || $row->db_name == "mysql" || $row->db_name == "performance_schema" || $row->db_name == "phpmyadmin"|| $row->db_name == "test" || $row->db_name == "cdcol"){
   }
   else{?>
       <option value="<?php echo $row->db_name;?>">
       <?php echo $row->db_name; }
   }
  ?> </option> 
     </select>
   <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-eye-open"></span> View</button>
   </form>




 </div>
</body>
</html>
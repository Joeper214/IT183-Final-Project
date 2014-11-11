<?php $this->load->view('header'); ?>
<div class="jumbotron">
   <a href="<?php echo $base;?>/index.php/dbm/PrimaryDB">Return</a>
   <?php foreach($tb_name as $tables) { ?>
<h3><?php echo $tables->TABLE_NAME. 
     "<small>&nbsp &nbsp ";
   $this->load->model('Dbmodel');
echo $this->Dbmodel->viewTBSize($tables->TABLE_NAME,$db)
     ."</small></h3>";
          }?>
</div>


 </div>
</body>
</html>
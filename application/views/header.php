<html>
<head>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">  
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width"> 
   
  <title>Database Management</title>
   <base href= <?php echo "$base"; ?> >

<script type="text/javascript" src="<?php echo "$base/$jQuery";?>"></script>
   <script type="text/javascript" src="<?php echo "$base/$jQueryB";?>"></script>
<link rel="stylesheet" type="text/css" href="<?php echo "$base/$css";?>">
<link rel="stylesheet" type="text/css" href="<?php echo "$base/$bootstrap";?>">


</head> 
  <h3>
   <ul class="nav nav-tabs nav-fixed-top alert-info" role="navigation">
   <li><a href="#" class="navbar-brand">  </a></li>
   <li class="<?php if($nav == 'Primary') {
               echo 'active'; }
           ?>"><a href="<?php echo $base;?>/index.php">
   <span class="glyphicon glyphicon-tag"></span> Primary Databases </a> </li>
							 
							 <li class="<?php if($nav == 'Backup'){
              echo 'active'; }
           ?>"><a href="<?php echo $base;?>/index.php/dbm/restoreDB">
<span class="glyphicon glyphicon-inbox"></span> Backup Databases </a></li>
							 
							 <li class="<?php if($nav == 'SQL'){
              echo 'active'; }
           ?>"><a href="<?php echo $base;?>/index.php/dbm/BSQL">
   <span class="glyphicon glyphicon-trash"></span> Backup SQL Files </a></li>
  
   <li class="<?php if($nav == 'Account'){
              echo 'active'; }
           ?>"><a href="<?php echo $base;?>/index.php/dbm/Accounts">
   <span class="glyphicon glyphicon-user"></span> Accounts </a></li>

</ul>
</h3>


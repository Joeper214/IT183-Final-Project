<?php $this->load->view('header_login');  ?>

<div class="jumbotron">
   <h2> Database Management <small>Please login before you can start to use the system.</small></h2>
</div>
<div class="container">
<div class="col-sm-6 jumbotron panel panel-default">

<form role="form" action="<?php echo $base; ?>/index.php/dbm/login">
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Username" maxlength="15">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"  maxlength="15">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form>

</div>
</div>
</div>
</body>
</html>



<!--- 
   create user <username@localhost> identified by '<password>';
   grant all privileges on <db_name> to <username@localhost>;
   revoke all privileges on <db_name> from <username@localhost>;
   


-->

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dbmodel extends CI_Model {

    function __construct()
    {
        parent::__construct();
	$this->load->database();
	//	$this->load->driver('pdo'); 
	$this->base = $this->config->item('base_url');
    }
    public function PrimaryDB(){
      $query = $this->db->query("SELECT schema_name 
                   FROM INFORMATION_SCHEMA.SCHEMATA
                   ");
      return $query->result();
    }
    public function BackupDB(){
      $this->db->query('USE backup_db');
      $query = $this->db->get('backup_files');
      return $query->result();
    }
    public function viewBackups(){
      $this->db->query('USE backup_db');
      $query = $this->db->get('backup_databases');
      return $query->result();
    }
    public function viewDBSize($schema){
      $query = $this->db->query("SELECT 
              CONCAT(sum(ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024),2)),' MB') AS Size 
              FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='$schema'");
      return $query->row();       
    }
    public function viewTB($db_name){
      $query = $this->db->query("SELECT TABLE_NAME
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA='$db_name'");
      return $query->result();
    }
    public function viewTBSize($tb,$db){
      $query = $this->db->query("SELECT 
             CONCAT(sum(ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024),2)),' MB') AS Size 
             FROM INFORMATION_SCHEMA.TABLES 
             WHERE TABLE_SCHEMA='$db' 
                 AND TABLE_NAME='$tb'");
       
      foreach ($query->result() as $row)
	{
	  return $row->Size;
	}
    }
    public function createDBB($db_name,$bk_name){
      $database = $db_name;
      $file_name = $bk_name.".sql";
      $btype = "Database";
      //backup variables
      $command = null;
      $output_file = "backupfiles";
      $this->load->helper('path');


      //insert into db
      $this->load->model('Dbmodel');

      $this->Dbmodel->insertDBB($database,$file_name,$btype);
      
      //$dsn = 'msql://@root/'.$database;
      $this->db->query('USE '.$database);
      $command = "/opt/lampp/bin/mysqldump -u root -h localhost $database > ".set_realpath($output_file).$file_name;
      exec($command); 
    }
    public function createTBB($db_name,$bk_name,$tb_name){
      $database = $db_name;
      $file_name = $bk_name.".sql";
      $btype = "Table";
      //backup variables
      $command = null;
      $output_file = "backupfiles";
      $this->load->helper('path');
      ;
      //insert into db
      $this->load->model('Dbmodel');

      $this->Dbmodel->insertTBB($database,$tb_name,$file_name,$btype);
      
      //$dsn = 'msql://@root/'.$database;
      $this->db->query('USE '.$database);
      $command = "/opt/lampp/bin/mysqldump -u root -h localhost $database $tb_name > ".set_realpath($output_file).$file_name;
      exec($command); 
    }
    public function initialize_restore($db_name,$tb_name,$file,$new_db,$dbtype){	$db_type = NULL;
      //Loading Database utility class and check if database exists
      $this->load->dbutil();
      $this->load->model('Dbmodel');
      if($dbtype == 'production'){
	$db_type = 1;
         if(!$this->dbutil->database_exists($new_db)){
	   $this->db->query('create database '.$new_db.';');
	   $this->Dbmodel->run_restore($new_db,$file);
	   $this->Dbmodel->insert_restoredDB($new_db,$db_type);
	 }
         else{
	   $this->Dbmodel->run_restore($db_name,$file);
	   $this->Dbmodel->insert_restoredDB($new_db,$db_type);
	 }
      }else if($dbtype == 'backup'){
	$db_type = 0;
         if(!$this->dbutil->database_exists($new_db)){
	   $this->db->query('create database '.$new_db.';');
	   $this->Dbmodel->run_restore($new_db,$file);
	   $this->Dbmodel->insert_restoredDB($new_db,$db_type);
	}else{
	   $this->Dbmodel->run_restore($db_name,$file);
	   $this->Dbmodel->insert_restoredDB($new_db,$db_type);
	   //$this->benchmark->mark('code_end');
	   //$runtime = $this->benchmark->elapsed_time('code_start','code_end');
	   //$this->Dbmodel->insert_restoredDB($new_db);
	   //$data = array('db_name' => $db_name, 'runtime' => $runtime);
	   //$this->db->query('USE backup_db');
	   //$this->db->where('db_name',$db_name);
	   //$this->db->update('backup_databases',$data);
	}
      }
    }
    public function insert_restoredDB($db,$btype){
      $this->benchmark->mark('code_end');
      $this->db->query('USE backup_db');
      $runtime = $runtime = $this->benchmark->elapsed_time('code_start','code_end');
      $data = array('db_name' => $db, 'runtime' => $runtime, 'db_type' => $btype);
      $this->db->insert('backup_databases', $data);
    }
    public function insertDBB($db,$file_name,$btype){
      $this->db->query('USE backup_db');
      $data = array('file' => $file_name, 'db_name' => $db, 'backup_type' => $btype);
      $this->db->insert('backup_files',$data);
    }

    public function run_restore($db_name,$file){
      //Loading Database utility class and check if database exists
      $this->load->dbutil();
      $database = $db_name;
      //backup variables

      $command = null;
      $output_file = "backupfiles";
      $this->load->helper('path');
      //insert into db
      //$dsn = 'msql://@root/'.$database;
      $command = "/opt/lampp/bin/mysql -u root -h localhost $database < ".set_realpath($output_file).$file;
      exec($command); 
    }
    public function insertTBB($db,$tb,$file_name,$btype){
      $this->db->query('USE backup_db');
      $data = array('file' => $file_name, 'db_name' => $db, 
                    'tb_name' => $tb,
                     'backup_type' => $btype);
      $this->db->insert('backup_files',$data);
    }
    public function checkPrimaryDB(){
      $this->db->query('USE backup_db');
      $this->db->from('backup_databases');
      $this->db->where('db_type',1);
      $query = $this->db->get();
      
      return $query->result();
    }

    public function checkBackupDB($db_name){
      $this->db->query('USE backup_db');
      $result = $this->db->query('SELECT * from backup_databases 
                        where db_name='.$db_name.' and db_type=0');
      if($result->num_rows() > 0){
	return true;
      }else{
	return false;
      }
    }
    public function show_Accounts(){
      $this->db->query('USE mysql');
      $query = $this->db->query('select User, Host from user');
      return $query->result();
    }
    public function db_Accounts(){
      $this->db->query('USE backup_db');
      $query = $this->db->get('user');
      return $query->result();      
    }
    public function addUser($user,$pass){
      $this->db->query('USE mysql');
      //$this->db->query();
      $this->db->query('create user '.$user."@localhost identified by '".$pass."'");
      $this->db->query('USE backup_db');
      $data = array('username' => $user , 'password' => $pass);
      $this->db->insert('user',$data);
    }
    public function grantAccess($params,$pass,$db,$user){
      $this->db->query('USE mysql');
      if(isset($params['select'])&&($params['select'] == 1)){

	//GRANT SELECT, INSERT ON `animalcare`.* TO 'albert'@'localhost'WITH GRANT OPTION;


	$query = $this->db->query("GRANT SELECT ON '".$db."'.* TO '".$user."'@'localhost' WITH GRANT OPTION");
      $this->db->query('flush privileges');
      echo $query;

      }


      /*
      if(isset($params['update'])&&($params['update'] == 1 )){
	$this->db->query("grant update on ".$db.".* to ".$user."@localhost identified by '".$pass."';");
      $this->db->query('flush privileges');
    }
      if(isset($params['delete'])&&($params['delete'] == 1 )){
      $this->db->query("grant delete on ".$db.".* to ".$user."@localhost identified by '".$pass."';");
      $this->db->query('flush privileges');
    }
      if(isset($params['insert'])&&($params['insert'] == 1)){
      $this->db->query("grant insert on ".$db.".* to ".$user."@localhost identified by '".$pass."';");
      $this->db->query('flush privileges');
      }*/
           
    }
    public function revokeAccess($params,$pass){
    }
}
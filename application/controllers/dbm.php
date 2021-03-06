
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dbm extends CI_Controller {
  var $base;
  var $css;
  var $bootstrap;
  var $jQueryB;
  var $jQuery;
  
  public function __construct(){
    parent::__construct();
    $this->load->database();
    $this->base = $this->config->item('base_url');
    $this->css = $this->config->item('css');
    $this->jQueryB = $this->config->item('jQueryB');
    $this->jQuery = $this->config->item('jQuery');
    $this->bootstrap = $this->config->item('bootstrap');
  }
  public function hello($name){
    $data['css'] = $this->css;
    $data['base'] = $this->base;
    $data['bootstrap'] = $this->bootstrap;
    $data['mytitle'] = 'Welcome to this site';
    
    $this->load->view('dbmgt',$data);
  }
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['nav'] = 'Primary';
	  $data['mytitle'] = 'Database Monitor and Backup Program (in MYSQL)';
	  $this->load->model('Dbmodel');
	  $data['query'] = $this->Dbmodel->checkPrimaryDB();
	  $this->load->view('dbmgt',$data);
	}
	
	public function PrimaryDB(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['nav'] = 'Primary';
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Databases';
	  if(isset($_POST['action'])){
	    $data['PDB'] = $this->input->post('action');
	    $this->load->model('Dbmodel');
	    $data['DBsize'] = $this->Dbmodel->viewDBSize($data['PDB']);
	    $data['tb_name'] = $this->Dbmodel->viewTB($data['PDB']);
	    $this->load->view('viewDB',$data);
	  } 
	}
	public function BackupDB(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['nav'] = 'Backup';
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Databases';
	  if(isset($_POST['action'])){
	    $data['PDB'] = $this->input->post('action');
	    $this->load->model('Dbmodel');
	    $data['DBsize'] = $this->Dbmodel->viewDBSize($data['PDB']);
	    $data['tb_name'] = $this->Dbmodel->viewTB($data['PDB']);
	    $this->load->view('viewDB',$data);
	  } 
	}
	public function viewTables($db_name){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['nav'] = 'Primary';
	  $data['bootstrap'] = $this->bootstrap;

	  if(isset($db_name)){
	     $this->load->model('Dbmodel');
	     $data['db'] = $db_name;
	     $data['mytitle'] = 'Tables of $db_name';
	     $data['tb_name'] = $this->Dbmodel->viewTB($db_name);
	     $this->load->view('tables',$data);
	  }else{
	    
	  }
	  
	}
	public function runBackup(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['nav'] = 'SQL';
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Backup SQL files';
	  
	  if(isset($_POST['db_name'])){
	    $this->load->model('Dbmodel');
	    $this->Dbmodel->createDBB($_POST['db_name'],$_POST['bk_name']);
	    $data['message'] = "The database backup successfull!";
	    $data['backupDBs'] = $this->Dbmodel->BackupDB();
	    $this->load->view('BSQL',$data);
	    unset($_POST['db_name']);	    
	  }
	  else{
	    $this->load->model('Dbmodel');
	    
	    $data['backupDBs'] = $this->Dbmodel->BackupDB();
	    $this->load->view('BSQL',$data);
	  }
	}
	public function BackupTB(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['nav'] = 'SQL';
	  $data['mytitle'] = 'Backup SQL files';
	  
	  if(isset($_POST['db_name'])){
	    $this->load->model('Dbmodel');
	    $this->Dbmodel->createTBB($_POST['db_name'],$_POST['bk_name'],$_POST['tb_name']);
	    $data['message'] = "The database backup successfull!";
	    $data['backupDBs'] = $this->Dbmodel->BackupDB();
	    $this->load->view('BSQL',$data);
	    unset($_POST['db_name']);	    
	  }
	  else{
	    $this->load->model('Dbmodel');
	    $data['backupDBs'] = $this->Dbmodel->BackupDB();
	    $this->load->view('BSQL',$data);
	  }
	}
	public function BSQL(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['nav'] = 'SQL';
	  $data['mytitle'] = 'Backup SQL files';
	    $this->load->model('Dbmodel');
	    $data['backupDBs'] = $this->Dbmodel->BackupDB();
	    $this->load->view('BSQL',$data);
	}
	
	public function restoreDB(){
	  $this->benchmark->mark('code_start');
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Backup/Restored Databases';
	  $data['nav'] = 'Backup';
	  $this->load->model('Dbmodel');
	  if(isset($_POST['db_name'])){
	    $this->Dbmodel->initialize_restore($_POST['db_name'],$_POST['tb_name'],$_POST['file'],$_POST['new_db'],$_POST['dbtype']);
	    $data['msg'] = $_POST['file']."has Successfully Restored!";
	    $data['backupDBs'] = $this->Dbmodel->viewBackups();
	    $this->load->view('Backups',$data);
	  }
	  else{
	    $data['backupDBs'] = $this->Dbmodel->viewBackups();
	    $this->load->view('Backups',$data);
	  }
	}
	public function Accounts(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Account Manager';
	  $data['nav'] = 'Account';
	  $this->load->model('Dbmodel');
	  $data['accounts'] = $this->Dbmodel->db_Accounts();
	  $data['dbs'] = $this->Dbmodel->checkPrimaryDB();
	  $this->load->view('Accounts',$data);
	}
	public function addUser(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Account Manager';
	  $data['nav'] = 'Account';
	  $user = NULL;
	  $pass = NULL;
	  $this->load->model('Dbmodel');
	  $this->load->helper('url');
	  
	  if(isset($_POST['username'])&&isset($_POST['password'])){
	    $user = $_POST['username'];
	    $pass = $_POST['password'];
	    
	    $this->Dbmodel->addUser($user,$pass);
	    $data['accounts'] = $this->Dbmodel->db_Accounts();
	    $data['msg'] = "Account Successfully Added!";
	    $data['alert'] = "success";
	    //redirect('/dbm/Accounts/','refresh');
	    $this->load->view('Accounts',$data);
	  }else{
	    $data['msg'] = "Creation Failed";
	     $data['alert'] = "danger";
	    redirect('/dbm/Accounts/','refresh');
	  }
	}



	public function editAccess(){
	  $data['css'] = $this->css;
	  $data['base'] = $this->base;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['bootstrap'] = $this->bootstrap;
	  $data['mytitle'] = 'Account Manager';
	  $this->load->model('Dbmodel');
	  $this->load->helper('url');
	  $data['nav'] = 'Account';
	  $data['accounts'] = $this->Dbmodel->db_Accounts();
	  if(isset($_POST['db_name'])){
	    if($_POST['type'] == "grant"){
	      $params = array();
	      
	      $this->Dbmodel->grantAccess($_POST['password'],$_POST['db_name'],$_POST['username']);
	      $data['msg'] = 'Grant Successful';
	      $data['alert'] = "success";
	      $this->load->view('Accounts',$data);
	    }else if($_POST['type'] == "revoke"){
	      $this->Dbmodel->revokeAccess($_POST,$_POST['password'],$_POST['db_name'],$_POST['username']);
	      $data['msg'] = 'Revoke Successful';
	      $data['alert'] = "success";
	       $this->load->view('Accounts',$data);
	    }
	    
	  }
	}

}


	
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */

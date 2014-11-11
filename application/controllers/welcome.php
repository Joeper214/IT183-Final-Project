<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {
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
	  $data['bootstrap'] = $this->bootstrap;
	  $data['jQueryB'] = $this->jQueryB;
	  $data['jQuery'] = $this->jQuery;
	  $data['mytitle'] = 'Database Management System';
	  $this->load->model('Dbmodel');
	  $data['query'] = $this->Dbmodel->PrimaryDB();
	  $this->load->view('dbmgt',$data);
	}

	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Start extends CI_Controller {
  var $base;
  var $css;
  
  public function __construct(){
    parent::__construct();
    $this->load->database();
    $this->base = $this->config->item('base_url');
    $this->css = $this->config->item('css');
  }
  public function hello($name){
    $data['css'] = $this->css;
    $data['base'] = $this->base;
    $data['mytitle'] = 'Welcome to this site';
    $data['mytext'] = "Hello, $name, now we're getting dynamic!";
    $this->load->view('testview',$data);
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
		$this->load->view('welcome_message');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
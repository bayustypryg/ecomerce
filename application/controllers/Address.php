<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Address extends MY_Controller {
    
    private $id;

    public function __construct()
    {
        parent::__construct();
        $is_login   = $this->session->userdata('is_login');
        $this->id   = $this->session->userdata('id');

        if (! $is_login) {
            redirect(base_url());
            return;
        }
    }
    
    public function index()
    {
        $data['title']      = 'Address';
        // $data['content']    = $this->address->where('id_user', $this->id)->orderBy('date', 'DESC')->paginate($page)->get();
        $data['page']       = 'pages/address/index';
        
        return $this->view($data);
    }

    public function create()
    {
        $data['title']      = 'Form Address';
        // $data['content']    = $this->address->where('id_user', $this->id)->orderBy('date', 'DESC')->paginate($page)->get();
        $data['page']       = 'pages/address/form_address';
        
        return $this->view($data);
    }

}
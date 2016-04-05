<?php

class Administration extends CI_Controller
{

    public function parser($settings = 'index')
    {
        $this->load->helper('translit');
        $this->load->library('ion_auth');
        if (!$this->ion_auth->logged_in()) {
            redirect('/auth/login/', 'refresh');
        } elseif (!$this->ion_auth->is_admin()) {
            return show_error('You must be an administrator to view this page.');
        }
        $this->load->view('templates/header');
        $this->load->model('parser_list');
        if($settings == 'add') {
            $this->load->view('administration/parser');
        } elseif($settings == 'index') {
            $data["list_parser"] = $this->parser_list->get_list_parser();
            $this->load->view('administration/new_parser', $data);
        } else{
            $data["item_parser"] = $this->parser_list->select_pars($settings);
            $this->load->view('administration/parser', $data);
        }
        $this->load->view('templates/footer');
    }

    /*public function add()
    {
        $data["name_pars"] = $this->input->post('name_pars');
        $this->load->view('templates/header');
        $this->load->view('administration/parser', $data);
        $this->load->view('templates/footer');
    }*/
}
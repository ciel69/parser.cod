<?php

class Pages extends CI_Controller
{

    public function view($page = 'home')
    {

        $this->load->library('ion_auth');
        if (!$this->ion_auth->logged_in()) {
            redirect('/auth/login/', 'refresh');
        } elseif (!$this->ion_auth->is_admin())
        {
            return show_error('You must be an administrator to view this page.');
        }
        $data['base_url'] = base_url();
        if (!file_exists(APPPATH . 'views/pages/' . $page . '.php')) {
            show_404();
        }

        $this->load->model('select_test');
        $data['query'] = $this->select_test->get_last_ten_entries();

        $data['title'] = ucfirst($page); // Capitalize the first letter

        $this->load->view('templates/header', $data);
        $this->load->view('pages/' . $page, $data);
        $this->load->view('templates/footer', $data);
    }
}
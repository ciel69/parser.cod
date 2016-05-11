<?php

class Administration extends CI_Controller
{

    public function parser($settings = 'index', $pars = "")
    {
        $this->load->helper(array('form', 'url', 'translit', 'request_url', 'formation_helper'));
        $this->load->library('ion_auth');
        if (!$this->ion_auth->logged_in()) {
            redirect('/auth/login/', 'refresh');
        } elseif (!$this->ion_auth->is_admin()) {
            return show_error('You must be an administrator to view this page.');
        }
        $this->load->view('templates/header');
        $this->load->model('parser_list');
        if ($settings == 'add') {
            $this->load->view('administration/parser');
        } elseif ($settings == 'index') {
            $data["list_source"] = $this->parser_list->get_list_source();
            $this->load->view('administration/new_parser', $data);
        } elseif (!empty($pars)) {
            if ($pars == "add") {
                $property_def = $this->parser_list->get_default_property();
                $arItems = $this->parser_list->get_property_source($settings);

                $data["newDefItem"] = format_array_parser($property_def, $arItems);
                $this->load->view('administration/parser', $data);
            } else {
                $data["item_parser"] = $this->parser_list->select_pars($pars);
                $property_def = $this->parser_list->get_default_property();

                $data["newDefItem"] = format_array_parser($property_def, $data["item_parser"]);;
                $this->load->view('administration/parser', $data);
            }
        } else {
            $data["list_parser"] = $this->parser_list->get_list_parser($settings);
            $this->load->view('administration/new_parser', $data);
        }
        $this->load->view('templates/footer');
        /*
         * comments test
         */
    }

}
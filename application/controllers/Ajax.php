<?php

class Ajax extends CI_Controller
{
    function __construct()
    {
        ini_set("max_execution_time", "0");
        ini_set("memory_limit", "-1");
        parent::__construct();
        $this->load->library('ion_auth');
        $this->load->library('session');
        $this->load->database();
        $this->load->library(array('ion_auth', 'form_validation'));
        $this->load->helper(array('url', 'language'));

        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

        $this->lang->load('auth');
    }

    public function index()
    {
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        $comment = $this->input->post('comment');
        echo $comment . " заказ успешно сделан";
    }

    public function parser()
    {

        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }

        $url = $this->input->post('url');
        $arInputs["item_class"] = $this->input->post('item');
        $arInputs["next_link"] = $this->input->post('next_link');
        $arInputs["name_item"] = $this->input->post('name_item');
        $arInputs["code_item"] = $this->input->post('code_item');
        $arInputs["exceptions"] = $this->input->post('exceptions');
        $arInputs["link_reviews"] = $this->input->post('link_reviews');
        $arInputs["class_review"] = $this->input->post('class_review');
        $arInputs["class_page_rev"] = $this->input->post('class_page_rev');
        
        $rowSite_url = explode("\n", $url);
        $this->load->model('parser_select');
        foreach ($rowSite_url as $cell => $site_url) {
            $arInputs["site_url"] = $site_url;
            $result = $this->parser_select->categories($arInputs, 0);

        }
        echo "Я спарсил";
    }
    public function search(){
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        $search_query = $this->input->post('query');
        if(!empty($search_query)){
            $query = (string)$search_query;
            $array = array();
            $request  = $this->db->query("SELECT `description`, `name` FROM `prefix_name` WHERE `description` LIKE '%$query %' OR `name` LIKE '%$query%' LIMIT 0, 10");
            foreach ($request->result() as $row)
            {
                $array[] =  $row->name;
            }
            echo"['".implode("','", $array)."']";
        }
        exit();
    }
    public function save_parser(){
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        $arParser = $this->input->post('parser');
        $this->load->model('parser_list');
        $res = $this->parser_list->add_parser($arParser);
        echo json_encode(array('success'=>$res));
    }
}
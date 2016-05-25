<?php

class Ajax extends CI_Controller
{
    function __construct()
    {   session_write_close();
        ini_set("max_execution_time", "0");
        ini_set("memory_limit", "-1");
        parent::__construct();
        $this->load->helper('formation_helper');
        $this->load->library('ion_auth');
        $this->load->library('session');
        $this->load->database();
        $this->load->library(array('ion_auth', 'form_validation'));
        $this->load->helper(array('url', 'language', 'form'));

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
    
    public function get_property()
    {
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        
        $this->load->model('parser_select');
        $arParser = $this->input->post('parser');
        
        foreach ($arParser as $key=>$item_parse){
            $arInputs[$key] = $item_parse;
        }
        
        unset($arParser);
        
        $rowSite_url = explode("\n", $arInputs["url"]);
        
        foreach ($rowSite_url as $cell => $site_url) {
            $arInputs["site_url"] = $site_url;
            $result = $this->parser_select->get_properties($arInputs);
        }
        
        echo json_encode($result);
    }
    
    public function parser()
    {

        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        session_write_close();
//        $url = $this->input->post('url');
        $arParser = $this->input->post('parser');
        foreach ($arParser as $key=>$item_parse){
            $arInputs[$key] = $item_parse;
        }

        //$arInputs["id_parser"]
        unset($arParser);
        vdgu($arInputs);
        if(!empty($arInputs)) {
            $this->load->model('core_admin');
            $arInputs["name_source"]=$this->core_admin->get_property_source("tr_name", $arInputs["id_parser"]);
            $rowSite_url = explode("\n", $arInputs["url"]);
//            $this->load->library('daemon');
//            $this->daemon->execute_background('parser_select', 'categories', $arInputs);
            $this->load->model('parser_select');
            foreach ($rowSite_url as $cell => $site_url) {
                $arInputs["site_url"] = $site_url;
                $result = $this->parser_select->categories($arInputs, 0);
            }
            echo "Я спарсил";
        }
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
        /*if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }*/
        $arParser = $this->input->post('parser');
        if(!empty($arProp["img_filter"])){
            $uploaddir = '/color/img/upload/';
            $uploadfile = $uploaddir . basename($_FILES['img_filter']['name']);
            if (move_uploaded_file($_FILES['img_filter']['tmp_name'], $uploadfile)) {
                $arProp["img_filter"] = $uploadfile;
            }
        }
        $this->load->model('parser_list');
        $res = $this->parser_list->add_parser($arParser);
        echo json_encode(array('success'=>$res,'file'=>$_FILES));
    }
    public function source(){
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        $id_source = $this->input->post('id_source');
        $this->load->model('parser_list');
        $res = $this->parser_list->get_source($id_source);
        echo json_encode(array('success'=>$res));
    }
    public function item_parser(){
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        $id_parser = $this->input->post('id_parser');
        $this->load->model('parser_list');
        $res = $this->parser_list->get_parser($id_parser);
        echo json_encode(array('success'=>$res));
    }

    public function get_properties(){
        $this->output->enable_profiler(false); // чтобы не вывелась отладка нечаянно
        if ($this->input->server('HTTP_X_REQUESTED_WITH') != 'XMLHttpRequest') {
            echo "не-аякс не разрешен. пошел вон грязный хакир.";
            return;
        }
        $id_parser = $this->input->post('id_parser');
        $this->load->model('parser_list');
        $res = $this->parser_list->get_prop_parser($id_parser);
        echo json_encode($res);
    }
    public function color(){
        define('SITEPATH', '../');
        if (isset($_POST['colorator'])) {
            $this->load->library('generator_color');
            if (!empty($_FILES['image']) and $_FILES['image']['error'] == 0) {
                $f_name = trim($_FILES['image']['name']);
                $f_tmp = $_FILES['image']['tmp_name'];
                move_uploaded_file($f_tmp, '/home/ciel/parser.cod/color/img/' . $f_name);
                $fi = pathinfo('/home/ciel/parser.cod/color/img/' . $f_name);
                $iobj = strtolower($fi["extension"]);
                @rename('/home/ciel/parser.cod/color/img/' . $f_name, '/home/ciel/parser.cod/color/img/' . md5($f_name) . '.' . $iobj);
                $f_name = md5($f_name) . '.' . $iobj;
                if (in_array($iobj, array('jpg')) !== false) {
                    $colors = $this->generator_color->getImageColor('/home/ciel/parser.cod/color/img/' . $f_name, isset($_POST['count']) ? $_POST['count'] : 10, isset($_POST['step']) ? $_POST['step'] : 5);
                    print_r($colors);
                } else echo 'Данный формат не поддерживается';
            } else echo 'Ошибка при загрузке файла';
        }
    }
    public function test_color(){
        $this->load->library('generator_color');
        $colors = $this->generator_color->getImageColor('./color/img/Tehnoshoe/36/001.jpg', 3, 5);

        $p_colors = gpn($colors);
        vdgu($p_colors);
        print_r($colors);
    }
    public function saveImage(){
//        echo $_FILES['images']['tmp_name'];
        $uploaddir = './color/img/';
        $uploadfile = $uploaddir . basename($_FILES['images']['name']);

        if (move_uploaded_file($_FILES['images']['tmp_name'], $uploadfile)) {

            echo substr($uploadfile, 1);
        } else {
            echo "Возможная атака с помощью файловой загрузки!\n";
        }
    }
}
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: alex4_000
 * Date: 30.03.2016
 * Time: 23:33
 */
class Parser_list extends CI_Model
{
    public $name;
    public $id;
    public $date;

    public function __construct()
    {
        parent::__construct();
    }

    public function get_list_parser($start_count = 0, $end_count = 10){
        $query = $this->db->get('list_parser',$start_count, $end_count);
        return $query->result();
    }
    public function add_parser($arProp){
        if (!empty($arProp["name_source"])){
            $data = array(
                "name" => $arProp["name_source"]
            );
            $this->db->insert('source_pars', $data);
            unset($data);
            sleep(1);
        }
        $query = $this->db->query("SELECT * FROM reviews.source_pars WHERE name = '".$arProp["name_source"]."'");
        foreach ($query->result() as $row)
        {
            $id = $row->id;
        }
        $data = array(
            'id_source' => $id ,
            "name" => $arProp["name_parser"]
        );
        $this->db->insert('list_parser', $data);
        sleep(1);
        $query = $this->db->query("SELECT * FROM reviews.list_parser WHERE name = '".$arProp["name_parser"]."'");
        foreach ($query->result() as $row)
        {
            $id = $row->id;
        }
        $data = array(
            'id_parser' => $id ,
            'class_item' => $arProp["item"]
        );
        $this->db->insert('properties_parser', $data);
        return $id;
    }
    public function select_pars($id){
        $this->id = $id;
        $query = $this->db->query("SELECT * FROM reviews.list_parser WHERE id = '$this->id'");
        return $query->result();
    }
    /*public function update_parser($arParams){
        $data = array(
            "id" => $arParams["id"],
            "name" => $arParams["name"]
        );
        $this->id = $id;
        $this->date= time();
        $this->db->update('properties_parser', $this, array('id' => $_POST['id']));
    }*/
}
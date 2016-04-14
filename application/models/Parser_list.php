<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

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
        $this->load->helper('translit');
        parent::__construct();
    }

    public function get_list_parser($source, $start_count = 0, $end_count = 10)
    {
        $this->db->where('tr_name', $source);
        $query = $this->db->get('source_pars', $start_count, $end_count);
        foreach ($query->result() as $row) {
            $id_source = $row->id;
        }
        $this->db->where('id_source', $id_source);
        $query = $this->db->get('list_parser', $start_count, $end_count);
        return $query->result();
    }

    public function get_list_source($start_count = 0, $end_count = 10)
    {
        $query = $this->db->get('source_pars', $start_count, $end_count);
        return $query->result();
    }

    public function add_parser($arProp)
    {
        //num_rows
        $query = $this->db->query("SELECT * FROM reviews.source_pars WHERE name_source = '" . $arProp["name_source"] . "'");
        if ($query->num_rows() == 0) {
            $data = array(
                "name_parser" => $arProp["name_source"],
                "tr_name" => rus2translit($arProp["name_source"])
            );
            $this->db->insert('source_pars', $data);
            unset($data);
            sleep(1);
            $query = $this->db->query("SELECT * FROM reviews.source_pars WHERE name_source = '" . $arProp["name_source"] . "'");
        }

        foreach ($query->result() as $row) {
            $id = $row->id;
        }
        $query = $this->db->query("SELECT * FROM reviews.list_parser WHERE name_parser = '" . $arProp["name_parser"] . "' AND id_source = '" . $id . "'");
        if ($query->num_rows() == 0) {
            $data = array(
                'id_source' => $id,
                "name_parser" => $arProp["name_parser"]
            );
            $this->db->insert('list_parser', $data);
            sleep(1);
            $query = $this->db->query("SELECT * FROM reviews.list_parser WHERE name_parser = '" . $arProp["name_parser"] . "'");
            foreach ($query->result() as $row) {
                $id_parser = $row->id;
            }
            $data = array(
                'id_parser' => $id_parser,
                'class_item' => $arProp["class_item"],
                'next_link' => $arProp["next_link"]
            );
            $this->db->insert('properties_parser', $data);
        } else {
            foreach ($query->result() as $row) {
                $id_parser = $row->id;
            }
            $query = $this->db->query("SELECT * FROM reviews.properties_parser WHERE id_parser = '" . $id_parser . "'");
            foreach ($query->result() as $row) {
                $id = $row->id;
            }
            $data["id_parser"] = $id_parser;
            foreach ($arProp as $key => $property) {
                if (($key == "name_source") || ($key == "name_parser") || ($key == "id_pars")) {
                    continue;
                }
                    if (!empty($property)) {
                        $data[$key] = $property;
                    } else {
                        $data[$key] = null;
                    }
            }
            $this->db->where('id', $id);
            $update = $this->db->update('properties_parser', $data);
            unset($data);
            if(empty($update)) {
                $data = array(
                    "name_parser" => $arProp["name_source"],
                    "tr_name" => rus2translit($arProp["name_source"])
                );
                $this->db->where('id', $id_parser);
                $this->db->update('source_pars', $data);
            }
        }
        return $id_parser;
    }

    public function select_pars($id)
    {
        $this->id = $id;
        $query = $this->db->query("SELECT * FROM reviews.properties_parser WHERE id_parser = '$this->id'");
        $query1 = $this->db->query("SELECT * FROM reviews.list_parser WHERE id = '$this->id'");
        foreach ($query1->result() as $row) {
            $id_source = $row->id_source;
        }
        $query2 = $this->db->query("SELECT * FROM reviews.source_pars WHERE reviews.source_pars.id = '$id_source'");
        $arResult = array_merge(array("properties_parser" => $query->result_array()), array("list_parser" => $query1->result_array()), array("source_pars" => $query2->result_array()));
        return $arResult;
    }

    public function get_source($id)
    {
        $this->db->where('id_source', $id);
        $query = $this->db->get('list_parser');
        return $query->result();
    }

    public function get_parser($id)
    {
        $this->db->where('id_parser', $id);
        $query = $this->db->get('properties_parser');
        return $query->result();
    }

    function get_list_property($item){
        $this->db->where('class_property', $item);
        $query = $this->db->get('default_property');
        return $query->result_array();
    }
    function get_default_property(){
        $query = $this->db->get('default_property');
        return $query->result_array();
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
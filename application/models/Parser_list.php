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
        $id_parser = 0;
        $query = $this->db->query("SELECT * FROM reviews.source_pars WHERE `value` = '" . $arProp["name_source"] . "'");

        if ($query->num_rows() == 0) {
            $data = array(
                "value" => $arProp["name_source"],
                "tr_name" => rus2translit($arProp["name_source"])
            );
            $this->db->insert('source_pars', $data);
            unset($data);
            $query = $this->db->query("SELECT * FROM reviews.source_pars WHERE `value` = '" . $arProp["name_source"] . "'");
        }


        foreach ($query->result() as $row) {
            $id = $row->id;
        }
        $query = $this->db->query("SELECT * FROM reviews.list_parser WHERE `value` = '" . $arProp["name_parser"] . "' AND id_source = '" . $id . "'");

        if ($query->num_rows() == 0) {
            $data = array(
                'id_source' => $id,
                "value" => $arProp["name_parser"]
            );
            $this->db->insert('list_parser', $data);

            $query = $this->db->query("SELECT * FROM reviews.list_parser WHERE `value` = '" . $arProp["name_parser"] . "'");
            foreach ($query->result() as $row) {
                $id_parser = $row->id;
            }

            foreach ($arProp as $key => $item) {
                if ($key == "name_source" || $key == "name_parser" || $key == "property_items" || $key == "property") {
                    continue;
                }
                $data = array(
                    "name_property" => $key,
                    "value" => $item,
                    "id_parser" => $id_parser
                );
                $this->db->insert('prop_parser', $data);
            }
        } else {
            foreach ($query->result() as $row) {
                $id_parser = $row->id;
            }
            $query = $this->db->query("SELECT * FROM reviews.prop_parser WHERE id_parser = '" . $id_parser . "'");
            $update_prop = $query->result_array();
            $count_prop = $query->num_rows();

            if($count_prop != 0) {
                foreach ($update_prop as $row) {
                    $data["value"] = $arProp[$row["name_property"]];
                    $this->db->where('id', $row["id"]);
                    $update = $this->db->update('prop_parser', $data);
                    unset($data, $arProp[$row["name_property"]]);
                }
            }

            foreach ($arProp as $key => $item) {
                if ($key == "name_source" || $key == "name_parser" || $key == "property") {
                    continue;
                }
                if (!empty($item)){
                    $data = array(
                        "name_property" => $key,
                        "value" => $item,
                        "id_parser" => $id_parser
                    );
                    $this->db->insert('prop_parser', $data);
                }
            }
        }
        unset($data);

        if (empty($update)) {
            $data = array(
                "value" => $arProp["name_source"],
                "tr_name" => rus2translit($arProp["name_source"])
            );
            $this->db->where('id', $id_parser);
            $this->db->update('source_pars', $data);
        }


        $query = $this->db->query("SELECT * FROM reviews.property_items WHERE `id_parser` = '" . $id_parser . "'");
        if ($query->num_rows() == 0) {
            foreach ($arProp["property"] as $key =>$property){
                $data = array(
                    "name"=>$property["name_property"],
                    "value"=>$property["value_property"],
                    "id_parser" => $id_parser

                );
                $this->db->insert('property_items', $data);
                unset($data, $arProp["property"][$key]);
            }
            /*$data["id_parser"] = $id_parser;
            $this->db->insert('property_items', $data);*/
            unset($data);
        } else {
            foreach ($query->result_array() as $cell => $row){
                foreach ($arProp["property"] as $key =>$property){
                    if($row["name"] == $property["name_property"]){
                        $data = array("name" => $property["name_property"],
                            "value"=>$property["value_property"]);
                        $this->db->where('id', $row["id"]);
                        $this->db->update('property_items', $data);
                        unset($data, $arProp["property"][$key]);
                    }

                }
            }
        }

        if(!empty($arProp["property"])){
            foreach ($arProp["property"] as $key =>$property){
                $data = array(
                    "name"=>$property["name_property"],
                    "value"=>$property["value_property"],
                    "id_parser" => $id_parser
                );
                $this->db->insert('property_items', $data);
            }
        }
        return $id_parser;
    }

    public function select_pars($id)
    {
        $this->id = $id;
        $query = $this->db->query("SELECT * FROM reviews.prop_parser WHERE id_parser = '$this->id'");
        $query1 = $this->db->query("SELECT * FROM reviews.list_parser WHERE id = '$this->id'");
        foreach ($query1->result() as $row) {
            $id_source = $row->id_source;
        }
        $query2 = $this->db->query("SELECT * FROM reviews.source_pars WHERE reviews.source_pars.id = '$id_source'");
        $arResult = array_merge(array("prop" => $query->result_array()), array("name_parser" => $query1->result_array()), array("name_source" => $query2->result_array()));
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

    public function get_list_property($item)
    {
        $this->db->where('class_property', $item);
        $query = $this->db->get('default_property');
        return $query->result_array();
    }

    public function get_default_property()
    {
        $query = $this->db->get('default_property');
        return $query->result_array();
    }
    public function get_property_source($item){
        $this->db->where('tr_name', $item);
        $query = $this->db->get('source_pars');
        $row_source = $query->row_array();
        $query->free_result();
        $query = $this->db->query("SELECT * FROM list_parser WHERE list_parser.id_source = ".$row_source["id"]." ORDER BY list_parser.id DESC LIMIT 1");
        $row_parser = $query->result_array();
        $query->free_result();
        $this->db->where('id_parser', $row_parser[0]["id"]);
        $query = $this->db->get('prop_parser');
        $arResult = array_merge(array("prop" => $query->result_array()), array("name_parser" => $row_parser), array("name_source" => $row_source));
        return $arResult;
    }
    public function get_prop_parser($id){
        $this->db->where('id_parser', $id);
        $query1 = $this->db->get('prop_parser');
        $this->db->where('id_parser', $id);
        $prop = $query1->result_array();
        $query2 = $this->db->get('property_items');
        $property["property"] = $query2->result_array();
        $prop[] = $property;
        return $prop;
    }
}
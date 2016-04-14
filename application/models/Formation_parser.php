<?php
/**
 * Created by PhpStorm.
 * User: ciel
 * Date: 14.04.16
 * Time: 23:42
 */
class Formation_parser extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function formation_form($item, $values){
        $query = self::get_list_property($item);
        $line = "";
        foreach ($query as $row) {
            if ($row->type_ptoperty == "text") {
                $line = "<input type='text' class='".$row->class_property."' value='".$values."'>";
            }
        }
        return $line;
    }

    public function get_list_property($item){
        $this->db->where('class_property', $item);
        $query = $this->db->get('default_property');
        return $query->result();
    }
}
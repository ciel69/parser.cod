<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Core_admin extends CI_Model
{

    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
        $this->load->library(array('generator_color'));
        $this->config->item('base_url');
        $this->load->helper(array('file', 'url', 'translit'));
    }

    public function get_property_source($property, $id){
        if (empty($property)){
            $property = "value";
        }
        $this->db->where('id', $id);
        $query = $this->db->get('list_parser');
        foreach ($query->result_array() as $item){
            $data = $item["id_source"];
        }
        if (!empty($data)) {
            $this->db->where('id', $data);
            $query = $this->db->get('source_pars');
            foreach ($query->result_array() as $item) {
                $data = $item[$property];
            }
        }
        return $data;
    }
}
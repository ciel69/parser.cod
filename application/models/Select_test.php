<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Select_test extends CI_Model {

    public $name;
    public $surname;
    public $date;

    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
    }

    public function get_last_ten_entries()
    {   $this->load->database('default', TRUE);
        $query = $this->db->get('users', 10);
        return $query->result();
    }

    public function insert_entry()
    {
        $this->name    = $_POST['name']; // please read the below note
        $this->surname  = $_POST['surname'];
        $this->date     = time();

        $this->db->insert('table_test', $this);
    }

    public function update_entry()
    {
        $this->name    = $_POST['name'];
        $this->surname  = $_POST['surname'];
        $this->date     = time();

        $this->db->update('table_test', $this, array('id' => $_POST['id']));
    }
}
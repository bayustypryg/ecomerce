<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Snap_model extends MY_Model {
    
    public function getdata()
    {
        $detail_pesanan = $this->db->query("SELECT * FROM tbl_barang");
        return $detail_pesanan;
    }
}
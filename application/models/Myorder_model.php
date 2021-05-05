<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Myorder_model extends MY_Model {

    public $table    = 'orders';

    public function getDefaultValues()
    {
        return [
            'id_order'          => '',
            'account_name'      => '',
            'account_number'    => '',
            'nominal'           => '',
            'note'             => '',
            'image'             => ''
        ];
    }

    public function getValidationRules()
    {
        $validationRules = [
            [
                'field' => 'account_name',
                'label' => 'Nama Pemilik',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'account_number',
                'label' => 'Nomor Rekening',
                'rules' => 'trim|required|max_length[50]'
            ],
            [
                'field' => 'nominal',
                'label' => 'Nominal Transfer',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'image',
                'label' => 'Bukti Transfer',
                'rules' => 'callback_image_required'
            ]
        ];

        return $validationRules;
    }
    
    public function uploadImage($fieldName, $fileName)
    {
        $config = [
            'upload_path'       => './images/confirm',
            'file_name'         => $fileName,
            'allowed_types'     => 'jpg|png|gif|jpeg|JPG|PNG',
            'max_size'          => 1024,
            'max_width'         => 0,
            'max_height'        => 0,
            'overwrite'         => true,
            'file_ext_to_lower' => true
        ];

        $this->load->library('upload', $config);

        if ($this->upload->do_upload($fieldName)) {
            return $this->upload->data();
        } else {
            $this->session->set_flashdata('image_error', $this->upload->display_errors('',''));
            return false;
        }
    }
}

/* End of file Myorder_model.php */

?>
<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\KategoriListModel;

class Kategori extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $user = new UserModel();
        $data['nama'] = $user->orderBy('username', 'ASC')->findAll();
        return $this->respond($data);//
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        //
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    
}
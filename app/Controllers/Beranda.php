<?php

namespace App\Controllers;

use App\Models\ContentModel;
use CodeIgniter\RESTful\ResourceController;
use App\Models\UserModel;

class Beranda extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $model = new ContentModel();
        $filter = $this->request->getVar('filter');
        $search = $this->request->getVar('search');
        $sort = $this->request->getVar('sort');

        if($filter && $search && $sort) {
            $content = $model->where('kategori',$filter)->like('judul',$search,'both')->orderBy($sort,'DESC')->findAll();
        } elseif($filter && $search) {
            $content = $model->where('kategori',$filter)->like('judul',$search,'both')->findAll();
        } elseif($filter && $sort) {
            $content = $model->where('kategori',$filter)->orderBy($sort,'DESC')->findAll();
        } elseif ($search && $sort) {
            $content = $model->like('judul',$search,'both')->orderBy($sort,'DESC')->findAll();
        } elseif($filter) {
            $content = $model->where('kategori',$filter)->findAll();
        } elseif ($search) {
            $content = $model->like('judul',$search,'both')->findAll();
        } elseif ($sort) {
            $content = $model->orderBy($sort,'DESC')->findAll();
        } else {
            $content = $model->findAll();
        }
        return $this->respond($content);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        
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
        //
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        //
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        //
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        //
    }
}

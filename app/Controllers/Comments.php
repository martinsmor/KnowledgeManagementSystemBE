<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\CommentModel;
use PhpParser\Comment;

class Comments extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        //
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $model = new CommentModel();
        $data = $model->orderBy('tanggal', 'ASC')->where('contentId', $id)->findAll();
        return $this->respond($data);
        
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
    public function create($id=null)
    {
        $model = new CommentModel();
        $data = [
            'contentId' => $id,
            'username'  => $this->request->getVar('username'),
            'isi_comment' => $this->request->getVar('comment'),
            'tanggal'  => date('Y/m/d')
        ];
        $model->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Komentar berhasil ditambahkan.'
            ]
        ];
        return $this->respondCreated($response);
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

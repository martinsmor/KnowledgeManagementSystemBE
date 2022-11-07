<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\ContentModel;
use App\Models\KategoriModel;
use App\Models\UserModel;
use App\Models\TagsModel;
use CodeIgniter\HTTP\Response;

class MyContent extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $model = new ContentModel();
        $content = $model->where("username",$this->request->getVar('username'))->findAll();
        return $this->respond($content);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($username = null)
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
        $token = $this->request->getVar('token');
        
        $content = new ContentModel();
        $data = [
            'username' => $this->request->getVar('username'),
            'tanggal'  => date('Y/m/d'),
            'judul'  => $this->request->getVar('judul'),
            'isi_konten'  => $this->request->getVar('isi_konten'),
            'liked'  => 0,
            'type'  => $this->request->getVar('type'),
            'status'  => "Menunggu"
        ];
        $content->insert($data);
        
        $contentId = $content->getInsertID();

        $kategori = new KategoriModel();
        $data_kat = [
            'contentId' => $contentId,
            'kategori' => $this->request->getVar('kategori')
        ];
        $kategori->insert($data_kat);
        
        $tags = new TagsModel();
        $data_tags = [
            'contentId' => $contentId,
            'tag' => $this->request->getVar('tag')
        ];
        $tags->insert($data_tags);

        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Konten berhasil ditambahkan.'
            ]
        ];

        return $this->respondCreated();
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

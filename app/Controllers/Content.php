<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\ContentModel;

class Content extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($username = null)
    {
        $model = new ContentModel();
        $content = $model->where("username",$username)->findAll();
        return $this->respond($content);
    }

    public function view($id = null)
    {
        $model = new ContentModel();
        $content = $model->where("contentId",$id)->first();
        return $this->respond($content);
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
        // change thumbnail from base64 to image
        $thumbnail = $this->request->getVar('thumbnail');
        $thumbnail = str_replace('data:image/png;base64,', '', $thumbnail);
        $thumbnail = str_replace(' ', '+', $thumbnail);
        $thumbnail = base64_decode($thumbnail);
        $thumbnailName = uniqid().'.png';
        $thumbnailPath = WRITEPATH.'uploads/'.$thumbnailName;
        file_put_contents($thumbnailPath, $thumbnail);


        
        $content = new ContentModel();
        $data = [
            'username' => $this->request->getVar('username'),
            'contentId' => uniqid(),
            'tanggal'  => date('Y/m/d'),
            'judul'  => $this->request->getVar('judul'),
            'isi_konten'  => $this->request->getVar('isi_konten'),
            'thumbnail' => $thumbnailName,
            'liked'  => 0,
            'kategori' => $this->request->getVar('kategori'),
            'tags' => $this->request->getVar('tags'),
            'status'  => "Pending"
        ];
        $content->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'user' => $data["username"],
                'contentId' => $content->getInsertID(),
                'success' => 'Konten berhasil ditambahkan.'
            ]
        ];

        return $this->respondCreated($response);
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($contentId = null)
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
        $model = new ContentModel();
        $json = $this->request->getJSON();
        if ($json) {
            $data = [
                'judul' => $json->judul,
                'isi_konten' => $json->isi_konten,
                'thumbnail' => $json->thumbnail,
                'tanggal' => date('Y/m/d'),
                'status' => 'Pending',
                'kategori' => $json->kategori,
                'tags' => $json->tags
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'judul' => $input['judul'],
                'isi_konten' => $input['isi_konten'],
                'thumbnail' => $input['thumbnail'],
                'tanggal' => date('Y/m/d'),
                'status' => "Pending",
                'kategori' => $input['kategori'],
                'tags' => $input['tags']
            ];
        }
        // Insert to Database
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'success' => 'Konten Berhasil Diubah',
                'id' => $id,
                'data' => $data
            ]
        ];
        return $this->respond($response);
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($contentId = null)
    {
        $model = new ContentModel();
        $data = $model->where('contentId', $contentId)->first();
        if ($data) {
            $model->delete($contentId);
            $response = [
                'status'   => 200,
                'messages' => [
                    'contentId' => $contentId,
                    'success' => 'Konten berhasil dihapus.'
                ]
            ];
            return $this->respondDeleted($response);
        } else {
            return $this->failNotFound('Konten tidak ditemukan.');
        }
    }
}

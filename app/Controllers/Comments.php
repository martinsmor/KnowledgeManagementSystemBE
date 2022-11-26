<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\CommentModel;
use App\Models\ContentModel;
use App\Models\UserModel;
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

        $um = new UserModel();

        for ($i=0; $i < sizeof($data) ; $i++) { 
            $user = $um->where('username',$data[$i]['username'])->first();
            $data[$i]['nama'] = $user['nama'];
            $data[$i]['profile_photo'] = $user['profile_photo'];
        }

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

        //jumlah komentar di konten ++
        $contentModel = new ContentModel();
        $content = $contentModel->where('contentId',$id)->first();
        $json = $this->request->getJSON();
        if ($json) {
            $temp = [
                'commented'  => $content['commented']+1
            ];
        } else {
            $temp = [
                'commented'  => $content['commented']+1
            ];
        }
        // Insert to Database
        $contentModel->update($id, $temp);

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
        $model = new CommentModel();
        $find = $model->where('id',$id)->first();
        if ($find) {
            $model->delete($find['id']);
            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => 'Komentar berhasil dihapus',
                    'id' => $find['id'],
                    'contentId' => $find['contentId'],
                    'username' => $find['username']
                ]
            ];
            return $this->respondDeleted($response);
        } else {
            return $this->failNotFound('Data tidak ditemukan.');
        }
    }
}

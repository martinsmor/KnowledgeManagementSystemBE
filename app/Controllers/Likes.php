<?php

namespace App\Controllers;

use App\Models\ContentModel;
use App\Models\LikeModel;
use App\Models\NotificationModel;
use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;

class Likes extends ResourceController
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
        $username = $this->request->getVar('username');
        $model = new LikeModel();
        $like = $model->where('id',$id.$username)->first();
        $response = ($like) ? true : false ;
        return $this->respond($response);
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
    public function create($id = null)
    {
        $model = new LikeModel();
        $username = $this->request->getVar('username');
        $data = [
            'id' => $id.$username,
            'contentId' => $id,
            'username'  => $username
        ];
        $model->insert($data);
        
        // update jumlah like di konten
        $contentModel = new ContentModel();
        $content = $contentModel->where('contentId',$id)->first();
        $json = $this->request->getJSON();
        if ($json) {
            $temp = [
                'liked'  => $content['liked']+1
            ];
        } else {
            $temp = [
                'liked'  => $content['liked']+1
            ];
        }
        // Insert to Database
        $contentModel->update($id, $temp);

        // buat notif
        $nm = new NotificationModel();
        $um = new UserModel();

        $liker = $um->where('username',$data['username'])->first();
        $cc = $um->where('username',$content['username'])->first();

        $notif = [
            'username' => $cc['username'],
            'text' => 'Konten Anda disukai oleh '. $liker['nama'],
            'status' => 'unread',
            'created_at' => date('Y/m/d'),
            'contentId' => $id
        ];
        $nm->insert($notif);
        
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => $data['username'] . ' berhasil melakukan like pada konten : '.$data['contentId']
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
        $username = $this->request->getVar('username');
        $model = new LikeModel();
        $data = $model->where('contentId', $id)->where('username',$username)->first();
        if ($data) {
            $model->delete($id.$username);

             // update jumlah like di konten
            $contentModel = new ContentModel();
            $content = $contentModel->where('contentId',$id)->first();
            $json = $this->request->getJSON();
            if ($json) {
                $temp = [
                    'liked'  => $content['liked']-1
                ];
            } else {
                $temp = [
                    'liked'  => $content['liked']-1
                ];
            }
            // Insert to Database
            $contentModel->update($id, $temp);

            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => 'Unlike berhasil',
                    'contentId' => $id,
                    'username' => $username
                ]
            ];
            return $this->respondDeleted($response);
        } else {
            return $this->failNotFound('Not Found');
        }
    }
}

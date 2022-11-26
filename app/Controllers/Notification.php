<?php

namespace App\Controllers;

use App\Models\NotificationModel;
use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;

class Notification extends ResourceController
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
    public function show($username = null)
    {
        $nm = new NotificationModel();
        $n = $nm->where('username',$username)->findAll();
        return $this->respond($n);
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
        $model = new NotificationModel();
        $notif = [
            'username' => $this->request->getVar('username'),
            'text' => $this->request->getVar('text'),
            'status' => 'unread',
            'created_at' => date('Y/m/d'),
            'updated_at' => date('Y/m/d')
        ];
        $model->insert($notif);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'success' => true,
                'username' => $notif['username'],
                'date' => $notif['created_at'],
                'notif_id' => $model->getInsertID()
            ]
            
        ];
        return $this->respond($response);
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

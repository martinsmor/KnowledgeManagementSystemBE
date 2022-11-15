<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\UserModel;
use App\Models\RoleModel;

class User extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $user = new UserModel();
        $data = $user->select(['username','nama','role','unit_kerja'])->orderBy('username', 'ASC')->find();
        
        return $this->respond($data);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($username = null)
    {
        $user = new UserModel();
        $data = $user->where('username',$username)->first();
        return $this->respond($data);
    }

    public function getRole()
    {
        $model = new RoleModel();
        $role = $model->findAll();
        return $this->respond($role);
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
    public function update($username=null)
    {
        $model = new UserModel();
        $json = $this->request->getJSON();
        if ($json) {
            $data = [
                'role' => $json->role
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'role' => $input['role']
            ];
        }
        // Insert to Database
        $role = $model->where('username',$username)->first();
        $model->update($username, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'username' => $username,
                'from' => $role['role'],
                'to' => $data['role'],
                'success' => 'Role Berhasil Diubah.'
            ]
        ];
        return $this->respond($response);
    }
    
}
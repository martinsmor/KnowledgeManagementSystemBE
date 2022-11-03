<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\UserModel;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class Decode extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    use ResponseTrait;
    public function index()
    {
        $key = getenv("TOKEN_SECRET");
        $header =$this->request->getServer('HTTP_AUTHORIZATION');
        if(!$header) return $this->failUnauthorized("Silakan memasukkan token terlebih dahulu");
        $token = explode(' ',$header)[1];

        try {
            $decoded = JWT::decode($token, new Key($key,'HS256'));
            $response = [
                'username' => $decoded->username,
                'nama' => $decoded->nama,
                'role' => $decoded->role,
                'unit_kerja' => $decoded->unit_kerja
            ];
            return $this->respond($response);
        } catch(\Throwable $th) {
            return $this->fail('Token Anda salah!');
        }
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

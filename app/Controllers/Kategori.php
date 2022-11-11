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
        $model = new KategoriListModel();
        $data['nama_kategori'] = $model->orderBy('kategoriId', 'ASC')->findAll();
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
        $token = $this->request->getVar('token');
        $kategorilist = new KategorilistModel();
        $data = [
            'nama_kategori' => $this->request->getVar('nama_kategori')
            'kategoriId'=> $this->request->getVar('kategoriId')
        ];
        $kategorilist->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Kategori berhasil ditambahkan.'
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
        $kategorilist = new KategoriListModel();
        $json = $this->request->getJSON();
        if ($json) {
            $data = [
                'kategoriId' => $json->kategoriId,
                'nama_kategori'  => $json->nama_kategori
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'kategoriId' => $input['kategoriId'],
                'nama_kategori'  => $input['nama_kategori']
            ];
        }
        // Insert to Database
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'success' => 'Kategori Berhasil Diubah.'
            ]
        ];
        return $this->respond($response);//
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $kategorilist = new KategoriListModel();
        $data = $kategorilist->where('kategoriId', $id)->first();
        if ($data) {
            $kategorilist->delete($id);
            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => ' Kategori : ' . $data['nama_kategori'] . ' berhasil dihapus'
                ]
            ];
            return $this->respondDeleted($response);
        } else {
            return $this->failNotFound('Data tidak ditemukan.');
        } //
    }
}
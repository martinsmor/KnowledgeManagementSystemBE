<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\KategorilistModel;


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
        $kategori = $model->orderBy('kategoriId','ASC')->findAll();
        return $this->respond($kategori);
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
        $kategori = new KategoriListModel();
        $data = [
            'nama_kategori' => $this->request->getVar('name'),
        ];
        $kategori->insert($data);
        $id = $kategori->getInsertID();
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'name' => $data['nama_kategori'],
                'id' => $id,
                'success' => 'Kategori berhasil ditambahkan.'
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
        $model = new KategoriListModel();
        $json = $this->request->getJSON();
        if ($json) {
            $data = [
                'nama_kategori'  => $json->name
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'nama_kategori'  => $input['name']
            ];
        }
        // Insert to Database
        $name = $model->where('kategoriId',$id)->first();
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'from' => $name['nama_kategori'],
                'to' => $data['nama_kategori'],
                'success' => 'Kategori Berhasil Diubah.'
            ]
        ];
        return $this->respond($response);
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $model = new KategoriListModel();
        $data = $model->where('kategoriId', $id)->first();
        if ($data) {
            $model->delete($id);
            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => ' Kategori : ' . $data['nama_kategori'] . ' berhasil dihapus',
                    'id' => $id
                ]
            ];
            return $this->respondDeleted($response);
        } else {
            return $this->failNotFound('Data tidak ditemukan.');
        }
    }
}
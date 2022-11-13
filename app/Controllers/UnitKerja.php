<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\UnitKerjaModel;

class UnitKerja extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $model = new UnitKerjaModel();
        $data = $model->orderBy('id', 'ASC')->findAll();
        return $this->respond($data);
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
        $model = new UnitKerjaModel();
        $data = [
            'unit_kerja_kode' => $this->request->getVar('unit_kerja_kode'),
            'unit_kerja'  => $this->request->getVar('unit_kerja')
        ];
        $model->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Unit kerja berhasil ditambahkan.'
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
        
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $model = new UnitKerjaModel();
        $json = $this->request->getJSON();
        if ($json) {
            $data = [
                'unit_kerja_kode' => $json->unit_kerja_kode,
                'unit_kerja'  => $json->unit_kerja
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'unit_kerja_kode' => $input['unit_kerja_kode'],
                'unit_kerja'  => $input['unit_kerja']
            ];
        }
        // Insert to Database
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'success' => 'Unit Kerja Berhasil Diubah.'
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
        $model = new UnitKerjaModel();
        $data = $model->where('id', $id)->first();
        if ($data) {
            $model->delete($id);
            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => ' Unit Kerja : ' . $data['unit_kerja'] . ' berhasil dihapus'
                ]
            ];
            return $this->respondDeleted($response);
        } else {
            return $this->failNotFound('Data tidak ditemukan.');
        }
    }
}

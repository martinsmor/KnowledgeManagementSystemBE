<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\ContentModel;
use App\Models\FeedBackModel;
use App\Models\UserModel;

class Approval extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $username = $this->request->getVar('username');
        $search = $this->request->getVar('search');
        $model = new UserModel();
        $approval = $model->where('username',$username)->first();
$page = $this->request->getVar('page') ? $this->request->getVar('page') : 1;
        $row = $this->request->getVar('limit') ? $this->request->getVar('limit') : 10;
        $sort = $this->request->getVar('sort');

        if($approval['role'] != 'Approval') return $this->respond("This user isn't Approval");

        $user = $model->where('unit_kerja',$approval['unit_kerja'])->findAll();

        $contentModel = new ContentModel();

        if ($sort == 'Terbaru') {
           $content = $contentModel->where('status','Pending')->orderBy('tanggal', 'DESC')->like('judul', $search)->paginate($row, 'default', $page);
        } elseif ($sort == 'Judul') {
            $content = $contentModel->where('status','Pending')->orderBy('judul', 'ASC')->like('judul', $search)->paginate($row, 'default', $page);
        }
        
        // $content = $contentModel->where('status','Pending')->like('judul',$search)->paginate($row, 'default', $page);
        $total = $contentModel->where('status','Pending')->like('judul',$search)->countAllResults();

        $match = [];
        $k = 0;
        for ($i=0 ; $i < sizeof($content) ; $i++ ) {
             for ($j=0; $j < sizeof($user); $j++) { 
                if($content[$i]['username'] === $user[$j]['username']) {
                    $match[$k] = $content[$i];
                    $k++;
                    break;
                }
             }
        }
        $data = [
            'content' => $match,
            'total' => $total
        ];
        return $this->respond($data);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($username = null)
    {
        
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
        $contentmodel = new ContentModel();
        $content = $contentmodel->where('contentId',$id)->first();
        if(!$content) return $this->failNotFound('Konten tidak ditemukan.');

        
        $model = new FeedbackModel();
        $data = [
            'contentId' => $id,
            'feedback'  => $this->request->getVar('feedback'),
            'from' => $this->request->getVar('from'),
            'id' => $id.$this->request->getVar('from')
        ];
        $model->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Feedback berhasil ditambahkan.',
                'from' => $data['from'],
                'to' => $data['contentId']
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
                'status' => $json->status
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'status' => $input['status']
            ];
        }
        // Insert to Database
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'contentId' => $id,
                'success' => 'Status Berhasil Diubah menjadi ' . $data['status']
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
        //
    }
}

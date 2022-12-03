<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\ContentModel;
use App\Models\FeedBackModel;
use App\Models\NotificationModel;
use App\Models\UserModel;

date_default_timezone_set("Asia/Jakarta");

class Content extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $pager = \Config\Services::pager();
        $model = new ContentModel();
        return $this->respond($model->findAll());
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($username = null)
    {
        $filter = $this->request->getVar('filter');
        $sort = $this->request->getVar('sort');
        $page = $this->request->getVar('page') ? $this->request->getVar('page') : 1;
        $row = $this->request->getVar('limit') ? $this->request->getVar('limit') : 10;
        $search = $this->request->getVar('search');
        $sort = $this->request->getVar('sort');
        $username = $this->request->getVar('username');
        $model = new ContentModel();
        // order by config
        if ($filter == 'All'){
if ($sort == 'Terbaru') {
            $content = $model->like('judul', $search)->where('username', $username)->orderBy("tanggal", 'DESC')->paginate($row, 'content', $page);
            $total = $model->like('judul', $search)->where('username', $username)->countAllResults();
        } else if ($sort == 'Judul') {
            $content = $model->like('judul', $search)->where('username', $username)->orderBy("judul", 'ASC')->paginate($row, 'content', $page);
            $total = $model->like('judul', $search)->where('username', $username)->countAllResults();
        } else {
            $content = $model->like('judul', $search)->where('username', $username)->orderBy("tanggal", 'DESC')->paginate($row, 'content', $page);
            $total = $model->like('judul', $search)->where('username', $username)->countAllResults();
        }
        } else {
            if ($sort == 'Terbaru') {
            $content = $model->like('judul', $search)->where('username', $username)->where('status',$filter)->orderBy("tanggal", 'DESC')->paginate($row, 'content', $page);
            $total = $model->like('judul', $search)->where('username', $username)->where('status',$filter)->countAllResults();
            } else if ($sort == 'Judul') {
                $content = $model->like('judul', $search)->where('username', $username)->where('status',$filter)->orderBy("judul", 'ASC')->paginate($row, 'content', $page);
                $total = $model->like('judul', $search)->where('username', $username)->where('status',$filter)->countAllResults();
            } else {
                $content = $model->like('judul', $search)->where('username', $username)->where('status',$filter)->orderBy("tanggal", 'DESC')->paginate($row, 'content', $page);
                $total = $model->like('judul', $search)->where('username', $username)->where('status',$filter)->countAllResults();
            }
        }

        $fm = new FeedBackModel();
        for ($i=0; $i < sizeof($content); $i++) { 
            $feedback = $fm->where('contentId',$content[$i]['contentId'])->first();
            if($feedback) {
                $content[$i]['feedback'] = $feedback['feedback'];
                $content[$i]['feedback_from'] = $feedback['from'];
            } else {
                $content[$i]['feedback'] = null;
                $content[$i]['feedback_from'] = null;
            }
        }

        $data = [
            'content' => $content,
            'total' => $total,
            'pager' => $model->pager
        ];
        return $this->respond($data);
    }

    public function view($id = null)
    {
        $model = new ContentModel();
        $content = $model->where("contentId",$id)->first();

        $usermodel = new UserModel();
        $user = $usermodel->where('username',$content['username'])->first();
        $content['nama'] = $user['nama'];
        $content['profile_photo'] = $user['profile_photo'];

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
        $file = $this->request->getFile('cover');
        if ($file == null) {
            $fileName = "default.png";
        } else {
            
            $file->move(ROOTPATH.'/public/assets/', $file->getRandomName());
        $fileName = $file->getName();   
        }
        $judul = $this->request->getVar('judul');
        // // change space to dash
        $judul = str_replace(' ', '-', $judul);
        $judul = strtolower($judul);
        $judul = preg_replace('/[^A-Za-z0-9\-]/', '', $judul);
        $judul = preg_replace('/-+/', '-', $judul);
        $judul = preg_replace('/-+$/', '', $judul);
        $judul = preg_replace('/^-+/', '', $judul);
        $judul = $judul.'-'.uniqid();


        $content = new ContentModel();
        $data = [
            'username' => $this->request->getVar('username'),
            'contentId' => $judul,
            'tanggal'  => date('Y/m/d H:i:s'),
            'judul'  => $this->request->getVar('judul'),
            'isi_konten'  => $this->request->getVar('isi_konten'),
            'thumbnail' => $fileName,
            'liked'  => 0,
            'kategori' => $this->request->getVar('kategori'),
            'tags' => $this->request->getVar('tags'),
            'status'  => "Menunggu"
        ];

        $content->insert($data);
        $c = $content->where('contentId',$data['contentId'])->first();

        //kirim notif
        $nm = new NotificationModel();
        $um = new UserModel();
        $cc = $um->where('username',$c['username'])->first(); //ambil data content creator
        $ua = $um->where('unit_kerja',$cc['unit_kerja'])->where('role','Approval')->findAll(); //cari semua approval di unit kerja bersangkutan

        for ($i=0; $i < sizeof($ua); $i++) { 
            $notif = [
                'username' => $ua[$i]['username'],
                'text' => $cc['nama']. ' telah membuat pengajuan konten',
                'status' => 'unread',
                'created_at' => date('Y/m/d H:i:s'),
                'contentId' => $c['contentId']
            ];
            $nm->insert($notif);
        }

        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'user' => $data["username"],
                'contentId' => $data['contentId'],
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
        $editThumbnail = $this->request->getVar('editThumbnail');
        if ($editThumbnail == true) {
            
    
            $thumbnail = $this->request->getVar('thumbnail');
        if ($thumbnail == '') {
            $thumbnailName = 'default.png';

            
        } else {
            $ext = explode('/', explode(':', substr($thumbnail, 0, strpos($thumbnail, ';')))[1])[1];
            if ($ext == 'png') {
                $thumbnail = str_replace('data:image/png;base64,', '', $thumbnail);
                } elseif ($ext == 'jpg') {
                $thumbnail = str_replace('data:image/jpeg;base64,', '', $thumbnail);
                } elseif ($ext == 'gif') {
                $thumbnail = str_replace('data:image/gif;base64,', '', $thumbnail);
                } elseif ($ext == 'svg') {
                } else if ($ext == 'jpeg') {
                $thumbnail = str_replace('data:image/jpeg;base64,', '', $thumbnail);
                } else {
                }
        $thumbnail = str_replace(' ', '+', $thumbnail);
        $thumbnail = base64_decode($thumbnail);
            $thumbnailName = uniqid().'.png';
            $thumbnailPath = ROOTPATH.'/public/assets/'.$thumbnailName;
            file_put_contents($thumbnailPath, $thumbnail);
        }
        } else {
            $content = new ContentModel();
            $c = $content->where('contentId',$id)->first();
            $thumbnailName = $c['thumbnail'];
        }
        $model = new ContentModel();
        $json = $this->request->getJSON();
        if ($json) {
            $data = [
                'judul' => $json->judul,
                'isi_konten' => $json->isi_konten,
                'thumbnail' => $thumbnailName,
                'tanggal' => date('Y/m/d H:i:s'),
                'status' => 'Menunggu',
                'kategori' => $json->kategori,
                'tags' => $json->tags
            ];
        } else {
            $input = $this->request->getRawInput();
            $data = [
                'judul' => $input['judul'],
                'isi_konten' => $input['isi_konten'],
                'thumbnail' => $input['thumbnail'],
                'tanggal' => date('Y/m/d H:i:s'),
                'status' => "Menunggu",
                'kategori' => $input['kategori'],
                'tags' => $input['tags']
            ];
        }

        // Insert to Database
        $model->update($id, $data);
        $c = $model->where('contentId',$id)->first();

        // Hapus Feedback
        $fm = new FeedBackModel();
        if($fm->where('contentId',$id)->first()) {
            $fm->where('contentId',$id)->delete();
        }
        // Kirim Notif
        $nm = new NotificationModel();
        $um = new UserModel();
        $cc = $um->where('username',$c['username'])->first(); //ambil data content creator
        $ua = $um->where('unit_kerja',$cc['unit_kerja'])->where('role','Approval')->findAll(); //cari semua approval di unit kerja bersangkutan

        for ($i=0; $i < sizeof($ua); $i++) { 
            $notif = [
                'username' => $ua[$i]['username'],
                'text' => $cc['nama']. ' telah mengajukan konten (edit)',
                'status' => 'unread',
                'created_at' => date('Y/m/d H:i:s'),
                'contentId' => $id
            ];
            $nm->insert($notif);
        }

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
            // delete thumbnail
            if ($data['thumbnail'] != 'default.png') {
                unlink(ROOTPATH.'/public/assets/'.$data['thumbnail']);
            }
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

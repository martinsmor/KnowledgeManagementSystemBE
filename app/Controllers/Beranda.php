<?php

namespace App\Controllers;

use App\Models\ContentModel;
use CodeIgniter\RESTful\ResourceController;
use App\Models\UserModel;

class Beranda extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $model = new ContentModel();
        $filter = $this->request->getVar('filter');
        $search = $this->request->getVar('search');
        $sort = $this->request->getVar('sort');
        $page = $this->request->getVar('page');
        $limit = $this->request->getVar('limit');
        $query = '(judul LIKE "%' . $search . '%" OR tags LIKE "%' . $search . '%")';

        if ($filter && $sort && $search) {
            $content = $model->where('kategori', $filter)->where($query)->orderBy($sort, 'DESC')->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->where('kategori', $filter)->where($query)->orderBy($sort, 'DESC')->where('status', 'Diterima')->countAllResults();
        } elseif ($filter && $search) {
            $content = $model->where('kategori', $filter)->where($query)->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->where('kategori', $filter)->where($query)->where('status', 'Diterima')->countAllResults();
        } elseif ($filter && $sort) {
            $content = $model->where('kategori', $filter)->where($query)->orderBy($sort, 'DESC')->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->where('kategori', $filter)->where($query)->orderBy($sort, 'DESC')->where('status', 'Diterima')->countAllResults();
        } elseif ($sort) {
            $content = $model->orderBy($sort, 'DESC')->where($query)->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->orderBy($sort, 'DESC')->where($query)->where('status', 'Diterima')->countAllResults();
        } elseif ($filter) {
            $content = $model->where('kategori', $filter)->where($query)->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->where('kategori', $filter)->where($query)->where('status', 'Diterima')->countAllResults();
        } elseif ($search) {
            $content = $model->where($query)->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->where($query)->where('status', 'Diterima')->countAllResults();
        } else {
            $content = $model->where($query)->where('status', 'Diterima')->paginate($limit, 'page', $page);
            $total = $model->where($query)->where('status', 'Diterima')->countAllResults();
        }

        $usermodel = new UserModel();
        for ($i = 0; $i < sizeof($content); $i++) {
            $user = $usermodel->where('username', $content[$i]['username'])->first();
            $content[$i]['nama'] = $user['nama'];
            $content[$i]['user_photo'] = $user['profile_photo'];
        }
        // data isi_konten max 300 karakter
        for ($i = 0; $i < sizeof($content); $i++) {

            // remove html tag, remove image tag
            $content[$i]['isi_konten'] = preg_replace('/<img[^>]+\>/i', '', $content[$i]['isi_konten']);
            $content[$i]['isi_konten'] = strip_tags($content[$i]['isi_konten']);
            $content[$i]['isi_konten'] = str_replace('&nbsp;', ' ', $content[$i]['isi_konten']);
            $content[$i]['isi_konten'] = substr($content[$i]['isi_konten'], 0, 350);
            if (strlen($content[$i]['isi_konten']) > 300) {
                $content[$i]['isi_konten'] = $content[$i]['isi_konten'] . '...';
            }
            // remove href
            $content[$i]['isi_konten'] = preg_replace('/<a[^>]+\>/i', ' ', $content[$i]['isi_konten']);
            $content[$i]['isi_konten'] = str_replace('</a>', ' ', $content[$i]['isi_konten']);
        }

        $data = [
            'status' => 200,
            'error' => null,
            'total' => $total,
            'data' => $content,
        ];
        return $this->respond($data);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
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

<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;


class ImageUploader extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $file = $this->request->getFile('image');
        $file->move(ROOTPATH.'/public/content/', $file->getRandomName());
        $fileName = $file->getName();    
        $data = [
            'thumbnail' => $file->getName()
        ];
        return $this->respond($data);
    }
    
    
    //         $ext = explode('/', explode(':', substr($thumbnail, 0, strpos($thumbnail, ';')))[1])[1];
    //         if ($ext == 'png') {
    //     $thumbnail = str_replace('data:image/png;base64,', '', $thumbnail);
    //     } elseif ($ext == 'jpg') {
    //     $thumbnail = str_replace('data:image/jpeg;base64,', '', $thumbnail);
    //     } elseif ($ext == 'gif') {
    //     $thumbnail = str_replace('data:image/gif;base64,', '', $thumbnail);
    //     } elseif ($ext == 'svg') {
    //     } else if ($ext == 'jpeg') {
    //     $thumbnail = str_replace('data:image/jpeg;base64,', '', $thumbnail);
    //     } else {
    //     }
    //     $thumbnail = str_replace(' ', '+', $thumbnail);
    //     $thumbnail = base64_decode($thumbnail);
        
    //     if ($thumbnail == '') {
    //         $thumbnailName = 'default.png';
    //     } else {
    //         $thumbnailName = uniqid(). '.' . $ext;
    //         $thumbnailPath = ROOTPATH.'/public/assets/'.$thumbnailName;
    //         file_put_contents($thumbnailPath, $thumbnail);
    //     }
    //     return $this->respond($thumbnailName);
    // }

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
       
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {

    }
}
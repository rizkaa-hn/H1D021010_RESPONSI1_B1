<?php

namespace App\Controllers;

use App\Models\MTugas;

class TugasController extends RestfulController
{
    public function create()
    {
        $data = [
            'title' => $this->request->getVar('title'),
            'description' => $this->request->getVar('description'),
            'deadline' => $this->request->getVar('deadline')
        ];
        $model = new MTugas();
        $model->insert($data);
        $tugas = $model->find($model->getInsertID());
        return $this->responseHasil(200, true, $tugas);
    }
    public function list()
    {
        $model = new MTugas();
        $tugas = $model->findAll();
        return $this->responseHasil(200, true, $tugas);
    }
    public function detail($id)
    {
        $model = new MTugas();
        $tugas = $model->find($id);
        return $this->responseHasil(200, true, $tugas);
    }
    public function ubah($id)
    {
        $data = [
            'title' => $this->request->getVar('title'),
            'description' => $this->request->getVar('description'),
            'deadline' => $this->request->getVar('deadline')
        ];
        $model = new MTugas();
        $model->update($id, $data);
        $tugas = $model->find($id);
        return $this->responseHasil(200, true, $tugas);
    }
    public function hapus($id)
    {
        $model = new MTugas();
        $tugas = $model->delete($id);
        return $this->responseHasil(200, true, $tugas);
    }
}

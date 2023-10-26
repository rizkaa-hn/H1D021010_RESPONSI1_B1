<?php

namespace App\Models;

use CodeIgniter\Model;

class MTugas extends Model
{
    protected $table = 'tugas';
    protected $primaryKey = 'id';
    protected $allowedFields = ['title', 'description', 'deadline'];
}

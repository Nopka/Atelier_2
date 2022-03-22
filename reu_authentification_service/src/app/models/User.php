<?php
namespace reu\authentification\app\models;
use \Illuminate\Database\Eloquent\Model as EloquentModel;

class User extends EloquentModel {
    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $timeStamps = false;
}
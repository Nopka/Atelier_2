<?php
namespace reu\authentification\app\models;
use \Illuminate\Database\Eloquent\Model as EloquentModel;

class Participant extends EloquentModel {
    protected $table = 'Participant';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $keyType='string'; 
    protected $timeStamps = false;
}
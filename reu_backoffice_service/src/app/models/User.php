<?php

namespace reu\backoffice\app\models;

class User extends \Illuminate\Database\Eloquent\Model {

    protected $table      = 'users';
    protected $primaryKey = 'id';
    public  $incrementing = false;
    public $keyType='string';           


} 
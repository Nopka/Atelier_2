<?php

namespace reu\backoffice\app\models;

class Event extends \Illuminate\Database\Eloquent\Model {

    protected $table      = 'events';
    protected $primaryKey = 'id';
    public  $incrementing = false;
    public $keyType='string';           


} 
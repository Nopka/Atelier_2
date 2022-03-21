<?php

namespace reu\events\app\models;

class Event extends \Illuminate\Database\Eloquent\Model {

    protected $table      = 'events';  /* le nom de la table */
    protected $primaryKey = 'id';
    public  $incrementing = false;      //Pour la clé primaire (id) on annule l'auto incrémentation
    public $keyType='string';           

    public function items() {
        return $this->hasMany('\reu\event\app\models\Item', 'idEvent');
    }


} 
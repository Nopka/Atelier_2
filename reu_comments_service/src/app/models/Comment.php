<?php
namespace reu\comments\app\models;

class Comment extends \Illuminate\Database\Eloquent\Model {

    protected $table      = 'comments';  /* le nom de la table */
    protected $primaryKey = 'id';
    public  $incrementing = true;//Pour la clé primaire (id) on annule l'auto incrémentation        
 
    public function items() {
       return $this->hasMany('\reu\comments\app\models\Comment', 'id');
    }
 
 
} 
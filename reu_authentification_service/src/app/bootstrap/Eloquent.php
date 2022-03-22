<?php
namespace reu\authentification\app\bootstrap;
use Illuminate\Database\Capsule\Manager as EloquentManager;

class Eloquent {
    public static function start($file_config) {
        //Configuration de la base pour Eloquent
        $config = parse_ini_file($file_config);

        $eloquent = new EloquentManager();
        $eloquent->addConnection($config);
        $eloquent->setAsGlobal();
        $eloquent->bootEloquent();
    } 
}
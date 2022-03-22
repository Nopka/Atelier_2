<?php
namespace reu\comments\app\Middleware;
use  \Respect\Validation\Validator as V;

class Middleware{

    public function putIntoJson($rq, $rs, callable $next){
        $rs = $rs->withHeader("Content-Type", "application/json;charset=utf-8");
        return $next($rq,$rs);
    }
    
    public static function create_validators(){
        //*tableau de validateurs
        return [
            'id' => V::stringType(),
            'idEvent' => V::stringType(),
            'idUser' => V::stringType(),
            'content' => V::stringType(),
            'created_at' => V::date("Y-m-j"),
            'updated_at' => V::date("Y-m-j")
        ];

    }

}
<?php
namespace reu\authentification\app\middlewares;
use \Respect\Validation\Validator as V;

class Middleware{

    public function putIntoJson($rq, $rs, callable $next){
        $rs = $rs->withHeader("Content-Type", "application/json;charset=utf-8");
        return $next($rq,$rs);
    }
    
    public static function user_validators(){
        //*tableau de validateurs
        return [
            //'id' => V::stringType(),
            'Uname' => V::stringType(),
            'mail' => V::email(),
            'pwd' => V::stringType(),
            'desc' => V::stringType(),
        ];
    }
}
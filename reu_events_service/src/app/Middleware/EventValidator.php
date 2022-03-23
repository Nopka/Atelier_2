<?php
namespace reu\events\app\middleware;
use  \Respect\Validation\Validator as V;

class EventValidator{

    public static function events_validators(){
        return [
            'titre' => v::stringType()->notEmpty(),
            'description' => v::stringType()->notEmpty(),
            'dateEvent' => [
                'date'=> V::date('d-m-Y')->min('now'),
                'heure' => V::date('H:i')
            ],
            'lieu' => v::stringType()->notEmpty(),
            'idCreateur' => v::noWhitespace()->length(1, 36)
        ];
    }

    public static function comments_validators(){
        return [
            'event' => V::stringType(),
            'user' => V::stringType(),
            'content' => V::stringType(),
        ];
    }
}             

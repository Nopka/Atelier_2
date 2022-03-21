<?php

namespace reu\backoffice\app\controller;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\backoffice\app\models\Event;
use reu\backoffice\app\errors\Writer;
use DateTime;
use Ramsey\Uuid\Uuid;



class EventController
{
    private $c;

    public function __construct(\Slim\Container $c)
    {
        $this->c = $c;
    }

   
}

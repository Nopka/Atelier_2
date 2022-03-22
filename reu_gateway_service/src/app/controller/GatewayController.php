<?php
namespace reu\gateway\app\controller;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\gateway\app\models\Comment;
use reu\gateway\app\output\Writer;

class GatewayController{
   private $c;

   public function __construct(\Slim\Container $c){
     $this->c = $c;
   }

   
   
}
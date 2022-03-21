<?php
namespace reu\comments\app\controller;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\comments\app\models\Comment;
use reu\comments\app\output\Writer;

class CommentController{
     private $c;

     public function __construct(\Slim\Container $c){
        $this->c = $c;
     }
     public function getAllComments(Request $req, Response $resp): Response
     {

     }
}
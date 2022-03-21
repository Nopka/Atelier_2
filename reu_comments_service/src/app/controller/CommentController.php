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

   public function getCommentsFromEvent(Request $req, Response $resp, array $args): Response
   {
      $id_event = $args['idEvent']; //On récupère l'id de l'evenement depuis l'url

      try {
         $comments = Comment::select(['id','idEvent','idUser','content','created_at','updated_at'])
            ->where('idEvent','=', $id_event)
            ->get(); //On fais une requête SQL avec l'id de l'evenement

         $data_response = [
            "type" => "comments",
            "data" => $comments
         ]; //On formate les données

         $resp->getBody()->write(json_encode($data_response));
         return writer::json_output($resp, 200);

      } catch (ModelNotFoundException $e) {

         $clientError = $this->c->clientError;
         return $clientError($req, $resp, 404, "No comments found");

      }
   }
}
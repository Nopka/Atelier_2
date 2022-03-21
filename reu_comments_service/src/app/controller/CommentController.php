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
     public function getAllComments(Request $req, Response $resp, array $arg): Response
     {
         return $resp;
     }
     public function create(Request $req, Response $resp, array $arg) : Response 
     {
         if ($req->getAttribute('has_errors')) {
            $errors = $req->getAttribute('errors');
            $rs = $resp->withStatus(400);

            $body = json_encode([
               "type" => "error",
               "error" => "400",
               "message" => $errors
            ]);

            $rs = $rs->withHeader('Content-Type', 'application/json;charset=utf-8');
            $rs->getBody()->write($body);
            return $rs;
         } else {
            try {
               $args = $req->getParsedBody();
               $idEvent = htmlspecialchars($args["event"], ENT_QUOTES);
               $idUser = htmlspecialchars($args["user"], ENT_QUOTES);
               $content = htmlspecialchars($args["content"], ENT_QUOTES);

               $currentDateTime = date('Y-m-d H:i');

               $id = random_bytes(36);
               $id = bin2hex($id);

               $command = new Comment();
               $command->id = $id;
               $command->idEvent = $idEvent;
               $command->idUser = $idUser;
               $command->content = $content;
               $command->created_at = $currentDateTime;
               $command->updated_at = $currentDateTime;
               $command->save();

               $body = json_encode([
                  "comment" => [
                     "id" => $id,
                     "event" => $idEvent,
                     "user" => $idUser,
                     "id" => $id,
                     "created" => $currentDateTime,
                     "updated" => $currentDateTime
                  ]
               ]);
               $rs = $resp->withStatus(201);
            }
            catch(ModelNotFoundException $e) {
               $rs = $rs->withStatus(404);
               $body = json_encode([
                  "type" => "error",
                  "error" => "404",
                  "message" => "Une erreur est survenu lors de la création du commentaire, réessayer ultérieurement !"
               ]);
            }
            $rs = $rs->withHeader('Content-Type', 'application/json;charset=utf-8');
            //$rs = $rs->withHeader('Location', $this->container->router->pathFor('getCommand', [ 'id' => $command->id ]));
            $rs->getBody()->write($body);
         } 
      return $resp;
     }
}
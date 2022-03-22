<?php

namespace reu\backoffice\app\controller;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\backoffice\app\models\Event;
use reu\backoffice\app\models\User;
use reu\backoffice\app\errors\Writer;
use DateTime;
use Ramsey\Uuid\Uuid;



class backofficeController
{
    private $c;

    public function __construct(\Slim\Container $c)
    {
        $this->c = $c;
    }

    public function deleteEvent(Request $req, Response $resp, array $args): Response {
        //pour supprimer un event, on récupère son token passé par un header ou en paramètre à la variable token.
        $received_id = $args['id'];

        $event = Event::find($received_id);

        $date_now= new  DateTime();
        $date_6months = date('Y-m-d H:i:s', strtotime("+6 months", strtotime( $event['dateEvent'])));
        $date_convert = new DateTime($date_6months);
      

        $diff = date_diff($date_now, $date_convert)->format('%R');
        if($diff == '-'){
            $event->delete();
            $res = "event deleted";
        }else            
            $res = "can't delete event, not expired yet";
        

        //$res = $diff != '-'  ? $event->delete() : "can't delete, not expired yet";

        $response =  [
            'status' => $res,
            'event'  => $event
        ];

        $resp->getBody()->write(json_encode($response));
        return writer::json_output($resp, 200);
    }

    public function deleteUser(Request $req, Response $resp, array $args): Response{
        $client = new \GuzzleHttp\Client();

        //$headers = ['Authorization' => explode(" ", $rq->getHeader('Authorization')[0])[1]];
        $response = $client->request('GET', 'http://api.authentification.local:19090/users/');

        //$users = User::all();

        foreach($users as $user){
            $response = $client->request('DELETE', 'http://api.authentification.local:19090/deleteUser/'.$user->id);
            var_dump($response->getStatusCode(), $response->getBody());
        }
        
    }
     
   
}

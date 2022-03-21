<?php

namespace reu\backoffice\app\controller;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\backoffice\app\models\Event;
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

        // $date_now= new  DateTime();
        // $date_now =  $date_now->format('Y-m-d H:i:s');
        // $effectiveDate = date('Y-m-d', strtotime("+6 months", strtotime( $event['dateEvent'])));
        // $effectiveDate = new DateTime( $effectiveDate);
        // $intervall = date_diff($event['dateEvent'], $effectiveDate );
        // $intervall =  $intervall->format('Y-m-d H:i:s');
        


        // $event->delete();

        // $response=  [
        //     'status' =>  "event supprimé : ",
        //     'event' => $event
        // ];

        // $response2 = [
        //     "dateNow" => $date_now,
        //     "dateevent" =>  $event['dateEvent'],
        // ];

        // //$res = $intervall >  ? true : false;

        // $resp->getBody()->write(json_encode($intervall));
        return writer::json_output($resp, 200);
    }

    public function deleteUser(){

    }
   
}

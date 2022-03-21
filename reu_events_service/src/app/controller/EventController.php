<?php

namespace reu\events\app\controller;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\events\app\models\Event;
use reu\events\app\models\Item;
use reu\events\app\errors\Writer;
use DateTime;
use Ramsey\Uuid\Uuid;



class EventController
{
    private $c;

    public function __construct(\Slim\Container $c)
    {
        $this->c = $c;
    }

    //Insert un event
    public function insertEvent(Request $req, Response $resp, array $args): Response
    {
        $received_event= $req->getParsedBody();

        if ($req->getAttribute('has_errors')) {

            $errors = $req->getAttribute('errors');

            if (isset($errors['nom_client'])) {
                ($this->c->get('logger.error'))->error("error",$errors['nom_client']);
                return Writer::json_error($resp, 403, "Le champ 'nom_client' ne doit pas être vide et doit contenir que des lettres");
            }
            if (isset($errors['mail_client'])) {
                ($this->c->get('logger.error'))->error("error",$errors['mail_client']);
                return Writer::json_error($resp, 403, "Le champ 'mail_client' ne doit pas être vide et doit être valide");
            }
            if (isset($errors['livraison.date'])) {    //une vérification à faire sur l'heure ? 
                ($this->c->get('logger.error'))->error("error",$errors['livraison.date']);
                return Writer::json_error($resp, 403, "La date de livraison ne doit pas être inférieur à la date d'aujourd'hui et doit être le format d-m-Y");
            }
            if (isset($errors['items'])) {
                ($this->c->get('logger.error'))->error("error",$errors['items']);
                return Writer::json_error($resp, 403, "le champ items ne doit pas être vide et toutes les informations doivent être valide");
            }
        } 

    }

    // //Get tous les events
    public function getAllEvents(Request $req, Response $resp): Response
    {
        $events = Event::select(['id', 'titre', 'description', 'dateEvent', 'lieu','created_at'])->get();

        $event_response = [];
        $event = [];
        foreach ($events as $ev) {
            $eventPath = $this->c->router->pathFor(
                'getEvent',
                ['id' => $ev->id]
            );
            $event["event"] = $ev;
            $event["links"] =  $eventPath;
            array_push($event_response, $event);
        }


        //Construction des donnés à retourner dans le corps de la réponse
        $data_resp = [
            "type" => "collection",
            "count" => count($events),
            "events" => $event_response
        ];

        $resp->getBody()->write(json_encode($data_resp));
        return writer::json_output($resp, 200);

      
    }

    //Get one event
    public function getEvent(Request $req, Response $resp, array $args): Response
    {
        $id_event = $args['id'];

        try {
            $event = Event::select(['id', 'titre', 'description', 'dateEvent', 'lieu','created_at'])
                ->where('id', '=', $id_event)
                ->firstOrFail();


            $commandePath = $this->c->router->pathFor(
                'getEvent',
                ['id' => $id_event]
            );

            // Création des liens hateos
            $hateoas = [
                "self" => ["href" => $commandePath]
            ];

            // Création du body de la réponse
            $datas_resp = [
                "type" => "event",
                "event" => $event,
                "links" => $hateoas,
            ];

            $resp->getBody()->write(json_encode($datas_resp));
            return writer::json_output($resp, 200);

        } catch (ModelNotFoundException $e) {
            $clientError = $this->c->clientError;
            return $clientError($req, $resp, 404, "Event not found");
        }

    }

}




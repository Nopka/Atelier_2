<?php

namespace reu\events\app\controller;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\events\app\models\Commande;
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
    // public function getAllEvents(Request $req, Response $resp): Response
    // {
    // }

    //Get un event
    public function getEvent(Request $req, Response $resp, array $args): Response
    {
        $resp->getBody()->write(json_encode("get event"));
        return writer::json_output($resp, 200);
    }

    // //Modifier un event
    // public function putEvent(Request $req, Response $resp, array $args): Response
    // {
    // }
}




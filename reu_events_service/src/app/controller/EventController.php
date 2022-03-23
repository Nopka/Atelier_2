<?php

namespace reu\events\app\controller;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\events\app\models\Event;
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

    public function insertEvent(Request $req, Response $resp, array $args): Response
    {
        $received_event = $req->getParsedBody();

        if ($req->getAttribute('has_errors')) {

            $errors = $req->getAttribute('errors');

            if (isset($errors['titre'])) {
                ($this->c->get('logger.error'))->error("error: invalid input", $errors['titre']);
                return Writer::json_error($resp, 403, "Le champ 'titre' ne doit pas être vide");
            }
            if (isset($errors['description'])) {
                ($this->c->get('logger.error'))->error("error: invalid input", $errors['description']);
                return Writer::json_error($resp, 403, "Le champ 'description' ne doit pas être vide et doit être valide");
            }
            if (isset($errors['dateEvent.date'])) {
                ($this->c->get('logger.error'))->error("error: invalid input", $errors['dateEvent.date']);
                return Writer::json_error($resp, 403, "La date de réunion ne doit pas être inférieur à la date d'aujourd'hui et doit être le format d-m-Y");
            }
            if (isset($errors['dateEvent.heure'])) {
                $this->container->get('logger.error')->error("error: invalid input", $errors['dateEvent.heure']);
                return Writer::json_error($resp, 403, '"heure" : invalid input. H:i format expected');
            }
            if (isset($errors['lieu'])) {
                ($this->c->get('logger.error'))->error("error: invalid input", $errors['lieu']);
                return Writer::json_error($resp, 403, "Le champ lieu ne doit pas être vide");
            }
            if (isset($errors['idCreateur'])) {
                ($this->c->get('logger.error'))->error("error", $errors['idCreateur']);
                return Writer::json_error($resp, 403, "invalid idCreateur");
            }
        };

        try {
            //Création du token unique et cryptographique
            $token_event = random_bytes(32);
            $token_event = bin2hex($token_event);

            //créer le event et son id
            $new_event = new Event();
            $new_event_id = Uuid::uuid4();
            $new_event->id =  $new_event_id;

            //Filtrage et affectation des données.
            $new_event->titre = filter_var($received_event['titre'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $new_event->description = filter_var($received_event['description'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $temp_event_date = new  DateTime($received_event['dateEvent']['date'] . ' ' . $received_event['dateEvent']['heure']);
            $new_event->dateEvent =  $temp_event_date->format('Y-m-d H:i:s');
            $new_event->lieu = filter_var($received_event['lieu'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $new_event->idCreateur = filter_var($received_event['idCreateur'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $new_event->token = $token_event;
            $new_event->save();


            // Récupération du path pour le location dans header
            $path_event = $this->c->router->pathFor(
                'getEvent',
                ['id' => $new_event->id]
            );

            $response = [
                "type" => "event",
                "event" => $new_event,
            ];

            $resp->getBody()->write(json_encode($response));
            return Writer::json_output($resp, 201)->withHeader("location", $path_event)->withHeader('X-reu-token', $new_event->token);;
        } catch (ModelNotFoundException $e) {
            return Writer::json_error($resp, 404, 'Ressource not found ' . $new_event->id);
        } catch (\Exception $e) {
            return Writer::json_error($resp, 500, 'Server Error : Can\'t create event' . $e->getMessage());
        }
    }


    public function getAllEvents(Request $req, Response $resp): Response
    {
        $events = Event::select(['id', 'titre', 'description', 'idCreateur', 'dateEvent', 'lieu', 'created_at'])->get();

        $event_response = [];
        $event = [];
        foreach ($events as $ev) {
            $eventPath = $this->c->router->pathFor(
                'getEvent',
                ['id' => $ev->id]
            );
            $event["event"] = $ev;
            $event["links"] =  $eventPath; //!bonne idée de mettre ça ? 
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



    public function getEvent(Request $req, Response $resp, array $args): Response
    {
        $id_event = $args['id'];
        try {

            $event = Event::select(['id', 'titre', 'description', 'idCreateur', 'dateEvent', 'lieu', 'created_at'])
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
            return $clientError($req, $resp, 404, "Event not found" . $e->getMessage());
        }
    }


    public function putEvent(Request $req, Response $resp, array $args): Response
    {

        $received_event = $req->getParsedBody();

        if (!isset($received_event['titre'])) {
            return Writer::json_error($resp, 400, "missing 'titre'");
            $this->c->get('logger.error')->error("error : missing input 'titre'");
        };

        if (!isset($received_event['description'])) {
            return Writer::json_error($resp, 400, "missing 'description'");
            $this->c->get('logger.error')->error("error : missing input 'description'");
        };

        if (!isset($received_event['dateEvent']['date'])) {
            return Writer::json_error($resp, 400, "missing 'dateEvent(date)'");
            $this->c->get('logger.error')->error("error : missing input dateEvent(date)");
        };

        if (!isset($received_event['dateEvent']['heure'])) {
            return Writer::json_error($resp, 400, "missing 'dateEvent(heure)'");
            $this->c->get('logger.error')->error("error : missing input dateEvent(heure)");
        };

        if (!isset($received_event['lieu'])) {
            return Writer::json_error($resp, 400, "missing 'lieu'");
            $this->c->get('logger.error')->error("error : missing input 'lieu'");
        };

        if (!isset($received_event['idCreateur'])) {
            return Writer::json_error($resp, 400, "missing 'idCreateur'");
            $this->c->get('logger.error')->error("error : missing input 'idCreateur'");
        };
        try {

            $event = Event::Select(['id', 'titre', 'description', 'dateEvent', 'lieu', 'idCreateur'])->findOrFail($args['id']);

            //Filtrer les données reçues
            $event->titre = filter_var($received_event['titre'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $event->description = filter_var($received_event['description'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $temp_event_date = new  DateTime($received_event['dateEvent']['date'] . ' ' . $received_event['dateEvent']['heure']);
            $event->dateEvent =  $temp_event_date->format('Y-m-d H:i:s');
            $event->lieu = filter_var($received_event['lieu'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $event->idCreateur = filter_var($received_event['idCreateur'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $event->save();

            $resp->getBody()->write(json_encode($event));

            return Writer::json_output($resp, 200);
        } catch (ModelNotFoundException $e) {
            return Writer::json_error($resp, 404, "event inconnue : {$args}");
            $this->c->get('logger.error')->error("error : 'event inconnue : {$args}'");
        } catch (\Exception $e) {
            return Writer::json_error($resp, 500, $e->getMessage());
            $this->c->get('logger.error')->error("error :" . $e->getMessage());
        }
        return $resp;
    }

    public function deleteEvents(Request $req, Response $resp, array $args): Response {

        $listIdEvents = Event::select(['id'])->get();

        $body = [
            'lenght' => 0,
            'events' => []
        ];
        //pour chaque event on verifie s'il est expirer ou pas par son id
        foreach($listIdEvents as $idEvent) {
            $event = Event::find($idEvent->id);

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
           array_push($body['events'], $response);
        }

        $resp->getBody()->write(json_encode($body));
        return writer::json_output($resp, 200);
    }
}

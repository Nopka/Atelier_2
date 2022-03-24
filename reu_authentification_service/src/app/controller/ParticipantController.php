<?php
namespace reu\authentification\app\controller;

use DateTime;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Slim\Container;
use reu\authentification\app\models\Participant;
use reu\authentification\app\utils\Writer;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

/**
 * Class REUAuthController
 * @package lbs\command\api\controller
 */
class ParticipantController //extends Controller
{
    private $container;

    public function __construct(Container $container)
    {
        $this->container = $container;
    }


    //tous les participants de l'event
    public function getParticipants(Request $req, Response $resp, array $args) : Response {
        try{
            $participants = Participant::select(['id', 'idEvents','response'])
                            ->where('response', '=', 1)
                            ->get();

            $data_resp = [
                "type" => "collection",
                "count" => count($participants),
                "participants" => $participants
            ];
            $resp->getBody()->write(json_encode($data_resp));
            return writer::json_output($resp, 200);


        } catch (ModelNotFoundException $e) {
            $clientError = $this->c->clientError;
            return $clientError($req, $resp, 404, "Event not found" . $e->getMessage());
        }

       
    }
    public function getAllParticipants(Request $req, Response $resp, array $args) : Response {
        try{
            $participants = Participant::select(['id', 'idEvents','response'])
                            ->get();

            $data_resp = [
                "type" => "collection",
                "count" => count($participants),
                "participants" => $participants
            ];
            $resp->getBody()->write(json_encode($data_resp));
            return writer::json_output($resp, 200);


        } catch (ModelNotFoundException $e) {
            $clientError = $this->c->clientError;
            return $clientError($req, $resp, 404, "Event not found" . $e->getMessage());
        }

    }

   
}
<?php

namespace reu\backoffice\app\middleware;

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use \Slim\Container;
use reu\backoffice\app\errors\Writer;
use reu\backoffice\app\models\Event;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Token
{

    private $c;

    public function __construct(Container $c)
    {
        $this->c = $c;
    }

    public function check(Request $rq, Response $rs, callable $next)
    {

        //check si le token se trouve dans l'uri
        $token = null;
        $token = $rq->getQueryParams()['token'];

        if (is_null($token)) {
            //check si le token se trouve dans un header applicatif
            $api_header = $rq->getHeader('X-reu-token');
            $token = (isset($api_header[0]) ? $api_header[0] : null);
        }

        //Si le token se trouve dans aucun des deux then missing token
        if (empty($token)) {
            ($this->c->get('logger.error')->error("Missing token in event route"));
            return Writer::json_error($rs, 403, "missing token");
        }

        //Get l'id de l'event se trouvant dans la route
        $event_id = $rq->getAttribute('route')->getArgument('id');
        $event = null;
        try {
            $event = Event::where('id', '=', $event_id)->firstOrFail();
            if ($event->token !== $token) {
                ($this->c->get('logger.error'))->error("Invalid token in event route($token)", [$event->token]);
                return Writer::json_error($rs, 403, "Token invalid");
            }
        } catch (ModelNotFoundException $e) {
            ($this->c->get('logger.error'))->error("unkown event");
            return Writer::json_error($rs, 404, "unkown event");
        }

        $rq = $rq->withAttribute('event', $event);
        return $next($rq, $rs);
    }
}

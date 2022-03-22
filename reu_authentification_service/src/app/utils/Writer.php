<?php 
namespace reu\authentification\app\utils;

use \Psr\Http\Message\ResponseInterface as Response;

class Writer {

    public function __construct()
    {
        
    }

    public static function json_error(Response $rs, $status, $message) : Response {
        $rs = $rs->withStatus($status);
        $error = json_encode([
            "type" => "error",
            "error" => $status,
            "message" => $message
        ]);
        $rs = $rs->withHeader('Content-Type', 'application/json;charset=utf-8');
        $rs->getBody()->write($error);
        return $rs;
    }

    public static function json_output(Response $rs, int $status, array $data = []) : Response {
        $data_json = json_encode($data);
        
        $rs = $rs->withStatus($status);
        $rs = $rs->withHeader('Content-Type', 'application/json;charset=utf-8');

        $rs->getBody()->write($data_json);

        return $rs;
    }
}
<?php
return [
    'phpErrorHandler' => function( $c ) {
        return function( $req, $resp, $error) {
            $resp= $resp->withStatus( 500 )
                        ->withHeader('Content-Type', 'application/json;charset=utf-8');
            $resp->getBody()->write(json_encode([
                "type" => "error",
                "error" => "500",
                "message" => "Le serveur a rencontré un problème inattendu"
            ]));
            //$error->getMessage()
            return $resp ;
        };
    },
    'notFoundHandler' => function( $c ) {
        return function( $req, $resp) {
            $resp= $resp->withStatus( 400 )
                        ->withHeader('Content-Type', 'application/json;charset=utf-8');
            $resp->getBody()->write(json_encode([
                "type" => "error",
                "error" => "400",
                "message" => "URI mal formulé"
            ]));
            return $resp;
        };
    },
    'notAllowedHandler' => function( $c ) {
        return function( $req, $resp , $methods ) {
            $resp= $resp->withStatus( 405 )
                        ->withHeader('Content-Type', 'application/json;charset=utf-8');
            $array = [
                "type" => "error",
                "error" => "405",
                "message" => 'méthode "'.$_SERVER['REQUEST_METHOD'].'" non autorisé, les méthodes a utilisé sont : '.implode(",", $methods),
                "methods" => []
            ];
            
            foreach($methods as $key => $method){
                $array["methods"][$key] = $method;
            }
            
            $resp->getBody()->write(json_encode($array));

            return $resp ;
        };
    }
];
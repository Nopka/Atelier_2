<?php
//Routes de l'API

use \reu\events\app\controller\EventController;
use \reu\events\app\middleware\Middleware;
use \reu\events\app\middleware\Token;
use \DavidePastore\Slim\Validation\Validation as Validation ;


$app->post('/events[/]',EventController::class. ':insertEvent')->setName('insertEvent')->add(middleware::class. ':putIntoJson');



//!combien garder l'evenement actif ? 6mois ? 
//!combien garder l'utilisateur actif ? 1 an ? 


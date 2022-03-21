<?php
//Routes de l'API

use \reu\backoffice\app\controller\BackofficeController;
use \reu\backoffice\app\middleware\Middleware;
use \reu\backoffice\app\middleware\Token;



$app->post('/events[/]',EventController::class. ':insertEvent')->setName('insertEvent')->add(middleware::class. ':putIntoJson');



//!combien garder l'evenement actif ? 6mois ? 
//!combien garder l'utilisateur actif ? 1 an ? 


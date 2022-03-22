<?php
//Routes de l'API

use \reu\backoffice\app\controller\BackofficeController;
use \reu\backoffice\app\middleware\Middleware;
use \reu\backoffice\app\middleware\Token;


$app->delete('/events/{id}[/]',BackofficeController::class. ':deleteEvent')->setName('deleteEvent')->add(middleware::class. ':putIntoJson')->add(Token::class. ':check');

$app->delete('/users[/]',BackofficeController::class. ':deleteUser')->setName('deleteUser');


//!combien garder l'evenement actif ? 6mois  
//!combien garder l'utilisateur actif ? last-connected 


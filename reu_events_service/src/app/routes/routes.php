<?php
//Routes de l'API

use \reu\events\app\controller\EventController;
use \reu\events\app\middleware\Middleware;
use \reu\events\app\middleware\EventValidator;
use \reu\events\app\middleware\Token;
use \DavidePastore\Slim\Validation\Validation as Validation ;

$validators = EventValidator::create_validators();

$app->post('/events[/]',EventController::class. ':insertEvent')->setName('insertEvent')->add(middleware::class. ':putIntoJson')->add(new Validation($validators));

$app->get('/events[/]',EventController::class. ':getAllEvents')->setName('getAllEvents')->add(middleware::class. ':putIntoJson');

$app->get('/events/{id}[/]',EventController::class. ':getEvent')->setName('getEvent')->add(middleware::class. ':putIntoJson')->add(Token::class. ':check');

$app->put('/events/{id}[/]',EventController::class. ':putEvent')->setName('putEvent')->add(middleware::class. ':putIntoJson')->add(new Validation($validators));
//! validateur ne fonctionne pas avec le verbe put ? 

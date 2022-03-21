<?php
//Routes de l'API

use \reu\events\app\controller\EventController;
use \reu\events\app\middleware\Middleware;
use \reu\events\app\middleware\EventValidator;
use \reu\events\app\middleware\Token;
use \DavidePastore\Slim\Validation\Validation as Validation ;

$validators = EventValidator::create_validators();

$app->get('/events[/]',EventController::class. ':getAllEvents')->setName('getAllEvents')->add(middleware::class. ':putIntoJson');

$app->get('/events/{id}[/]',EventController::class. ':getEvent')->setName('getEvent')->add(middleware::class. ':putIntoJson');

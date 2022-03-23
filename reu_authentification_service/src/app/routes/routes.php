<?php

use \reu\authentification\app\controller\REUAuthController;
use \reu\authentification\app\controller\ParticipantController;
use \reu\authentification\app\middlewares\Middleware;
use \DavidePastore\Slim\Validation\Validation as Validation;

$validators = Middleware::user_validators();

$app->post('/auth[/]',REUAuthController::class.':authenticate')
    ->setName('Auth');

$app->post('/createUser[/]',REUAuthController::class.':create')
    ->setName('createUser')
    ->add(middleware::class.':putIntoJson')
    ->add(new Validation($validators));

$app->delete('/users[/]',REUAuthController::class.':delete')
    ->setName('delete')
    ->add(middleware::class.':putIntoJson')
    ->add(new Validation($validators));

/* Routes pour les participants */
$app->get('/participants[/]', ParticipantController::class. ':getParticipants')->setName('getParticipants')->add(middleware::class. ':putIntoJson');
$app->get('/guests[/]', ParticipantController::class. ':getAllParticipants')->setName('getAllParticipants')->add(middleware::class. ':putIntoJson');

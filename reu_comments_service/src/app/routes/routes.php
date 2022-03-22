<?php

use \reu\comments\app\controller\CommentController;
use \reu\comments\app\middleware\Middleware;
use \DavidePastore\Slim\Validation\Validation as Validation ;

$validators = Middleware::create_validators();

$app->get('/comments/{idEvent}[/]',CommentController::class. ':getCommentsFromEvent')
     ->setName('getCommentsFromEvent')
     ->add(middleware::class. ':putIntoJson');
     
$app->post('/createComment[/]',
    CommentController::class.':create'
);

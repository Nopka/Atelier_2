<?php

use \reu\gateway\app\controller\CommentController;
use \reu\gateway\app\middleware\Middleware;
use \DavidePastore\Slim\Validation\Validation as Validation ;

$validators = Middleware::create_validators();

// $app->get('/comments/{idEvent}[/]',CommentController::class. ':getCommentsFromEvent')
//     ->setName('getCommentsFromEvent')
//     ->add(middleware::class. ':putIntoJson')
//     ->add(new Validation($validators));
     


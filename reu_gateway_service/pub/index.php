<?php 
require_once  __DIR__ . '/../src/vendor/autoload.php';
use reu\gateway\app\bootstrap\ReuBootstrap;

$config = require_once __DIR__ . '/../src/app/conf/settings.php';
$dependencies = require_once __DIR__ . '/../src/app/conf/dependencies.php';
$errors = require_once __DIR__ . '/../src/app/conf/errors.php';

$c = new \Slim\Container(array_merge($config,$dependencies,$errors));
$app = new \Slim\App($c);

ReuBootstrap::startEloquent($c->settings['dbfile']);

//Les routes de l'application
require_once __DIR__ . '/../src/app/routes/routes.php';

$app->run();
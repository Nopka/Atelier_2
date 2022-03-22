<?php
require_once  __DIR__ . '/../src/vendor/autoload.php';

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use reu\authentification\app\bootstrap\Eloquent;
use reu\authentification\app\controller\REUAuthController;

$settings = require_once __DIR__ . '/../src/app/settings/settings.php';
$errors = require_once __DIR__ . '/../src/app/errors/errors.php';

$app_config = array_merge($settings, $errors);

$container = new \Slim\Container($app_config);

$app = new \Slim\App($container);

Eloquent::start(($app->getContainer())->settings['dbconf']);

//Les routes de l'application
require_once __DIR__ . '/../src/app/routes/routes.php';

$app->run();
<?php
use Slim\Container;


return [
    'settings' => [
        'displayErrorDetails' => true,

        'dbfile' => __DIR__ . '/comments.db.conf.ini.dist',

        'debug.name' => 'reu.log',
        'debug.log' => __DIR__ . '/../log/debug.log',
        'debug.level' => \Monolog\Logger::DEBUG, 

        'warn.name' => 'reu.log',
        'warn.log' => __DIR__ . '/../log/warn.log',
        'warn.level' => \Monolog\Logger::WARNING,

        'error.name' => 'reu.log',               //Nom du log    
        'error.log' => __DIR__ . '/../log/error.log',  //* Nom du fichier du log    
        'error.level' => \Monolog\Logger::ERROR,  
    ]
];

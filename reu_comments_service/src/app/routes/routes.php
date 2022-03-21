<?php
$app->post('/createComment[/]',
    reu\comments\app\controller\CommentController::class.':create'
);
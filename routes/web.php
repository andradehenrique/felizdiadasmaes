<?php
// Creating routes

// Psr-7 Request and Response interfaces
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;

// HOME ROUTE
// 
$app->get('/', function (Request $request, Response $response, $args)   {

    $vars = [
        'page' => [
        'title' => 'Feliz Dia das Mães',
        'description' => 'Mensagem de Feliz Dias das Mães, com amor Maya e Papai.'
        ],
    ];

    return $this->view->render($response, 'pages/home.twig', $vars);

})->setName('home');
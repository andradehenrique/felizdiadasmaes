<?php
// Require composer autoloader
require __DIR__ . '/../vendor/autoload.php';

// Application settings
$settings = require __DIR__ . '/../config/settings.php';

// New Slim app instance
$app = new Slim\App( $settings );

// Add our dependencies to the container
require __DIR__ . '/../config/dependencies.php';

// Require our route
require __DIR__ . '/../routes/web.php';
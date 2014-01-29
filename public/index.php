<?php

require '../library/vendor/autoload.php';
define("PORTAL_CONFIG_JSON", "../config/portal.json");
define("PORTAL_MODE", "development");
define("PORTAL_DATABASE", "portal");
define("PORTAL_ROOT", "../");

// load portal config file
$portalConfig = new library\Config(PORTAL_CONFIG_JSON);

// slim core url routing init
$app = new Slim\Slim($portalConfig->getSlimSetting(PORTAL_MODE));

// twig template init
$twigLoader = new Twig_Loader_Filesystem(__DIR__ . '/../templates');
$ui = new Twig_Environment($twigLoader, $portalConfig->getTwigSetting(PORTAL_MODE));
$ui->addExtension(new Twig_Extension_Debug());

// orm init
ORM::configure($portalConfig->getDbSetting(PORTAL_DATABASE));
ORM::configure($portalConfig->getIdiormSetting(PORTAL_MODE));

// piray portal
$portal = new routes\Portal($app, $ui);

$app->run();

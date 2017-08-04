<?php

// Classes
require_once __DIR__.'/../app/autoload.php';
use Symfony\Component\HttpFoundation\Request;

// Kernel
require_once __DIR__.'/../app/AppKernel.php';
if(PHP_SYMFONY_ENV === 'dev') {
  ini_set('opcache.enable', 0);
  umask(0002);
}
$oKernel = new AppKernel(PHP_SYMFONY_ENV, (PHP_SYMFONY_DEBUG && PHP_SYMFONY_ENV !== 'prod'));
if(PHP_VERSION_ID < 70000) {
  $oKernel->loadClassCache();
}

// Cache (APCU)
/* DEPRECATED
require_once __DIR__.'/../app/AppCache.php';
$oKernel = new AppCache($oKernel);
Request::enableHttpMethodParameterOverride();
*/

// Request-Response
$oRequest = Request::createFromGlobals();
$oResponse = $oKernel->handle($oRequest);
$oResponse->send();
$oKernel->terminate($oRequest, $oResponse);


<?php

// Classes
require_once __DIR__.'/../app/autoload.php';
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

// Kernel
require_once __DIR__.'/../app/AppKernel.php';
//require_once __DIR__.'/../app/AppCache.php';
if (PHP_SYMFONY_ENV === 'dev' ) {
  ini_set('opcache.enable', 0);
  umask(0002);
}
$oKernel = new AppKernel(PHP_SYMFONY_ENV, (PHP_SYMFONY_DEBUG && PHP_SYMFONY_ENV !== 'prod'));
$oKernel->loadClassCache();
//$oKernel = new AppCache($oKernel);
$oRequest = Request::createFromGlobals();
$oResponse = $oKernel->handle($oRequest);
$oResponse->send();
$oKernel->terminate($oRequest, $oResponse);


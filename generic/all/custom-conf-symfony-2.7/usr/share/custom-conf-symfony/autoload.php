<?php

// Environment variables
if (!defined('PHP_SYMFONY_AUTOLOAD')) {
  if (array_key_exists('PHP_SYMFONY_AUTOLOAD',$_SERVER)) {
    define('PHP_SYMFONY_AUTOLOAD', $_SERVER['PHP_SYMFONY_AUTOLOAD']);
  } elseif(array_key_exists('PHP_SYMFONY_AUTOLOAD', $_ENV)) {
    define('PHP_SYMFONY_AUTOLOAD', $_ENV[ 'PHP_SYMFONY_AUTOLOAD']);
  } else {
    define('PHP_SYMFONY_AUTOLOAD', '/opt/symfony/vendor/autoload.php');
  }
}
if (!defined('PHP_SYMFONY_CONFIG')) {
  if(array_key_exists('PHP_SYMFONY_CONFIG', $_SERVER)) {
    define('PHP_SYMFONY_CONFIG', $_SERVER['PHP_SYMFONY_CONFIG']);
  } elseif(array_key_exists('PHP_SYMFONY_CONFIG', $_ENV)) {
    define('PHP_SYMFONY_CONFIG', $_ENV['PHP_SYMFONY_CONFIG']);
  } else {
    define('PHP_SYMFONY_CONFIG', '/etc/php/symfony');
  }
}
if (!defined('PHP_SYMFONY_ENV')) {
  if(array_key_exists('PHP_SYMFONY_ENV', $_SERVER)) {
    define('PHP_SYMFONY_ENV', $_SERVER['PHP_SYMFONY_ENV']);
  } elseif(array_key_exists('PHP_SYMFONY_ENV', $_ENV)) {
    define('PHP_SYMFONY_ENV', $_ENV['PHP_SYMFONY_ENV']);
  } else {
    define('PHP_SYMFONY_ENV', 'prod');
  }
}
if (!defined('PHP_SYMFONY_DEBUG')) {
  if(array_key_exists('PHP_SYMFONY_DEBUG', $_SERVER)) {
    define('PHP_SYMFONY_DEBUG', (bool)$_SERVER['PHP_SYMFONY_DEBUG']);
  } elseif(array_key_exists('PHP_SYMFONY_DEBUG', $_ENV)) {
    define('PHP_SYMFONY_DEBUG', (bool)$_ENV['PHP_SYMFONY_DEBUG']);
  } else {
    define('PHP_SYMFONY_DEBUG', false);
  }
}
if (!defined('PHP_SYMFONY_APC')) {
  if(array_key_exists('PHP_SYMFONY_APC', $_SERVER)) {
    define('PHP_SYMFONY_APC', (bool)$_SERVER['PHP_SYMFONY_APC']);
  } elseif(array_key_exists('PHP_SYMFONY_APC', $_ENV)) {
    define('PHP_SYMFONY_APC', (bool)$_ENV['PHP_SYMFONY_APC']);
  } else {
    define('PHP_SYMFONY_APC', false);
  }
}

// Framework autoload
$oLoader = require_once PHP_SYMFONY_AUTOLOAD;
\Doctrine\Common\Annotations\AnnotationRegistry::registerLoader(array($oLoader, 'loadClass'));
if (PHP_SYMFONY_APC && PHP_SYMFONY_ENV !== 'dev') {
  $oLoader = new \Symfony\Component\ClassLoader\ApcUniversalClassLoader( 'SymfonyClassLoader', $oLoader );
} else {
  $oLoader = new \Symfony\Component\ClassLoader\UniversalClassLoader( 'SymfonyClassLoader', $oLoader );
}
$oLoader->register( true );
return $oLoader;


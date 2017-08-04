<?php
use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class AppKernel extends Kernel
{
  public function registerBundles() {
    $aBundles = array(
      new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
      new Symfony\Bundle\SecurityBundle\SecurityBundle(),
      new Symfony\Bundle\TwigBundle\TwigBundle(),
      new Symfony\Bundle\MonologBundle\MonologBundle(),
      new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
      new Symfony\Bundle\AsseticBundle\AsseticBundle(),
      new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
    );

    if(in_array($this->getEnvironment(), array('dev', 'test'))) {
      $aBundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
    }

    return $aBundles;
  }

  public function getRootDir() {
    return __DIR__;
  }

  public function getProjectDir() {
    return dirname(__DIR__);
  }

  public function getCacheDir() {
    return dirname(__DIR__).'/var/cache/'.$this->getEnvironment();
  }

  public function getLogDir() {
    return dirname(__DIR__).'/var/logs';
  }

  public function registerContainerConfiguration(LoaderInterface $oLoaderInterface) {
    $oLoaderInterface->load(PHP_SYMFONY_CONFIG.'/config_'.$this->getEnvironment().'.yml');
  }
}


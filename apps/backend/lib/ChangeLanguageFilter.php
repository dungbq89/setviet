<?php
/**
 * Created by JetBrains PhpStorm.
 * User: chuyennv2
 * Date: 10/8/13
 * Time: 2:06 PM
 * To change this template use File | Settings | File Templates.
 */
class ChangeLanguageFilter extends sfFilter
{
  public function execute($filterChain) {
    $sfContext = sfContext::getInstance();

    if($sfContext->getRequest()->hasParameter('lang')){
      $lang = $sfContext->getRequest()->getParameter('lang');
      $sfContext->getUser()->setCulture($lang);
    }
    $filterChain->execute();
  }
}

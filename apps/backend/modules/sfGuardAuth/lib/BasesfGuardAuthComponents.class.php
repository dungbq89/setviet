<?php

class BasesfGuardAuthComponents extends sfComponents
{
  public function executeSignin_form()
  {
    $class = sfConfig::get('app_sf_guard_plugin_signin_form', 'sfGuardFormAdminSignin'); 
    $this->form = new $class();
  }
}
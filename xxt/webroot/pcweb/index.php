<?php
if(!extension_loaded('yaf'))
{
	exit('yaf extension Not exists');
}
###程序根目录
define('__DEFINE_WEBROOT__', dirname(dirname(dirname(__FILE__))));
define('__DEFINE_INI__', str_replace(dirname(dirname(__FILE__)).'/', '', dirname(__FILE__)));
Yaf_Loader::import(__DEFINE_WEBROOT__.'/config/'.__DEFINE_INI__.'/define.php');
$gconf 	= require_once(__DEFINE_CONFIG__.'/gconfig.php');
header('Content-Type:text/html;charset="'.__DEFINE_CHARSET__.'"');
date_default_timezone_set(__DEFINE_TIMEZONE__);
$app	= new Yaf_Application( $gconf['yaf'] );
Yaf_Registry::set('gconfig',$gconf['param']);
$app->bootstrap()->run();
unset($gconf);
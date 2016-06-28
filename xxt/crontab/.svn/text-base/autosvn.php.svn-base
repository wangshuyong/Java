<?php
set_time_limit(0);
function ms(){
		list($s1, $s2) = explode(' ', microtime());
    	return (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
}
if( !isset($argv) || count($argv)<2 ){
	exit;
}
define( '__START__' , ms() );
define( '__SLIMIT__' , (59 *1000) );
define( '__SVN_PATH__' , "/usr/bin/svn up ".$argv[1] );
function svn(){
	echo "===\n";
	echo  __START__." < ".__SLIMIT__."\n";
	if( ms() - __START__ < __SLIMIT__ ){
		if( function_exists('system') ){
			system( __SVN_PATH__ );
			echo __SVN_PATH__."\n";
		}
		sleep(3);
		svn();
	}	
}
svn();


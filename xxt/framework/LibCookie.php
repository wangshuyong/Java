<?php
class LibCookie
{
	static public $config	= array();

	//#获取配置
	static public function getConfig( $key )
	{
		if(empty(self::$config))
		{
			$conf			= Yaf_Registry::get('gconfig');
			self::$config 	= $conf['cookie'];
			unset($conf);
		}
		return isset(self::$config[$key]) ? self::$config[$key] : false;
	}

	//#设置COOKIE
	static public function set( $key, $value )
	{
		$conf 	= self::getConfig( $key );
		if( $conf )
		{
			if($conf['auth'])
			{
				$value 	= is_array( $value ) ? serialize( $value ) : $value;
				if( $conf['auth'] == '3des' )
				{
					$value	= LibAuth::ini( $conf['authKey'] )->encrypt( $value );
				}
				else
				{
					$value	= LibAuth::ini( $conf['authKey'] )->discuz_encode( $value );
				}
			}
			if( $conf['domain'] )
			{
				setcookie( $conf['name'], $value, time()+ $conf['expr'], $conf['path'], $conf['domain'] );
			}
			else
			{
				setcookie( $conf['name'], $value, time()+$conf['expr'], $conf['path'] );
			}
			return true;
		}
		return false;
	}

	//#获取COOKIE
	static public function get( $key )
	{
		$conf 	= self::getConfig( $key );
		if( $conf )
		{
			if( isset($_COOKIE[$conf['name']]) )
			{
				$val	= $_COOKIE[$conf['name']];
				if( $conf['auth'] )
				{
					if( $conf['auth'] == '3des' )
					{
						$val	= LibAuth::ini( $conf['authKey'] )->decrypt( $val );
					}
					else
					{
						$val	= LibAuth::ini( $conf['authKey'] )->discuz_decode( $val );
					}
				}
				return $conf['format'] == 'obj' ? unserialize( $val ) : $val;
			}
		}
		return false;
	}

	//#设置COOKIE
	static public function del( $key )
	{
		$conf 	= self::getConfig( $key );
		if( $conf )
		{
			if( $conf['domain'] )
			{
				setcookie( $conf['name'], '', time()-3600, $conf['path'], $conf['domain'] );
			}
			else
			{
				setcookie( $conf['name'], '', time()-3600, $conf['path'] );
			}
			return true;
		}
		return false;
	}

}
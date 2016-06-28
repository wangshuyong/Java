<?php
class LibBase
{
	static public $header	= array();

	//#callback
	static public function CallBack( $code = 0, $msg = 'ok', $data = array() )
	{
		$json 	= array( 'code'=>$code, 'msg'=>$msg, 'data'=>$data );	
		$json	= PHP_VERSION >= '5.5' ? json_encode($json,JSON_UNESCAPED_UNICODE) : json_encode($json) ;
		exit($json);
	}

	//#Time33
	static public function Time33( $str , $maxLen = 0 )
	{
		$hash 	= 0;
		$s 		= md5($str);
		$seed 	= 5;
		$len 	= 32;
		for($i = 0; $i < $len; $i++)
		{
			$hash = ( $hash << $seed ) + $hash + ord( $s{$i} );
		}
		$table 	= $hash & 0x7FFFFFFF ;
		$maxLen =  $maxLen == 64  ? 63 : $maxLen ;
		if( $maxLen )
		{
			return ($table % $maxLen);
		}
		else
		{
			return $table ;
		}
	}

	//#hash分表
	static public function TableHash( $str, $maxLen = 64 )
	{
		$hashList	= array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
		$_hash		= 0;
		$s			= md5($str);
		$seed		= 5;
		$len		= 32;
		for($i = 0; $i < $len; $i++)
		{
			$_hash += (int)array_search($s{$i},$hashList);
		}
		return ($_hash % $maxLen);
	}

	//#头部信息处理
	static public function HeaderParam()
	{
		if(!empty(self::$header))return self::$header;
		if(isset($_SERVER) && !empty($_SERVER))
		{
			foreach($_SERVER as $k=>$v)
			{
				if( preg_match('/^http/i', $k) )
				{
					$_k					= strtolower( preg_replace('/^HTTP_/i', '', $k ) );
					self::$header[$_k]	= $v ;
				}
			}
		}
		return self::$header;
	}

	static public function UUId( $do = true )
	{
		$uuid = '';
		if (function_exists('com_create_guid'))
		{
			$uuid =  com_create_guid();
		}
		else
		{
			mt_srand((double)microtime()*10000);
			$charid = strtolower(md5(uniqid(rand(), true)));
			$hyphen = chr(45);
			$uuid = chr(123)
					.substr($charid, 0, 8).$hyphen
					.substr($charid, 8, 4).$hyphen
					.substr($charid,12, 4).$hyphen
					.substr($charid,16, 4).$hyphen
					.substr($charid,20,12)
					.chr(125);
	    }
	    if( $do )
	    {
	    	return str_replace( array('{','}','-'), '', $uuid );
	    }
	    return $uuid ;
	}

}
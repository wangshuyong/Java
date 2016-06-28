<?php
class LibCURL
{
	/**
	* @Notci:CURL函数
	* @param:String url接口地址
	* @param:Array 	option 参数
	* @param:string option[get] 	get参数
	* @param:string option[header] 	header信息
	* @param:string option[file] 	文件参数
	* @param:string option[post]	post参数
	* @param:int 	timeout 		超时时间
	* @return array 
	*/
	static public function Send( $url, $option = array(), $timeout = 3  )
	{
		if( isset($option) && !empty($option['get']) )
		{
			$gparam	 = str_replace('&amp;', '&', $option['get']);
			$url		.= preg_match('/\?/', $url) ? rtrim($url,'&').'&'.$gparam : $url.'?'.$gparam;
		}
		$ch	= curl_init();
		curl_setopt( $ch, CURLOPT_URL, $url );
		if( isset($option['header']) && !empty($option['header']))
		{
			$_header 	= array();
			foreach($option['header'] as $_k=>$_v)
			{
				$_header[]	= $_k.':'.$_v;
			}
			curl_setopt( $ch, CURLOPT_HTTPHEADER, $_header);
		}
		if(isset($option['file']) && !empty($option['file']))
		{
			foreach($option['file'] as $k=>$v)
			{
				$option['post'][$k]	= '@'.$v;
			}
		}
		if(isset($option['post']) && !empty($option['post']))
		{
			curl_setopt( $ch, CURLOPT_POST, 1);
			curl_setopt( $ch, CURLOPT_POSTFIELDS, str_replace('&amp;','&',http_build_query($option['post'])));
		}
		curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt( $ch, CURLOPT_HEADER, false);
		curl_setopt( $ch, CURLOPT_TIMEOUT, $timeout);
		$rs		= curl_exec( $ch );
		$errno	= curl_errno( $ch );
		curl_close( $ch );
		return	array('errno'=>$errno,'data'=>$rs);
	}

}
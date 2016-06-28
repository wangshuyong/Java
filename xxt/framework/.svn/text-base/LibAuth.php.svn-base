<?php
/**
*@Notic:加密方法
*/
class LibAuth
{
	public $option				= array();

	static public $config				= array();
	static public $staticOBJ	= array();

	public function __construct( $conf )
	{
		$this->option 	= $conf;
	}

	//#初始化
	static public function ini( $conf = 'default')
	{
		if(isset(self::$staticOBJ[$conf]))return self::$staticOBJ[$conf];
		if(empty(self::$config))
		{
			$c	= Yaf_Registry::get('gconfig');
			self::$config	= $c['auth'];
			unset($c);
		}
		if(!isset(self::$config[$conf]) || empty(self::$config[$conf]))
		{
			LibBase::CallBack(801,'auth config not exists');
		}
		$class					= __CLASS__;
		self::$staticOBJ[$conf]	= new $class( self::$config[$conf] );
		return self::$staticOBJ[$conf];
	}

	//################ 康盛双向加密 ########################
	//解密
	public function discuz_decode( $string  ,$expiry =0)
	{
		return $this->discuz( $string , 'DECODE' , $this->option['key'], $expiry );
	}

	//加密
	public function discuz_encode( $string ,  $expiry = 0 )
	{
		return $this->discuz( $string, 'ENCODE', $this->option['key'], $expiry );
	}

	private function discuz($string, $operation = 'DECODE', $key = '', $expiry = 0)
	{
		$ckey_length = 4;  
		$key		= md5($key ? $key : $this->option['key']); 
		$keya		= md5(substr($key, 0, 16));  
		$keyb		= md5(substr($key, 16, 16));  
		$keyc		= $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';  
		$cryptkey	= $keya.md5($keya.$keyc);  
		$key_length	= strlen($cryptkey);  
		$string		= $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;  
		$string_length = strlen($string);  
		$result		= '';  
		$box		= range(0, 255);  
		$rndkey		= array();  
		for($i = 0; $i <= 255; $i++)
		{  
			$rndkey[$i] = ord($cryptkey[$i % $key_length]);  
		}
		for($j = $i = 0; $i < 256; $i++)
		{  
			$j = ($j + $box[$i] + $rndkey[$i]) % 256;  
			$tmp = $box[$i];  
			$box[$i] = $box[$j];  
			$box[$j] = $tmp;  
	    }  
	    for($a = $j = $i = 0; $i < $string_length; $i++)
	    {  
			$a = ($a + 1) % 256;  
			$j = ($j + $box[$a]) % 256;  
			$tmp = $box[$a];  
			$box[$a] = $box[$j];  
			$box[$j] = $tmp;  
			$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));  
		}  
		if($operation == 'DECODE')
		{  
	        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16))
	        {  
				return substr($result, 26);  
	        }
	        else
	        {  
				return '';  
			}  
	    }
	    else
	    {  
			return $keyc.str_replace('=', '', base64_encode($result));  
		}
	}

	// ############### 3des ######################
	private function pkcs5_unpad($text)
	{
		$pad = ord($text{strlen($text)-1});
		if($pad > strlen($text)) return false;
		if(strspn($text, chr($pad), strlen($text) - $pad) != $pad) return false;
		return substr($text, 0, -1 * $pad);
	}

	private function pkcs5_pad($text, $blocksize)
	{
		$pad = $blocksize - (strlen($text) % $blocksize);
		return $text . str_repeat(chr($pad), $pad);
	}
	
	//删除回车和换行
    private function removeBR( $str )
    {
        $len	= strlen( $str );
        $newstr	= "";
        $str	= str_split($str);
        for($i = 0; $i < $len; $i++ )
        {
			if ($str[$i] != '\n' and $str[$i] != '\r')
			{
				$newstr .= $str[$i];
			}
		}
		return $newstr;
    }

    //解密
	public function decrypt($encrypted)
	{
		$encrypted	= base64_decode($encrypted); 
        $key		= base64_decode($this->option['key']);
        $td			= mcrypt_module_open( MCRYPT_3DES,'',MCRYPT_MODE_ECB,'');
        //使用MCRYPT_3DES算法,ecb模式
        mcrypt_generic_init($td, $key, $this->option['iv'] );
        //初始处理
        $decrypted	= mdecrypt_generic($td, $encrypted);
        //解密
        mcrypt_generic_deinit($td);
        //结束
        mcrypt_module_close($td);
        $decrypted = self::pkcs5_unpad($decrypted); //pkcs5填充方式
        return $decrypted;
    }

    //加密
    public function encrypt( $input )
    {
        $size	= mcrypt_get_block_size('tripledes', 'ecb');
        $input	= self::pkcs5_pad($input, $size); //pkcs5填充方式
        $key	= base64_decode($this->option['key'] );
        $td		= mcrypt_module_open( MCRYPT_3DES, '', MCRYPT_MODE_ECB, '');
        //使用MCRYPT_3DES算法,ecb模式
        mcrypt_generic_init($td, $key, $this->option['iv']);
        //初始处理
        $data	= mcrypt_generic($td, $input);
        //加密
        mcrypt_generic_deinit($td);
        //结束
        mcrypt_module_close($td);
        $data	= self::removeBR(base64_encode($data));
        return $data;
    }

	// ############### AES ######################

	//#加密方法@return string
	public function aes_encrypt($str)
	{
		//AES, 128 ECB模式加密数据
		$key	= base64_decode($this->option['key']);
		$str	= $this->addPKCS7Padding( trim($str) );
		$iv		= mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128,MCRYPT_MODE_ECB),MCRYPT_RAND);
		$rs		=  mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $str, MCRYPT_MODE_ECB, $iv);
		return base64_encode($rs);
	}

	//#解密 @return string
	public function aes_decrypt($str)
	{
		//AES, 128 ECB模式加密数据
		$str	= base64_decode($str);
		$key	= base64_decode( $this->option['key'] );
		$iv		= mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128,MCRYPT_MODE_ECB),MCRYPT_RAND);
		$rs		= mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $str, MCRYPT_MODE_ECB, $iv);
		return $this->stripPKSC7Padding( trim($rs) );
	}

	/**
	 *@Notic填充算法
	 *@param string $source
	 *@return string
	 */
	public function addPKCS7Padding( $source )
	{
		$source	= trim($source);
		$block	= mcrypt_get_block_size('rijndael-128', 'ecb');
		$pad	= $block - (strlen($source) % $block);
		if ($pad <= $block)
		{
			$char	 = chr($pad);
			$source .= str_repeat($char, $pad);
		}
		return $source;
	}

	/**
	 * 移去填充算法
	 * @param string $source
	 * @return string
	 */
	public function stripPKSC7Padding($source)
	{
		$source	= trim($source);
		$char	= substr($source, -1);
		$num	= ord($char);
		return $num==62 ? $source : substr($source,0,-$num); 
    }

}
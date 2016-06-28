<?php
class LibRedis
{
	static public $staticDB	= array();
	static public $config 	= array();
	public $db		= null;
	public $prefix	= '';

	public function __construct($obj = null, $_prefix = '' )
	{
		$this->db 		= $obj;
		$this->prefix 	= $_prefix;
	}

	// #初始化
	static public function ini( $conf = 'default', $type = 'w' )
	{
		if(!extension_loaded('Redis'))
		{
			LibBase::CallBack(701, 'Redis extension not exists');
		}
		$key 	= md5($conf.'_'.$type);

		if( isset(self::$staticDB[$key]) )
		{
			return self::$staticDB[$key];
		}
		if(empty(self::$config))
		{
			$gconf			= Yaf_Registry::get('gconfig' );
			self::$config	= $gconf['redis'];
			unset($gconf);
		}
		if(!isset(self::$config[$conf]['init'][$type]) || empty(self::$config[$conf]['init'][$type]))
		{
			LibBase::CallBack(702,'Cache config not exists');
		}
		if(self::$config[$conf]['weightType'] == 'rand')
		{
			shuffle(self::$config[$conf]['init'][$type]);
		}
		else
		{
			krsort(self::$config[$conf]['init'][$type]);
		}
		try
		{
			$obj 	= new Redis();
		}
		catch(Exception $e)
		{
			LibBase::CallBack(703,'Redis Connect Faild '.$e->getMessage().'');
		}
		$d		= null;
		$prev	= '';
		foreach(self::$config[$conf]['init'][$type] as $v)
		{
			try
			{
				$d = $obj->connect($v['host'], $v['port'] ,(int)@$v['timeout']);
				if( $d )
				{
					$prev 	= $v['prefix'];
					break;
				}
			}catch(Exception $e){
				LibBase::CallBack(704,'Redis Connect Faild');
			}
		}
		if(!$d)
		{
			LibBase::CallBack(705,'Redis Connect Faild');
		}
		$class 					= __CLASS__;
		self::$staticDB[$key]	= new $class( $obj, $prev );
		return self::$staticDB[$key];
	}
	
	//#清空库
	public function flushall()
	{
		$this->db->FLUSHALL();
	}

	//#键迁移别的库
	public function move( $key ,  $dbnum )
	{
		$key	= $this->prefix ? $this->prefix . $key : $key;
		$this->db->move( $key,  $dbnum );
	}

	//#改名
	public function rename( $key , $newkey )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$newkey	= $this->prefix ? $this->prefix.$newkey : $newkey;
		if( $this->db->exists($key) )
		{
			$this->db->rename( $key, $newkey);
		}
	}
	/************************************************
	*KEY
	************************************************/
	//#检查键是否存在
	public function exists( $key )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->exists( $key );
	}

	//#删除一个键 
	public function del( $key )
	{
		if( is_array($key) && $this->prefix )
		{
			foreach( $key as $k=>$v )
			{
				$key[$k]	= $this->prefix.$v ;
			}
		}
		else
		{
			$key	= $this->prefix ? $this->prefix.$key : $key ;
		}
		$this->db->del( $key );
	}

	/*返回一个键的类型
	none(key不存在) int(0)
	string(字符串) int(1)
	list(列表) int(3)
	set(集合) int(2)
	zset(有序集) int(4)
	hash(哈希表) int(5)
	*/
	public function type( $key )
	{
		$key	= $this->prefix ? $this->prefix . $key : $key ;
		return $this->db->type( $key );
	}

	/**
	*@Notic:设置键的有效期
	*@param:$type 大于0则 time为时间戳 否则为time为时间 单位(秒)
	*/
	public function expire( $key ,$time  , $type = 0)
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		if( $type < 1  )
		{
			$this->db->expire( $key , $time );
		}
		else
		{  //设置过期时间戳
			$this->db->expireat( $key , $time );
		}
	}

	//#移除生命周期
	public function persist( $key )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key ;
		$this->db->persist( $key );
	}

	//#获取键值存活时间
	public function ttl( $key )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key ;
		return $this->db->ttl($key);
	}

	/***************************************************
	*# STRING
	****************************************************/
	//#设置键值
	public function set( $key = '', $value = '', $timeout = 0 )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key ;
		$value	=  is_array($value) || is_object($value) ?  serialize( $value ) : $value;
		if( !$timeout )
		{
			$this->db->set($key, $value);
		}
		else
		{
			$this->db->setex($key, $timeout, $value);
		}
	}

	//#获取键值
	public function get( $key , $serializer = false )
	{
		$key		= $this->prefix ? $this->prefix.$key : $key ;
		$content	= $this->db->get( $key );
		if( $content )
		{
			return ($serializer ?  unserialize($content)  : $content);
		}
		return false;
	}

	//#获取多键
	public function mget( $array_key )
	{
		$key	= $array_key;
		if( $this->prefix )
		{
			$key	= array();
			foreach( $array_key as $k=>$v )
			{
				$key[] = $this->prefix.$v;
			}
		}
		$rs = $this->db->mset( $key );
		return array_combine($array_key, $rs);
	}

	//#设置多健
	public function mset( $array )
	{
		$new_array	= $array;
		if( $this->prefix )
		{
			$new_array	= array();
			foreach($array as $k=>$v )
			{
				$_k				= $this->prefix.$k;
				$new_array[$_k] = $v;
			}
		}
		$this->db->mset( $new_array );
	}

	/***************************************************
	*# HASH
	****************************************************/

	//#分配给指定的HASH表
	public function hset( $table , $key , $value )
	{
		$table = $this->prefix ? $this->prefix.$table : $table ;
		$value = is_array($value) || is_object($value) ?  serialize( $value ) : $value ;
		return $this->db->hset( $table , $key , $value );
	}

	//#获取指定的HASH表中的键
	public function hget( $table ,$key , $serialize = false )
	{
		$table	= $this->prefix ? $this->prefix.$table : $table;
		$data	= $this->db->hget( $table, $key );
		return $data && $serialize ? unserialize( $data ) : $data;
	}

	//#判断指定的HASH表中是否存在该键
	public function hexists( $table ,$key )
	{
		$table = $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hexists( $table, $key );
	}

	//#删除一个HASH表的键
	public function hdel( $table, $key )
	{
		$table = $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hdel( $table, $key );
	}

	//#获取HASH表的个数
	public function hlen( $table )
	{
		$table = $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hlen( $table );
	}

	//#存多个数据入HASH
	public function hmset( $table ,$data )
	{
		$table = $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hmset( $table, $data );
	}

	//#从HASH取多个数据
	public function hmget( $table ,$keys, $serialize = false )
	{
		$table	= $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hmget( $table, $keys );
	}

	//#对HASH进行递增
	public function hincrby( $table, $key, $value = 1)
	{
		$table	= $this->prefix ? $this->prefix.$table : $table;
		$this->db->hincrby( $table, $key, $value );
	}

	//#获取所有的KEYS
	public function hkeys( $table )
	{
		$table	= $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hkeys( $table );
	}

	//#获取HASH所有的值
	public function hvals( $table )
	{
		$table	= $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hvals( $table );
	}

	//#获取HASH 
	public function hgetall( $table )
	{
		$table	= $this->prefix ? $this->prefix.$table : $table;
		return $this->db->hgetall( $table );
	}

	/*****************************************
	* List
	*****************************************/
	public function lpush( $key, $value, $getLength = 0 )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$value	= is_array( $value) || is_object($value ) ? serialize($value) : $value ;
		return $getLength ? $this->db->lpushx( $key, $value ) : $this->db->lpush( $key, $value );	
	}

	public function rpush( $key, $value, $getLength = 0 )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$value	= is_array( $value) || is_object($value ) ? serialize($value) : $value ;
		return $getLength ? $this->db->rpushx( $key, $value ) : $this->db->rpush( $key, $value );	
	}

	public function lpop( $key, $serialize = false )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$rs		= $this->db->lpop( $key );
		if( $rs && $serialize )
		{
			return unserialize( $rs );
		}
		return $rs ;
	}

	public function rpop( $key, $serialize = false )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$rs		= $this->db->rpop( $key );
		if( $rs && $serialize )
		{
			return unserialize( $rs );
		}
		return $rs ;
	}

	//#获取列表长度
	public function llen( $key )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->llen( $key );
	}

	//#获取指定区块start  stop
	public function lrange( $key, $start = 0, $limit= -1, $serialize = false )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$rs 	= $this->db->lrange( $key, $start, $limit );
		if($rs && $serialize)
		{
			foreach($rs as $k=>$v)
			{
				$rs[$k]	= unserialize($v);
			}
		}
		return $rs;
	}

	/*
	删除相同值
	count > 0: 从表头开始向表尾搜索，移除与value相等的元素，数量为count。
	count < 0: 从表尾开始向表头搜索，移除与value相等的元素，数量为count的绝对值。
	count = 0: 移除表中所有与value相等的值。
	*/
	public function lrem( $key , $count , $value )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$value	= is_array($value )  || is_object( $value ) ? serialize($value) : $value;
		return $this->db->lrem( $key, $count, $value );
	}

	//#更改对应索引的值
	public function lset($key, $index, $value )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$value	= is_array($value )  || is_object( $value ) ? serialize($value) : $value;
		if( $this->db->llen($key) >0 )
		{
			return $this->db->lset( $key, $index, $value );
		}
	}

	//#保留区块,删除其他
	public function ltrim( $key , $start = 0,  $stop = 0 )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$this->db->ltrim( $key, $start, $stop );
	}

	//获取指定索引元素
	public function lindex( $key, $index, $serialize = false)
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$rs 	=  $this->db->lindex( $key , $index );
		if( $rs  && $serialize )
		{
			$rs = unserialize( $rs );
		}
		return $rs;
	}

	//#在指定元素值插入 before || after
	public function linsert( $key , $position = 'before' , $poit, $value )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$poit  = is_array( $poit )  || is_object( $poit ) ? serialize( $poit ) : $poit;
		$value = is_array($value )  || is_object( $value ) ? serialize($value) : $value;
		return $this->db->linsert( $key, $position, $poit, $value);
	}

	//#移除元素堆在另一个队列
	public function rpoplpush( $key, $newkey, $serialize = false )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$newkey	= $this->prefix ? $this->prefix.$newkey : $newkey ;
		$rs		= $this->db->rpoplpush( $key, $newkey );
		return  $serialize ? unserialize($rs) : $rs; 
	}

	public function sort( $key, $options = array())
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->sort( $key, $options );
	}

	/*****************************************
	*集合
	*****************************************/
	//#添加一个元素
	public function sadd( $key , $member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$this->db->sadd( $key, $member );
	}

	//#删除一个元素
	public function srem($key ,$member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$this->db->link->srem( $key, $member );
	}
	
	//#获取所有元素
	public function smembers( $key )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->smembers( $key, $member );
	}

	//#判断元素是否存在
	public function sismember( $key, $member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->sismember( $key, $member );
	}
	
	//#获取集合数量
	public  function scard( $key ){
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->scard( $key );
	}

	//#将A元素从A集合移动到B集合
	public function smove( $key, $newkey, $member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$newkey	= $this->prefix ? $this->prefix.$newkey : $newkey;
		return $this->db->smove( $key, $newkey, $member );
	}

	//#获取随机元素
	public function srand($key, $delete = true )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		if( !$delete )
		{
			$rs	=  $this->db->srandmember( $key );
		}
		else
		{
			$rs	= $this->db->spop( $key );
		}
		return $rs ;
	}

	//#返回交集列表
	public function sinter($keys  ,$storkey = '')
	{
		$data = array();
		if( $this->prefix )
		{
			$newkeys	= array();
			foreach( $keys as $v )
			{
				$newkeys[]	= $this->prefix.$v;
			}
			$keys = $newkeys;
		}
		if( !$storkey )
		{
			return $this->db->sinter($keys);
		}
		else
		{
			$key = $this->prefix ? $this->prefix.$storkey : $storkey ;
			return $this->db->sinterstore( $key , $keys );
		}
	}

	//#并集
	public function sunion( $keys  , $storkey = '')
	{
		if( $this->prefix )
		{
			foreach( $keys as $k=>$v )
			{
				$keys[$k] =  $this->prefix.$v ;
			}
		}
		if( !$storkey )
		{
			return $this->db->sunion( $keys );
		}
		else
		{
			$key = $this->prefix ? $this->prefix . $storkey : $storkey ;
			return $this->db->sunionstore( $keys , $key );
		}	
	}

	//#差集
	public function sdiff( $keys, $storkey = '' )
	{
		if( $this->prefix )
		{
			foreach( $keys as $k=>$v )
			{
				$keys[$k] =  $this->prefix.$v ;
			}
		}
		if( !$storkey )
		{
			return $this->db->sdiff( $keys );
		}
		else
		{
			$key = $this->prefix ? $this->prefix.$storkey : $storkey ;
			return $this->db->sdiffstore( $key, $keys );
		}
	}

	/*****************************************
	*#有序集合
	*****************************************/
	//#添加
	public function zadd($key, $sore, $member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		$this->db->zadd( $key, $sore, $member );
	}

	//#获取区域
	public function zrange( $key, $start = 0, $end = -1 )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zrange( $key, $start, $end );
	}

	//#删除元素
	public function zrem( $key ,$member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zrem( $key, $member );
	}

	//#按排序SORE 由大到小  取
	public function zrevrange( $key, $start, $end, $withscores =false )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zrevrange( $key, $start, $end, $withscores );
	}

	/*
	#指定SORE范围内获取指定条数
	返回名称为key的zset中score >= star且score <= end的所有元素
	a = array(0 #是否带sore#, 0 #条数#)
	*/
	public function zrangebyScore( $key, $start, $end, $a = array(0,0) )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zrangebyScore( $key, $start, $end, $a );
	}

	/*
	#指定SORE范围内的个数
	返回名称为key的zset中score >= star且score <= end的所有元素
	*/
	public function zcount( $key ,$start, $end )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zcount( $key , $start , $end );
	}

	/*
	#删除SORE范围内的
	返回名称为key的zset中score >= star且score <= end的所有元素
	返回删除的个数
	*/
	public function zremRangebyscore( $key, $start, $end )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zremRangebyscore( $key, $start, $end );
	}

	//#获取元素个数
	public function zcard( $key )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zcard( $key );
	}

	//#获取指定元素的分值
	public function  zscore( $key ,$member )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zscore( $key, $member );
	}

	//#获取元素的索引值 zRank, zRevRank
	public function zrank( $key ,$member ,  $order = 'ASC' )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $order == 'ASC' ? $this->db->zrand( $key , $member) : $this->db->zrevrank( $key , $member);
	}

	//#向元素添加分值
	public function zincrby( $key , $member , $value = 1 )
	{
		$key	= $this->prefix ? $this->prefix.$key : $key;
		return $this->db->zincrby( $key, $value, $member );
	}

}
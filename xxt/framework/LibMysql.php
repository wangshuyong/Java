<?php
/**
*@Notic:mysql操作类
*$obj=LibMysql::ini();
*/

class LibMysql
{
	static public $config 	= array();
	static public $staticDB	= array();
	
	public $db		= null;
	public $debug	= false;
	
	function __construct( $obj = null, $debug = false )
	{
		$this->db		= $obj;
		$this->debug	= $debug;
	}

	// #初始化
	static public function ini( $conf = 'default', $type = 'r', $debug = false )
	{
		$key 	= md5($conf.'_'.$type);
		if(isset(self::$staticDB[$key]))
		{
			return self::$staticDB[$key];
		}
		if(empty(self::$config))
		{
			$gconf			= Yaf_Registry::get('gconfig' );
			self::$config	= isset($gconf['mysql']) ? $gconf['mysql'] : array();
			unset($gconf);
		}
		if(!isset(self::$config[$conf]['init'][$type]) || empty(self::$config[$conf]['init'][$type]) )
		{
			LibBase::CallBack(601,'DBconfig not exists');
		}
		if( self::$config[$conf]['weightType'] = 'rand' )
		{
			shuffle(self::$config[$conf]['init'][$type]);
		}
		else
		{
			krsort(self::$config[$conf]['init'][$type]);
		}
		$tmpObj	= null;
		foreach(self::$config[$conf]['init'][$type] as $v)
		{
			$option	= array(
						PDO::ATTR_EMULATE_PREPARES		=> true,
						PDO::ATTR_TIMEOUT				=> 2,//设置超时
						PDO::MYSQL_ATTR_INIT_COMMAND	=> "SET NAMES '".$v['charset']."'",
					);
			$dsn	= "mysql:dbname=".$v['name'].";host=".$v['host'].";port=".$v['port']."" ;
			try
			{
				$tmpObj	= @new PDO($dsn,$v['user'],$v['password'],$option);
			}
			catch(Exception $e )
			{
				$tmpObj	= null;
			}
			if($tmpObj){break;}
		}
		if(!$tmpObj)
		{
			LibBase::CallBack(602,'DB conect fail not exists');
		}
		if(__DEFINE_ENV__)
		{
			$tmpObj->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_WARNING);
		}
		else
		{
			$tmpObj->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_SILENT);
		}
		$class 					= __CLASS__;
		self::$staticDB[$key]	= new $class( $tmpObj, $debug );
		return self::$staticDB[$key];
	}

	//#查询条件
	public function where( $where = array() )
	{
		if(empty($where))return '';
		if(is_string($where))return " WHERE ".$where;
		$str	= " WHERE 1=1 ";
		foreach($where as $k => $v)
		{
			if(is_numeric($k))
			{
				$str	.= " AND (".$v.")";
			}else{
				$str	.= " AND `".$k."`='".$v."' ";
			}
		}
		return $str;
	}
	//#其他条件处理
	public function exQuery( $where = array() )
	{
		if(empty($where))return '';
		$str = ' ';
		foreach( $where as $k => $v )
		{
			if( is_numeric($k))
			{
				$str .= " ".$v;
			}else{
				$str .= " ".$k." ".$v ;
			}	
		}
		return $str;
	}

	//#VALUE设置
	public function data( $data )
	{
		$callback	= " SET ";
		foreach( $data as $k=>$v )
		{
			if(is_numeric($k))
			{
				$callback .=  $v.",";
			}else{
				$callback .= "`".$k."`='".$v."',";
			}
		}
		$callback	= rtrim( $callback, ",");
		return $callback;
	}

	//#hash
	public function Thash( $table, $str, $maxLen = 64, $hashtype='string' )
	{
		return $table.'_'.($hashtype != 'mod' ? LibBase::TableHash( $str , $maxLen ) : ((int)$str % $maxLen) );
	}

	//#返回影响行数
	public function exec( $sql )
	{
		$rs = false;
		if($this->debug){echo str_replace(array("\t","\r","\n"), '', $sql);}
		try
		{
			$rs  = $this->db->query( $sql );	
		}
		catch(Exception $e )
		{
			echo 'MysqlQuery Faild: '.$e->getMessage();
		}
		return $rs ;
    }

    //#执行,带有返回结果集 适合SELECT
	public function query( $sql )
	{
		$rs =  false ;
		if($this->debug){echo str_replace(array("\t","\r","\n"), '', $sql);}
		try
		{
			$rs	= $this->db->query( $sql );	
		}
		catch(Exception $e )
		{
			echo '{MysqlQuery Faild '.$e->getMessage().' }';
		}
		return $rs ;
	}

	//#插入
	public function insert($data, $table, $lastID = false, $hash = '', $maxtable = 128, $hashtype = 'string' )
	{
		$table	= $hash ? $this->Thash( $table, $hash, $maxtable, $hashtype) : $table;
		$sql	= "INSERT INTO `".$table."` ".$this->data( $data )." ";
		$rs		= $this->query( $sql );
		if($lastID && $rs)
		{
			return $this->db->lastInsertId();
		}
		return $rs;
	}

	//#更新
	public function update( $data, $where, $table, $hash = '', $maxtable = 128, $hashtype = 'string')
	{
		$table	= $hash ? $this->Thash( $table , $hash , $maxtable , $hashtype) : $table;
		$sql	= "UPDATE `".$table."` ".$this->data($data)." ".$this->where( $where )." ";
		return $this->query( $sql );
	}

	//#删除
	public function delete(  $where, $table, $hash = '', $maxtable = 128, $hashtype = 'string' )
	{
		$table	= $hash ? $this->Thash( $table , $hash , $maxtable , $hashtype ) : $table ;
		$sql	=  "DELETE FROM `".$table."` ".$this->where( $where )." ";
		return	$this->query( $sql );
	}

	//#获取单条
	public function findOne(  $where , $other = array(), $table, $column = '*', $hash = '', $maxtable = 128, $hashtype = 'string' )
	{
		$table	= $hash ? $this->Thash( $table , $hash , $maxtable , $hashtype) : $table;
		$sql	= "SELECT ".$column." FROM `".$table."` ".$this->where( $where )." ".$this->exQuery($other)." LIMIT 1 ";
		$rs		=  $this->query( $sql );
		if( $rs ){
			return $rs->fetch( PDO::FETCH_ASSOC );
		}
		return array();
	}

	//#获取多条
	public function findAll( $where, $other = array(), $table, $select = '*', $hash = '', $maxtable = 128, $hashtype = 'string')
	{
		$table	= $hash ? $this->Thash( $table, $hash, $maxtable, $hashtype) : $table;
		$sql	= "SELECT ".$select." FROM `".$table."` ".$this->where( $where )." ".$this->exQuery($other)." ";
		$rs		= $this->query( $sql );
		if( $rs )
		{
			return $rs->fetchAll( PDO::FETCH_ASSOC );
		}
		return array();
	}

	//#获取条数
	public function count($where, $other = array(), $table, $hash = '', $maxtable = 128, $hashtype = 'string' )
	{
		$table	= $hash ? $this->Thash( $table, $hash, $maxtable, $hashtype) : $table;
		$sql	= "SELECT COUNT(1) AS c FROM `".$table."` ".$this->where( $where )." ".$this->exQuery($other)." ";
		$rs		= $this->query( $sql );
		if(!$rs)return false;
		$data	= $rs->fetch(PDO::FETCH_ASSOC);
		unset($rs);
		return (int)$data['c'];
	}

	//#获取UUID
	public function findUUid( $table )
	{
		$sql	= "SELECT uuid() AS 'uuid' FROM `".$table."`";
		$c		= $this->query( $sql );
		if( !$c )return false;
		$data	= $c->fetch(PDO::FETCH_ASSOC);
		$rs		= !empty($data) ? str_replace('-', '', $data['uuid']): '';
		return $rs;
	}

}
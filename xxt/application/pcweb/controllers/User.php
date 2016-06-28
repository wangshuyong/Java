<?php
/**
* @Notic:用户Controller
*/
class UserController extends PCWeb
{
	public function init()
	{
		parent::init();
	}

	/**
	* @Notic:登录
	*/
	public function LoginAction()
	{
		if(isset($_POST['submit']) && $_POST['submit'] == 1)
		{
			if(!isset($_POST['key']) || empty($_POST['key']))
			{
				LibBase::CallBack( 1001, '参数不合法' );
			}
			$key 	= (string)$_POST['key'];
			$table	= 'qrlogin_'.substr($key, -8);
			$obj	= LibRedis::ini( 'default', 'w' );
			$rs 	= $obj->db->hget( $table, $key );
			$rs 	= $rs ? unserialize($rs) : '';
			if(!is_array($rs))
			{
				LibBase::CallBack( 1002, '数据错误' );
			}
			if(isset($rs['type']) && $rs['type'] != 1)
			{
				LibBase::CallBack( 1004, '数据错误' );
			}
			if($rs['status'] != 3)
			{
				for($i=0; $i<10; $i++)
				{
					sleep(1);
					$_rs	= $obj->db->hget( $table, $key );
					$_rs 	= $_rs ? unserialize($_rs) : '';
					if(is_array($_rs))
					{
						if($_rs['status'] == 3)
						{
							$rs 	= $_rs;
							$obj->db->hdel( $table, $key );
							break;
						}
					}
					unset($_rs);
				}
			}
			if($rs['status'] != 3)
			{
				LibBase::CallBack( 1000, 'ok' );
			}
			$userInfo	= array(
							'userid'		=> !empty($rs['userinfo']['userid']) ? $rs['userinfo']['userid'] : '',
							'companyid'		=> !empty($rs['userinfo']['companyid']) ? $rs['userinfo']['companyid'] : '0',
							'phonenumber'	=> !empty($rs['userinfo']['phonenumber']) ? $rs['userinfo']['phonenumber'] : '',
							'phonemd5'		=> !empty($rs['userinfo']['phonemd5']) ? $rs['userinfo']['phonemd5'] : '',
							'sex'			=> !empty($rs['userinfo']['sex']) ? $rs['userinfo']['sex'] : 0,
							'logo'			=> !empty($rs['userinfo']['logo']) ? $rs['userinfo']['logo'] : '',
							'name'			=> !empty($rs['userinfo']['name']) ? $rs['userinfo']['name'] : '',
							'department1'	=> !empty($rs['userinfo']['department1']) ? $rs['userinfo']['department1'] : '',
							'department2'	=> !empty($rs['userinfo']['department2']) ? $rs['userinfo']['department2'] : '',
							'seqnum'		=> !empty($rs['userinfo']['seqnum']) ? $rs['userinfo']['seqnum'] : '',
							'position'		=> !empty($rs['userinfo']['position']) ? $rs['userinfo']['position'] : '',
							'isadmin'		=> !empty($rs['userinfo']['isadmin']) ? $rs['userinfo']['isadmin'] : 0,
							'adminlevel'	=> !empty($rs['userinfo']['adminlevel']) ? $rs['userinfo']['adminlevel'] : '',
							'header'		=> !empty($rs['data']) ? $rs['data'] : array()
						);
			LibCookie::set( 'user', $userInfo );
			LibBase::CallBack( 200, 'ok' );
		}
		$user		= LibCookie::get('user');
		if(!empty($user))
		{
			$this->redirect('/index/index');
			exit;
		}
		$nowdate	= date('Ymd');
		$table		= 'qrlogin_'.$nowdate;
		$t			= explode(" ", microtime());
		$key		= sprintf("%.0f",(( floatval($t[1]) + floatval($t[0]))*1000)).uniqid().$nowdate;
		$obj		= LibRedis::ini( 'default', 'w' );
		echo $key;
		$data		= array(
						'type'		=> 1,
						'status'	=> 1,
						'ctime'		=> time(),
						'uptime'	=> '0',
						'data'		=> array(),
						'userinfo'	=> array()
					);
		$obj->db->hset( $table, $key, serialize($data) );
		$params		= array('key'=>$key);
		$this->getView()->assign( $params );
		Yaf_Dispatcher::getInstance()->enableView();
	}

	//#用户列表
	public function ListAction()
	{
		$user			= $this->UserAuth(1);
		$data 			= array();
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array(
							'companyId'	=> !empty($user['companyid']) ? $user['companyid'] : 0
						);
		$rs				= LibCURL::Send( __DEFINE_API_USERLIST__, $param, 10 );
		if($rs['errno'] < 1)
		{
			$json 	= json_decode($rs['data'],1);
			if($json['code'] == 0 && !empty($json['data']))
			{
				$_data 	= array();
				foreach($json['data'] as $v)
				{
					if($v['state'] == 2)
					{
						continue;
					}
					$depOne					= !empty($v['departmentNameOne']) ? $v['departmentNameOne'] : '';
					$depTwo					= !empty($v['departmentNameTwo']) ? $v['departmentNameTwo'] : '';
					$keyOne					= md5($depOne);
					$keyTwo					= md5($depTwo);
					$_data[$keyOne]			= !isset($_data[$keyOne]) ? array('name'=>$depOne,'data'=>array() ) : $_data[$keyOne];
					$_data[$keyOne]['data'][$keyTwo]				= !isset($_data[$keyOne]['data'][$keyTwo]) ? array('name'=>$depTwo,'data'=>array() ): $_data[$keyOne]['data'][$keyTwo];
					$_data[$keyOne]['data'][$keyTwo]['data'][]	= array(
																	'id'		=> !empty($v['id']) ? $v['id'] : '0',
																	'name'		=> !empty($v['name']) ? $v['name'] : '',
																	'logo'		=> !empty($v['logo']) ? $v['logo'] : '',
																	'deptone'	=> !empty($v['departmentNameOne']) ? $v['departmentNameOne'] : '',
																	'depttwo'	=> !empty($v['departmentNameTwo']) ? $v['departmentNameTwo'] : '',
																	'position'	=> !empty($v['position']) ? $v['position'] : '',
																	'state'		=> !empty($v['state']) ? $v['state'] : '',
																);
				}
				if(!empty($_data))
				{
					foreach($_data as $_v)
					{
						$data[]	= array(
									'name'	=> $_v['name'],
									'data'	=> array_values($_v['data'])
							);
					}
				}
			}
		}
		LibBase::CallBack( 0, 'ok', array_values($data) );
	}

	//#用户详情
	public function DetailAction()
	{
		$user			= $this->UserAuth(1);
		if(!isset($_POST['userid']) || empty($_POST['userid']))
		{
			LibBase::CallBack( 1001, '参数不合法' );
		}
		$data			= array(
							'id'			=> '',
							'name'			=> '',
							'sex'			=> '',
							'departmentone'	=> '',
							'departmenttwo'	=> '',
						);
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array('userid' => $_POST['userid'] );
		$rs				= LibCURL::Send( __DEFINE_USERDETAIL__, $param, 10 );
		if($rs['errno'] < 1)
		{
			$json 		= json_decode($rs['data'],1);
			if(is_array($json) && $json['code'] == 0)
			{
				$data	= array(
							'id'			=> !empty($json['data']['ID']) ? $json['data']['ID'] : '',
							'name'			=> !empty($json['data']['NAME']) ? $json['data']['NAME'] : '',
							'sex'			=> !empty($json['data']['SEX']) ? $json['data']['SEX'] : '',
							'departmentone'	=> !empty($json['data']['DEPARTMENT_NAME_ONE']) ? $json['data']['DEPARTMENT_NAME_ONE'] : '',
							'departmenttwo'	=> !empty($json['data']['DEPARTMENT_NAME_TWO']) ? $json['data']['DEPARTMENT_NAME_TWO'] : '',
							'position'		=> !empty($json['data']['POSITION']) ? $json['data']['POSITION'] : '',
						);
			}
		}
		LibBase::CallBack( 0, 'ok', $data );
	}
	
}
<?php
class GroupController extends PCWeb
{
	public function init()
	{
		parent::init();
	}

	//#列表
	public function ListAction()
	{	
		$user			= $this->UserAuth(1);
		$data			= array();
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array(
							'userId'	=> !empty($user['userid']) ? $user['userid'] : 0,
						);
		$rs				= LibCURL::Send( __DEFINE_API_GROUPLIST__, $param, 10 );
		if($rs['errno'] < 1)
		{
			$json	= json_decode($rs['data'],1);
			if(is_array($json) && $json['code'] == 0 && !empty($json['data']))
			{
				foreach($json['data'] as $v)
				{
					$data[]	= array(
								'id'	=> !empty($v['id']) ? $v['id'] : 0,
								'name'	=> !empty($v['name']) ? $v['name'] : '',
							);
				}
			}
		}
		LibBase::CallBack( 0, 'ok', $data );
	}

	//#成员列表
	public function UserlistAction()
	{
		if(!isset($_POST['id']) || empty($_POST['id']))
		{
			LibBase::CallBack( 1001, '参数不合法' );
		}
		$id 			= $_POST['id'];
		$user			= $this->UserAuth(1);
		$data			= array('mastid'=>'0','list'=>array());
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array(
							'groupId'	=> $id,
						);
		$rs				= LibCURL::Send( __DEFINE_API_GROUPUSERLIST__, $param, 10 );
		if($rs['errno'] < 1)
		{
			$json	= json_decode($rs['data'],1);
			if(is_array($json) && $json['code'] == 0 && !empty($json['data']))
			{
				$data['mastid']	= $json['masterId'];
				foreach($json['data'] as $v)
				{
					$data['list'][]	= array(
										'id'			=> !empty($v['id']) ? $v['id'] : '',
										'name'			=> !empty($v['name']) ? $v['name'] : '',
										'logo'			=> !empty($v['logo']) ? $v['logo'] : '',
										'sex'			=> !empty($v['sex']) ? $v['sex'] : '',
										'position'		=> !empty($v['position']) ? $v['position'] : '',
										'departone'		=> !empty($v['departmentNameOne']) ? $v['departmentNameOne'] : '',
										'departtwo'		=> !empty($v['departmentNameTwo']) ? $v['departmentNameTwo'] : '',
										'isdisturb'		=> !empty($v['isDisturb']) ? $v['isDisturb'] : ''
									);
				}
			}
		}
		LibBase::CallBack( 0, 'ok', $data );
	}

	//#创建群
	public function AddAction()
	{
		if( !isset($_POST['userid']) || !isset($_POST['name']) )
		{
			LibBase::CallBack( 1001, '参数不完整' );
		}
		if(empty($_POST['userid']) || empty($_POST['name']))
		{
			LibBase::CallBack( 1002, '参数不合法' );
		}
		$user			= $this->UserAuth(1);
		$ids			= explode(',', trim($_POST['userid'],','));
		if(!empty($user['userid']))
		{
			$ids[]		= $user['userid'];
		}
		$ids 			= array_unique($ids);
		$userids 		= implode(',', $ids);
		$name			= $_POST['name'];
		$data			= array();
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array(
							'companyId'	=> !empty($user['companyid']) ? $user['companyid'] : 0,
							'createId'	=> !empty($user['userid']) ? $user['userid'] : 0,
							'userId'	=> $userids,
							'name'		=> $name
							
						);
		$rs				= LibCURL::Send( __DEFINE_API_GROUPADD__, $param, 10 );
		if($rs['errno'] < 1)
		{
			$json	= json_decode($rs['data'],1);
			if(is_array($json))
			{
				if($json['code'] == 0)
				{
					LibBase::CallBack( 0, 'ok' );
				}
				LibBase::CallBack( 1005, $json['msg'] );
			}
		}
		LibBase::CallBack( 1006, '创建失败' );

	}
}
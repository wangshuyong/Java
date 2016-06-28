<?php
/**
* @Notic:搜索
*/
class SearchController extends PCWeb
{
	public function init()
	{
		parent::init();
	}

	//#通讯录搜索
	public function GroupAction()
	{
		$data	= array(
					'userInfo'	=> array(),
					'groupInfo'	=> array()
				);
		if(isset($_POST['keyword']) || !empty($_POST['keyword']))
		{
			$user			= $this->UserAuth(1);
			$keyword		= $_POST['keyword'];
			$param 			= array();
			$param['header']= !empty($user['header']) ? $user['header'] : array();
			$param['post']	= array(
								'userId'	=> !empty($user['userid']) ? $user['userid'] : 0,
								'companyId'	=> !empty($user['companyid']) ? $user['companyid'] : 0,
								'keyword'	=> $keyword,
							);
			$rs				= LibCURL::Send( __DEFINE_API_GROUPSEARCH__, $param, 10 );
			if($rs['errno'] < 1)
			{
				$json		= json_decode($rs['data'],1);
				if(is_array($json))
				{
					if($json['code'] == 0)
					{
						if(!empty($json['userInfo']))
						{
							foreach($json['userInfo'] as $v)
							{
								$data['userInfo'][]	= array(
														'id'		=> !empty($v['id']) ? $v['id'] : 0,
														'name'		=> !empty($v['name']) ? $v['name'] : 0,
														'position'	=> !empty($v['position']) ? $v['position'] : '',
														'logo'		=> !empty($v['logo']) ? $v['logo'] : 0,
														'sex'		=> !empty($v['sex']) ? $v['sex'] : 0
													);
							}
						}
						if(!empty($json['groupInfo']))
						{
							foreach($json['groupInfo'] as $vv)
							{
								$data['groupInfo'][]	= array(
														'groupId'		=> !empty($vv['groupId']) ? $vv['groupId'] : 0,
														 'groupName'	=> !empty($vv['groupName']) ? $vv['groupName'] : ''
													);

		
							}
						}
					}
				}
			}
		}
		LibBase::CallBack( 0, 'ok', $data );
	}

}
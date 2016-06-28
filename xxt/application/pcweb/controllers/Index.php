<?php
class IndexController extends PCWeb
{
	public function init()
	{
		parent::init();
	}

	public function IndexAction()
	{
		$user		= $this->UserAuth(0);
		$option		= array(
						'UserInfo'			=> $user,
						'chatsend'			=> '/chat/send',//发送聊天消息
						'chatUrl'			=> '/chat/index',//聊天列表
						'nearchatUrl'		=> '/chat/near',//最近聊天列表			
						'userUrl'			=> '/user/list',//用户列表
						'userDetail'		=> '/user/detail',//用户详情
						'searchUrl'			=> '/search/group',//搜索群组
						'groupUrl'			=> '/group/list',//群组列表
						'groupaddUrl'		=> '/group/add',//群组添加
						'groupUserListUrl'	=> '/group/userlist',//群成员列表
					);
		Yaf_Dispatcher::getInstance()->enableView();
		$this->getView()->assign( $option );
	}

}
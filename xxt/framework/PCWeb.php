<?php
class PCWeb extends Yaf_Controller_ABstract
{
	public $LoginUser	= array();
	public function init()
	{
		Yaf_Dispatcher::getInstance()->disableView();
	}
	
	/**
	* @Notic:用户登录验证
	* @param:type 0页面验证 1ajax
	*/
	final function UserAuth($type = 0, $data = array() )
	{
		$user 	= LibCookie::get( 'user' );
		if($user)
		{
			$this->LoginUser	= $user;
			LibCookie::set('user',$user);
			unset($user);
			return $this->LoginUser;
		}
		if( $type > 0 )
		{
			LibBase::CallBack( 201, 'ok', $data );
		}
		$this->redirect('/user/login');
		exit;
	}
}
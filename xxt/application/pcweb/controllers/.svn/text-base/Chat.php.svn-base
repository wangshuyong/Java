<?php
class ChatController extends PCWeb
{
	public function init()
	{
		parent::init();
	}

	/**
	* @Notic:获取读消息
	* @param:int 	type		4 P2P 5 群聊
	* @param:string relationid	用户ID或者群组ID
	* @param:string action 		类型 new 获取最新 history 获取历史(默认去最新)
	* @param:int 	size 		返回的条数 默认100条
	* @param:int 	cursor 		游标：获取信息最新则用最后一条信息的时间戳 历史则用第一条信息的时间戳(0则获取未读消息)
	*/
	public function IndexAction()
	{
		$user			= $this->UserAuth(1);
		$nowtime		= time();
		$data			= array();
		$type			= isset($_POST['type']) ? $_POST['type'] : 4;
		$relationid		= isset($_POST['relationid']) ? (int)$_POST['relationid'] : 0;		
		$action			= isset($_POST['action']) ? $_POST['action'] : 'new';
		$size			= isset($_POST['size']) ? (int)$_POST['size'] : 100;
		$cursor			= isset($_POST['cursor']) ? $_POST['cursor'] : 0;

		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array(
							'type'		=> $type,
							'relationid'=> $relationid
						);
		$url			= __DEFINE_API_CHATUNREAD__;
		if( $cursor > 0 )
		{
			$param['post']['action']	= $action;
			$param['post']['size']		= $size;
			$param['post']['cursor']	= $cursor;
			$url 		= __DEFINE_API_CHATRECORD__;
		}
		$rs				= LibCURL::Send( $url, $param, 10 );
		if($rs['errno'] < 1)
		{
			$json 	= json_decode($rs['data'],1);
			if($json['code'] != 0)
			{
				LibBase::CallBack( 1001, $json['msg'], $data );
			}
			if(is_array($json) && $json['code'] == 0 && !empty($json['data']['list']) )
			{
				foreach($json['data']['list'] as $v)
				{
					$data[]	= array(
								'infoid'	=> !empty($v['infoid']) ? $v['infoid'] : '',
								'senderid'	=> !empty($v['senderid']) ? $v['senderid'] : '',
								'sendername'=> !empty($v['sendername']) ? $v['sendername'] : '',
								'isself'	=> !empty($v['isself']) ? $v['isself'] : '1',
								'contentype'=> !empty($v['contentype']) ? $v['contentype'] : '1',
								'sid'		=> !empty($v['sid']) ? $v['sid'] : '',
								'datetime'	=> !empty($v['datetime']) ? $v['datetime'] : 0,
								'frienddate'=> !empty($v['datetime']) ? date('Y-m-d H:i:s',$v['datetime']) : '',
								'content'	=> array(
												'text'		=> !empty($v['content']['text']) ? $v['content']['text'] : '',
												'thumb'		=> !empty($v['content']['thumb']) ? $v['content']['thumb'] : '',
												'file'		=> !empty($v['content']['file']) ? $v['content']['file'] : '',
												'duration'	=> !empty($v['content']['duration']) ? $v['content']['duration'] : '0',
											),
							);
				}
			}
		}
		LibBase::CallBack( 0, 'ok', $data );
	}

	//#最近聊天列表
	public function NearAction()
	{
		$user	= $this->UserAuth(1);
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array( 'gettype' => 'all' );
		$rs				= LibCURL::Send( __DEFINE_API_CHATNEAR__, $param, 6 );
		if($rs['errno'] < 1)
		{
			$json	= json_decode($rs['data'],1);
			if(is_array($json) && $json['code'] == 0 && !empty($json['data']['list']))
			{
				foreach($json['data']['list'] as $v)
				{
					$data[]	= array(
								'type'			=> (int)$v['type'] ,
								'relationid'	=> !empty($v['relationid']) ? $v['relationid'] : '0' ,
								'relationname'	=> !empty($v['relationname']) ? trim($v['relationname']) : '',
								'sid'			=> (int)$v['sid'],
								'datetime'		=> !empty($v['datetime']) ? date('Y-m-d H:i:s',$v['datetime']) : '',
								'summary'		=> !empty($v['summary']) ? $v['summary'] : '',
								'unreadnum'		=> !empty($v['unreadnum']) ? $v['unreadnum'] : 0,
								'info'			=> array(
													'senderid'	=> !empty($v['info']['senderid']) ? $v['info']['senderid'] : '',
													'sendername'	=> !empty($v['info']['sendername']) ? $v['info']['sendername'] : '',
												)
							);
				}
			}
		}
		LibBase::CallBack( 0, 'ok', $data );
	}
	
	//#发送聊天消息
	public function SendAction()
	{
		$user			= $this->UserAuth(1);
		if(!isset($_POST['type']) || !isset($_POST['relationid']) || !isset($_POST['content']))
		{
			LibBase::CallBack( 1001, '参数不合法' );
		}
		$type 			= $_POST['type'];
		$relationid 	= $_POST['relationid'];
		$content		= $_POST['content'];
		$param 			= array();
		$param['header']= !empty($user['header']) ? $user['header'] : array();
		$param['post']	= array(
							'type'			=> $type,
							'relationid'	=> $relationid,
							'contenttype'	=> 1,
							'text'			=> $content
						);
		$rs				= LibCURL::Send( __DEFINE_API_SENDMESSAGE__, $param, 6 );
		if($rs['errno'] < 1)
		{
			$json	= json_decode($rs['data'], 1);
			if(is_array($json))
			{
				if($json['code'] != 0)
				{
					LibBase::CallBack( 1002, $json['msg'] );
				}
			}
		}
		LibBase::CallBack( 0, 'ok' );
	}
}
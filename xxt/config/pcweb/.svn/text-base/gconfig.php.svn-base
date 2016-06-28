<?php
return array(
	//#############################框架参数#######################################
	'yaf'	=> array(
		'application'	=> array(
				'directory'	=> (__DEFINE_WEBROOT__.'/application/'.__DEFINE_INI__.'/'),
				'system'	=> array( 'library' => __DEFINE_WEBROOT__.'/framework/')
		),
	),
	//#############################其他参数#######################################
	'param'	=> array(
		//#################### COOKIE ####################
		'cookie'=> array(
				'user'	=> array(
						'name'		=> 'pcweblogin',//名称
						'auth'		=> 'discuz',//加密方式
						'authKey'	=> 'other',//加密键名
						'format'	=> 'obj',//值类型
						'path'		=> '/',//路径
						'domain'	=> '',//域名
						'expr'		=> 3600 * 30 //10小时
				),
		),
		//#################### 加密配置 ####################
		'auth'	=> array(
				'default'	=> array( 'key'=>'GiMHXuOiPRykvOWAyafzAjeil7PjW+bl','iv'=>'00000000'),
				'other'		=> array( 'key'=>'GiMHXuOiPRyassdAx9yzAjeil7PjW+bl','iv'=>'00000000'),
				'aes'		=> array('key'=>'MYgGnQE2jDFADSFFDSEWsdD', 'iv'=> '00000000'),
		),
		//###################### MYSQL #######################
		'mysql'	=> array(
			'default'	=> array(
				'weightType'=> 'rand',
				'init'		=> array(
							'w'	=> array(
								10 => array(
									'name'		=> 'goat',
									'host'		=> '127.0.0.1',
									'port'		=> 3306,
									'user'		=> 'root',
									'password'	=> '',
									'charset' 	=> 'utf8'
								),
							),
							'r'	=> array(
								10	=> array(
									'name'		=> 'goat',
									'host'		=> '127.0.0.1',
									'port'		=> 3306,
									'user'		=> 'root',
									'password'	=> '',
									'charset' 	=> 'utf8'
								),
								20	=> array(
									'name'		=> 'goat',
									'host'		=> '127.0.0.1',
									'port'		=> 3306,
									'user'		=> 'root',
									'password'	=> '',
									'charset' 	=> 'utf8'
								),
							),
				),
			),
		),
		//######################Redis#######################
		'redis'	=> array(
			'default'	=> array(
				'weightType'=> 'rand',
				'init'		=> array(
							'r'	=> array(
								10 => array(
										'host' 		=> '127.0.0.1' ,
										'port' 		=> 6379 ,
										'timeout'	=> 20,
										'prefix'	=> 'xxt_pcweb_'
									),
							),
							'w'	=> array(
								10 => array(
										'host' 		=> '127.0.0.1' ,
										'port' 		=> 6379 ,
										'timeout'	=> 20,
										'prefix'	=> 'xxt_pcweb_'
									),
								20 => array(
										'host' 		=> '127.0.0.1' ,
										'port' 		=> 6379 ,
										'timeout'	=> 20,
										'prefix'	=> 'xxt_pcweb_'
									),
							)
				)
			),
		),
	)
);
<?php
//#####################系统常量#######################
define('__DEFINE_CONFIG__', __DEFINE_WEBROOT__.'/config/'.__DEFINE_INI__);//配置文件夹
define('__DEFINE_ENV__','');//环境
define('__DEFINE_TIMEZONE__', 'PRC');//时区
define('__DEFINE_CHARSET__','UTF-8');//字符编码
//##################### 页面地址 #####################
define('__DEFINE_DOMAIN__','qingniusaas.net');
define('__DEFINE_URL__','http://devweb.'.__DEFINE_DOMAIN__);//当前使用域名
define('__DEFINE_THEMES__',__DEFINE_URL__.'/static');//样式使用地址

//##################### 接口相关 #####################
define('__DEFINE_APIURL__','http://dev.xxt.qnsaas.cn/portal');
define('__DEFINE_XAPIURL__','http://dev.xxt.qnsaas.cn/xapi');
define('__DEFINE_SAPIURL__','http://apidev.xxt.qnsaas.cn');
//#用户头像
define('__DEFINE_USERLOGO__',__DEFINE_SAPIURL__.'/user/logo?userId=');
//#用户详情
define('__DEFINE_USERDETAIL__',__DEFINE_SAPIURL__.'/im/userinfo');
//#最近聊天列表
define('__DEFINE_API_CHATNEAR__',__DEFINE_SAPIURL__.'/im/nearlist');
//#获取未读消息
define('__DEFINE_API_CHATUNREAD__',__DEFINE_SAPIURL__.'/im/unread');
//#制定目标聊天记录
define('__DEFINE_API_CHATRECORD__',__DEFINE_SAPIURL__.'/im/record');
//#发送群消息
define('__DEFINE_API_SENDMESSAGE__', __DEFINE_SAPIURL__.'/im/sendmessage');
//#通讯录
define('__DEFINE_API_USERLIST__',__DEFINE_APIURL__.'/company/userList');
//#群组搜索
define('__DEFINE_API_GROUPSEARCH__',__DEFINE_XAPIURL__.'/group/keyGroupList');
//#群组列表
define('__DEFINE_API_GROUPLIST__',__DEFINE_XAPIURL__.'/group/groupList');
//#群成员列表
define('__DEFINE_API_GROUPUSERLIST__',__DEFINE_XAPIURL__.'/group/groupUserList');
//#创建群
define('__DEFINE_API_GROUPADD__',__DEFINE_XAPIURL__.'/group/addGroup');
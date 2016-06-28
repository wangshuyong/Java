;!(function(JW, $, undefined){
	JW.ini 	= {};

	JW.QRCode 	= function()
	{
		var options = 
			{
				render		: 'image',
				ecLevel		: 'H',
				minVersion	: 1,
				fill		: '#313131',
				background	: '#fff',
				text		: $('#jsval_code').val(),
				size		: 235,
				radius		: 0.2,
				quiet		: 3,
				mode		: 0,
				mSize		: 0.11,
				mPosX		: 0.5,
				mPosY		: 0.5,
				label		: 'xxt',
				fontname	: 'Ubuntu',
				fontcolor	: '#ff9818',
				image		: ''
			};
		$('#jsval_codebox').empty().qrcode(options);
	}

	JW.Login	= function()
	{
		var key 	= $('#jsval_code').val();
		if(key == '')
		{
			JW.ShowTips('键名不合法');
			return false;
		}
		$.ajax({
			url		: '?',
			type	: 'POST',
			data	: {key:key,submit:1},
			dataType: 'JSON',
			timeout : 20000,
			success	: function(json)
			{
				if(json.code == 1000)
				{
					JW.Login();
				}
				else if(json.code == 200)
				{
					location.href = location.href;
				}
				else
				{
					JW.ShowTips(json.msg);
				}
			}
		});
	}

	//#返回验证
	JW.Auth 		= function(json)
	{
		if(json.code == 201)
		{
			window.location.href 	= '/user/login';
			return false;
		}
		return json;
	}

	//展示弹框
	JW.ShowTips		= function(tips)
	{
		alert(tips);
	}
	//#点击一级菜单
	JW.FirstMenu	= function(me)
	{
		$(me).parent().toggleClass("active");
	}

	//#点击二级菜单
	JW.SecondMenu	= function(me)
	{
		$(me).parent().toggleClass("active");
	}

	//#左侧菜单
	JW.LeftMenu		= function(me)
	{
		$(me).addClass("hover").siblings().removeClass("hover");
	}

	JW.EMOJIReplace = function( txt )
	{
		var EmojiKEY 	= ['[嘻嘻]','[哈哈]','[喜欢]','[晕]','[泪]','[馋嘴]','[抓狂]','[哼]','[可爱]','[怒]','[汗]','[微笑]','[睡觉]','[钱]','[偷笑]','[酷]','[衰]','[吃惊]','[怒骂]','[鄙视]','[挖鼻屎]','[色]','[鼓掌]','[悲伤]','[思考]','[生病]','[亲亲]','[抱抱]','[白眼]','[右哼哼]','[左哼哼]','[嘘]','[委屈]','[哈欠]','[敲打]','[疑问]','[挤眼]','[害羞]','[快哭了]','[拜拜]','[黑线]','[强]','[弱]','[给力]','[浮云]','[围观]','[威武]','[相机]','[汽车]','[飞机]','[爱心]','[奥特曼]','[兔子]','[熊猫]','[不要]','[ok]','[赞]','[勾引]','[耶]','[爱你]','[拳头]','[差劲]','[握手]','[玫瑰]','[心]','[伤心]','[猪头]','[咖啡]','[麦克风]','[月亮]','[太阳]','[啤酒]','[萌]','[礼物]','[足球]','[钟]','[自行车]','[蛋糕]','[围巾]','[手套]','[雪花]','[雪人]','[帽子]','[树叶]','[hee hee]','[lol]','[nice]','[dizzy]','[cry]','[greedy]','[crazy]','[hum]','[cute]','[angry]','[sweat]','[smile]','[sleepy]','[money]','[razz]','[cool]','[bad luck]','[surprise]','[curse]','[contempt]','[booger]','[lust]','[clap]','[sad]','[think]','[sick]','[kiss]','[hug]','[supercilious]','[right hum]','[left hum]','[quiet]','[grievance]','[yawn]','[beat]','[question]','[winking]','[shy]','[gonna cry]','[bye]','[silent]','[strong]','[weak]','[awesome]','[meaningless]','[onlooker]','[mighty]','[camera]','[car]','[plane]','[love]','[ultraman]','[rabbit]','[panda]','[no]','[like]','[tempt]','[yeah]','[love u]','[fist]','[poor]','[shake hand]','[rose]','[heart]','[broken heart]','[pig]','[coffee]','[mic]','[moon]','[sun]','[beer]','[adorable]','[gift]','[follow]','[clock]','[bike]','[cake]','[scarf]','[glove]','[snow]','[snowman]','[hat]','[leaf]','[football]'];
		var EmojiValue	= ['<img src="/static/emoji/xwbq001.png" width="20" height="20" />','<img src="/static/emoji/xwbq002.png" width="20" height="20" />','<img src="/static/emoji/xwbq003.png" width="20" height="20" />','<img src="/static/emoji/xwbq004.png" width="20" height="20" />','<img src="/static/emoji/xwbq005.png" width="20" height="20" />','<img src="/static/emoji/xwbq006.png" width="20" height="20" />','<img src="/static/emoji/xwbq007.png" width="20" height="20" />','<img src="/static/emoji/xwbq008.png" width="20" height="20" />','<img src="/static/emoji/xwbq009.png" width="20" height="20" />','<img src="/static/emoji/xwbq010.png" width="20" height="20" />','<img src="/static/emoji/xwbq011.png" width="20" height="20" />','<img src="/static/emoji/xwbq012.png" width="20" height="20" />','<img src="/static/emoji/xwbq013.png" width="20" height="20" />','<img src="/static/emoji/xwbq014.png" width="20" height="20" />','<img src="/static/emoji/xwbq015.png" width="20" height="20" />','<img src="/static/emoji/xwbq016.png" width="20" height="20" />','<img src="/static/emoji/xwbq017.png" width="20" height="20" />','<img src="/static/emoji/xwbq018.png" width="20" height="20" />','<img src="/static/emoji/xwbq019.png" width="20" height="20" />','<img src="/static/emoji/xwbq020.png" width="20" height="20" />','<img src="/static/emoji/xwbq021.png" width="20" height="20" />','<img src="/static/emoji/xwbq022.png" width="20" height="20" />','<img src="/static/emoji/xwbq023.png" width="20" height="20" />','<img src="/static/emoji/xwbq024.png" width="20" height="20" />','<img src="/static/emoji/xwbq025.png" width="20" height="20" />','<img src="/static/emoji/xwbq026.png" width="20" height="20" />','<img src="/static/emoji/xwbq027.png" width="20" height="20" />','<img src="/static/emoji/xwbq028.png" width="20" height="20" />','<img src="/static/emoji/xwbq029.png" width="20" height="20" />','<img src="/static/emoji/xwbq030.png" width="20" height="20" />','<img src="/static/emoji/xwbq031.png" width="20" height="20" />','<img src="/static/emoji/xwbq032.png" width="20" height="20" />','<img src="/static/emoji/xwbq033.png" width="20" height="20" />','<img src="/static/emoji/xwbq034.png" width="20" height="20" />','<img src="/static/emoji/xwbq035.png" width="20" height="20" />','<img src="/static/emoji/xwbq036.png" width="20" height="20" />','<img src="/static/emoji/xwbq037.png" width="20" height="20" />','<img src="/static/emoji/xwbq038.png" width="20" height="20" />','<img src="/static/emoji/xwbq039.png" width="20" height="20" />','<img src="/static/emoji/xwbq040.png" width="20" height="20" />','<img src="/static/emoji/xwbq041.png" width="20" height="20" />','<img src="/static/emoji/xwbq042.png" width="20" height="20" />','<img src="/static/emoji/xwbq043.png" width="20" height="20" />','<img src="/static/emoji/xwbq044.png" width="20" height="20" />','<img src="/static/emoji/xwbq045.png" width="20" height="20" />','<img src="/static/emoji/xwbq046.png" width="20" height="20" />','<img src="/static/emoji/xwbq047.png" width="20" height="20" />','<img src="/static/emoji/xwbq048.png" width="20" height="20" />','<img src="/static/emoji/xwbq049.png" width="20" height="20" />','<img src="/static/emoji/xwbq050.png" width="20" height="20" />','<img src="/static/emoji/xwbq051.png" width="20" height="20" />','<img src="/static/emoji/xwbq052.png" width="20" height="20" />','<img src="/static/emoji/xwbq053.png" width="20" height="20" />','<img src="/static/emoji/xwbq054.png" width="20" height="20" />','<img src="/static/emoji/xwbq055.png" width="20" height="20" />','<img src="/static/emoji/xwbq056.png" width="20" height="20" />','<img src="/static/emoji/xwbq057.png" width="20" height="20" />','<img src="/static/emoji/xwbq058.png" width="20" height="20" />','<img src="/static/emoji/xwbq059.png" width="20" height="20" />','<img src="/static/emoji/xwbq060.png" width="20" height="20" />','<img src="/static/emoji/xwbq061.png" width="20" height="20" />','<img src="/static/emoji/xwbq062.png" width="20" height="20" />','<img src="/static/emoji/xwbq063.png" width="20" height="20" />','<img src="/static/emoji/xwbq064.png" width="20" height="20" />','<img src="/static/emoji/xwbq065.png" width="20" height="20" />','<img src="/static/emoji/xwbq066.png" width="20" height="20" />','<img src="/static/emoji/xwbq067.png" width="20" height="20" />','<img src="/static/emoji/xwbq068.png" width="20" height="20" />','<img src="/static/emoji/xwbq069.png" width="20" height="20" />','<img src="/static/emoji/xwbq070.png" width="20" height="20" />','<img src="/static/emoji/xwbq071.png" width="20" height="20" />','<img src="/static/emoji/xwbq072.png" width="20" height="20" />','<img src="/static/emoji/xwbq073.png" width="20" height="20" />','<img src="/static/emoji/xwbq074.png" width="20" height="20" />','<img src="/static/emoji/xwbq075.png" width="20" height="20" />','<img src="/static/emoji/xwbq076.png" width="20" height="20" />','<img src="/static/emoji/xwbq077.png" width="20" height="20" />','<img src="/static/emoji/xwbq078.png" width="20" height="20" />','<img src="/static/emoji/xwbq079.png" width="20" height="20" />','<img src="/static/emoji/xwbq080.png" width="20" height="20" />','<img src="/static/emoji/xwbq081.png" width="20" height="20" />','<img src="/static/emoji/xwbq082.png" width="20" height="20" />','<img src="/static/emoji/xwbq083.png" width="20" height="20" />','<img src="/static/emoji/xwbq084.png" width="20" height="20" />','<img src="/static/emoji/xwbq001.png" width="20" height="20" />','<img src="/static/emoji/xwbq002.png" width="20" height="20" />','<img src="/static/emoji/xwbq003.png" width="20" height="20" />','<img src="/static/emoji/xwbq004.png" width="20" height="20" />','<img src="/static/emoji/xwbq005.png" width="20" height="20" />','<img src="/static/emoji/xwbq006.png" width="20" height="20" />','<img src="/static/emoji/xwbq007.png" width="20" height="20" />','<img src="/static/emoji/xwbq008.png" width="20" height="20" />','<img src="/static/emoji/xwbq009.png" width="20" height="20" />','<img src="/static/emoji/xwbq010.png" width="20" height="20" />','<img src="/static/emoji/xwbq011.png" width="20" height="20" />','<img src="/static/emoji/xwbq012.png" width="20" height="20" />','<img src="/static/emoji/xwbq013.png" width="20" height="20" />','<img src="/static/emoji/xwbq014.png" width="20" height="20" />','<img src="/static/emoji/xwbq015.png" width="20" height="20" />','<img src="/static/emoji/xwbq016.png" width="20" height="20" />','<img src="/static/emoji/xwbq017.png" width="20" height="20" />','<img src="/static/emoji/xwbq018.png" width="20" height="20" />','<img src="/static/emoji/xwbq019.png" width="20" height="20" />','<img src="/static/emoji/xwbq020.png" width="20" height="20" />','<img src="/static/emoji/xwbq021.png" width="20" height="20" />','<img src="/static/emoji/xwbq022.png" width="20" height="20" />','<img src="/static/emoji/xwbq023.png" width="20" height="20" />','<img src="/static/emoji/xwbq024.png" width="20" height="20" />','<img src="/static/emoji/xwbq025.png" width="20" height="20" />','<img src="/static/emoji/xwbq026.png" width="20" height="20" />','<img src="/static/emoji/xwbq027.png" width="20" height="20" />','<img src="/static/emoji/xwbq028.png" width="20" height="20" />','<img src="/static/emoji/xwbq029.png" width="20" height="20" />','<img src="/static/emoji/xwbq030.png" width="20" height="20" />','<img src="/static/emoji/xwbq031.png" width="20" height="20" />','<img src="/static/emoji/xwbq032.png" width="20" height="20" />','<img src="/static/emoji/xwbq033.png" width="20" height="20" />','<img src="/static/emoji/xwbq034.png" width="20" height="20" />','<img src="/static/emoji/xwbq035.png" width="20" height="20" />','<img src="/static/emoji/xwbq036.png" width="20" height="20" />','<img src="/static/emoji/xwbq037.png" width="20" height="20" />','<img src="/static/emoji/xwbq038.png" width="20" height="20" />','<img src="/static/emoji/xwbq039.png" width="20" height="20" />','<img src="/static/emoji/xwbq040.png" width="20" height="20" />','<img src="/static/emoji/xwbq041.png" width="20" height="20" />','<img src="/static/emoji/xwbq042.png" width="20" height="20" />','<img src="/static/emoji/xwbq043.png" width="20" height="20" />','<img src="/static/emoji/xwbq044.png" width="20" height="20" />','<img src="/static/emoji/xwbq045.png" width="20" height="20" />','<img src="/static/emoji/xwbq046.png" width="20" height="20" />','<img src="/static/emoji/xwbq047.png" width="20" height="20" />','<img src="/static/emoji/xwbq048.png" width="20" height="20" />','<img src="/static/emoji/xwbq049.png" width="20" height="20" />','<img src="/static/emoji/xwbq050.png" width="20" height="20" />','<img src="/static/emoji/xwbq051.png" width="20" height="20" />','<img src="/static/emoji/xwbq052.png" width="20" height="20" />','<img src="/static/emoji/xwbq053.png" width="20" height="20" />','<img src="/static/emoji/xwbq054.png" width="20" height="20" />','<img src="/static/emoji/xwbq055.png" width="20" height="20" />','<img src="/static/emoji/xwbq057.png" width="20" height="20" />','<img src="/static/emoji/xwbq058.png" width="20" height="20" />','<img src="/static/emoji/xwbq059.png" width="20" height="20" />','<img src="/static/emoji/xwbq060.png" width="20" height="20" />','<img src="/static/emoji/xwbq061.png" width="20" height="20" />','<img src="/static/emoji/xwbq062.png" width="20" height="20" />','<img src="/static/emoji/xwbq063.png" width="20" height="20" />','<img src="/static/emoji/xwbq064.png" width="20" height="20" />','<img src="/static/emoji/xwbq065.png" width="20" height="20" />','<img src="/static/emoji/xwbq066.png" width="20" height="20" />','<img src="/static/emoji/xwbq067.png" width="20" height="20" />','<img src="/static/emoji/xwbq068.png" width="20" height="20" />','<img src="/static/emoji/xwbq069.png" width="20" height="20" />','<img src="/static/emoji/xwbq070.png" width="20" height="20" />','<img src="/static/emoji/xwbq071.png" width="20" height="20" />','<img src="/static/emoji/xwbq072.png" width="20" height="20" />','<img src="/static/emoji/xwbq073.png" width="20" height="20" />','<img src="/static/emoji/xwbq074.png" width="20" height="20" />','<img src="/static/emoji/xwbq075.png" width="20" height="20" />','<img src="/static/emoji/xwbq076.png" width="20" height="20" />','<img src="/static/emoji/xwbq077.png" width="20" height="20" />','<img src="/static/emoji/xwbq078.png" width="20" height="20" />','<img src="/static/emoji/xwbq079.png" width="20" height="20" />','<img src="/static/emoji/xwbq080.png" width="20" height="20" />','<img src="/static/emoji/xwbq081.png" width="20" height="20" />','<img src="/static/emoji/xwbq082.png" width="20" height="20" />','<img src="/static/emoji/xwbq083.png" width="20" height="20" />','<img src="/static/emoji/xwbq084.png" width="20" height="20" />','<img src="/static/emoji/xwbq085.png" width="20" height="20" />'];
		for(var i in EmojiKEY)
		{
			var e	=  txt.indexOf( EmojiKEY[i] );
			while(e > -1)
			{
				txt = txt.replace(EmojiKEY[i],EmojiValue[i]);
				e	= txt.indexOf( EmojiKEY[i] );
			}
		}
		delete EmojiKEY;
		delete EmojiValue;
		return txt;
	}

	//#内容窗口重置
	JW.ChatBoxInit	= function()
	{
		 $(".friend-list").height($(".main").height()-53);
	 	 $(".chat_area").height($(".main").height()-51);
	 	 $(".dialogue").height($(".chat_area").height()-138);
	 	 $('#'+JW.ini.ChatTook+' .face').bind("click",function(event)
	 	 {
			event.stopPropagation()
			var _x=$(this).offset().left, _y=$(this).offset().top;
			$("#face_list").show().css({
				top:function(){return _y - $(this).height() - 15},
				left:_x
			});
		});
	}
	//#播放音频
	JW.PlayAuido 		= function(me)
	{
		var jfile 	= $(me).attr("jfile");
		if(/\.amr$/.test(jfile))
		{
			jfile 	+= '.mp3';
		}
		var audio	= new Audio();
		audio.src	= jfile;
		audio.play();
	}

	/*
	* 渲染聊天内容
	*/
	JW.ChatRender 		= function(data,jid,typeid)
	{
		var rs 	= '';
		if(typeid == 0 && JW.ini.ChatList[jid].data.length > 0)
		{
			var list 	= JW.ini.ChatList[jid].data;
			for(var i in list)
			{
				var cls		= '';
				var dur		= '';
				var pic 	= '';
				var cli 	= '';
				//#音频
				if(list[i].contentype == 4)
				{
					cls 	= ' auido';
					cli 	= ' onClick="JWeb.PlayAuido(this)" ';
					if(list[i].content.duration > 0)
					{
						dur 	= '<em class="dur">'+list[i].content.duration+'</em>';
					}
				}
				//#图片
				if(list[i].contentype == 3 && list[i].content.thumb != '')
				{
					pic	= '<img src="'+list[i].content.thumb+'" border="0" />';
				}
				rs += '<div class="bubble'+(list[i].isself == '2' ? ' bubble_right' : '')+'" ctype="'+list[i].contentype+'" >\
							<div class="pic"><img src="'+JW.ini.ApiLogo+list[i].senderid+'"></div>\
							<div class="txt'+cls+'" jfile="'+list[i].content.file+'" '+cli+' >\
								<em class="arrow"></em>\
								'+dur+'\
								<div class="msg">'+ pic + (list[i].content.text != '' ? list[i].content.text : '&nbsp;') +'</div>\
							</div>\
						</div>';
			}
		}
		if(data.length > 0)
		{
			for(var ii in data)
			{
				var cls 	= '';//CLASS
				var dur 	= '';//时长
				var pic 	= '';//图片
				var cli 	= '';//点击
				//#音频
				if(data[ii].contentype == 4)
				{
					cls 	= ' auido';
					cli 	= ' onClick="JWeb.PlayAuido(this)" ';
					if(data[ii].content.duration > 0)
					{
						dur 	= '<em class="dur">'+data[ii].content.duration+'</em>';
					}
				}
				//#图片
				if(data[ii].contentype == 3 && data[ii].content.thumb != '')
				{
					pic	= '<img src="'+data[ii].content.thumb+'" border="0" />';
				}
				JW.ini.ChatList[jid].cursor	= data[ii].datetime > JW.ini.ChatList[jid].cursor ? data[ii].datetime : JW.ini.ChatList[jid].cursor;
				data[ii].content.text		= data[ii].content.text != '' ? JW.EMOJIReplace(data[ii].content.text) : '';
				data[ii].content.text 		= ioNull.emoji.parse(data[ii].content.text);
				JW.ini.ChatList[jid].data.push(data[ii]);
				rs += '<div class="bubble'+(data[ii].isself == '2' ? ' bubble_right' : '')+'" ctype="'+data[ii].contentype+'" >\
							<div class="pic"><img src="'+JW.ini.ApiLogo+data[ii].senderid+'"></div>\
							<div class="txt'+cls+'" '+cli+' jfile="'+data[ii].content.file+'" >\
								<em class="arrow"></em>\
								'+dur+'\
								<div class="msg">'+ pic + (data[ii].content.text != '' ? data[ii].content.text : '&nbsp;')+'</div>\
							</div>\
						</div>';
			}
		}
		$('#'+JW.ini.ChatContentbox).append(rs);
		var oh	= window.document.getElementById(JW.ini.ChatContentbox).scrollHeight;
		$('#'+JW.ini.ChatContentbox).scrollTop(oh);
		delete rs;
		delete data;

	}

	//#获取当前聊天信息rtype渲染类型
	JW.ListChatMsg		= function(rtype)
	{
		var type 		= $('#'+JW.ini.ChatContentbox).attr("typeid");//类型
		if(type)
		{
			var relationid	= $('#'+JW.ini.ChatContentbox).attr("relationid");//ID
			var jid			= type == 4 ? 'user_' + relationid : 'group_' + relationid;
			var cursor		= 1;
			if(!JW.ini.ChatList[jid])
			{
				JW.ini.ChatList[jid]	= {"cursor":JW.ini.NowTime,"data":[]};
			}
			else
			{
				cursor	= JW.ini.ChatList[jid].cursor;
			}
			$.ajax({
				url 	: JW.ini.ChatUrl,
				type 	: 'POST',
				data 	: {type:type,relationid:relationid,cursor:cursor},
				dataType: 'JSON',
				success : function(json)
				{
					JW.Auth(json);
					if(json.code == 0)
					{
						JW.ChatRender(json.data,jid,rtype);
					}
					else
					{
						JW.ShowTips(json.msg);
					}
					delete json;
				}
			});
		}
	}

	//#发送聊天消息
	JW.SendMessage		= function(me,event)
	{
		var content	= $(me).val();
		if(event.keyCode == 13 && content != '')
		{
			$(me).val('');
			var type 		= $('#'+JW.ini.ChatContentbox).attr("typeid");
			var relationid	= $('#'+JW.ini.ChatContentbox).attr("relationid");
			$.ajax({
				url 	: JW.ini.ChatSend,
				type 	: 'POST',
				data 	: {type:type,relationid:relationid,content:content},
				dataType: 'JSON',
				success : function(json)
				{
					if(json.code == 0)
					{
						JW.ListChatMsg(1);
					}
					else
					{
						JW.ShowTips(json.msg);
					}
					delete json;
				}
			});
		}

	}

	//#聊天详情
	JW.ChatDetail		= function(me)
	{
		var type 		= $(me).attr("typeid");//类型
		var relationid	= $(me).attr("relationid");//ID
		var chatname	= $(me).attr("relationname");//名称
		var rs			= '<div class="chat_target">'+chatname+'</div>';
		var jid			= 'user_' + relationid;
		var attr 		= ' typeid="'+type+'" relationid="'+relationid+'" ';
		if(type == 4)
		{//P2P
			rs	+= '<div class="chat_area cl nomembers" style="height: 167px;">\
						<div class="chat_area_left">\
							<div id="'+JW.ini.ChatContentbox+'" class="dialogue" '+attr+' ></div>\
							<div class="chat_tool" id="'+JW.ini.ChatTook+'"><a class="face"></a></div>\
							<div class="inputbox"><textarea id="sendbox" onKeyUp="JWeb.SendMessage(this,event)"></textarea></div>\
						</div>\
					</div>';
		}
		else
		{//群聊
			jid	= 'group_' + relationid;
			rs	+= '<div class="chat_area fl">\
						<div class="chat_area_left">\
							<div id="'+JW.ini.ChatContentbox+'" class="dialogue" '+attr+' ></div><a name="maodian"></a>\
							<div id="'+JW.ini.ChatTook+'" class="chat_tool"><a class="face"></a></div>\
							<div class="inputbox"><textarea id="sendbox" onKeyUp="JWeb.SendMessage(this,event)"></textarea></div>\
						</div>\
						<div class="chat_area_right">\
							<div id="'+JW.ini.GroupMemberBox+'" class="members">\
							</div>\
						</div>\
					</div>';
		}
		$('#'+JW.ini.ContentBox).html(rs);
		delete rs;
		//初始化窗口
		JW.ChatBoxInit();
		//添加群成员
		if(type == 5)
		{
			JW.GroupChatMember(relationid);
		}
		//获取聊天信息
		JW.ListChatMsg(0);
	}

	//#群成员获取
	JW.GroupChatMember	= function(id)
	{
		$.ajax({
			url		: JW.ini.GroupUserListUrl,
			type 	: 'POST',
			data 	: {id:id},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					if(json.data.list.length > 0)
					{
						var rs	= '<ul>';
						for(var i in json.data.list)
						{
							rs	+= '<li><div class="pic"><img src="'+JW.ini.ApiLogo+json.data.list[i].id+'"></div><div class="name">'+json.data.list[i].name+'</div></li>';
						}
						rs 	+= '</ul>';
						$('#'+JW.ini.GroupMemberBox).html(rs);
					}
				}
				else
				{
					JW.ShowTips(json.msg);
				}
				delete json;
			}
		});
	}

	//#渲染最近聊天列表
	JW.ChatListRender	= function(list)
	{
		var len 	= list.length;
		if(len > 0)
		{
			var rs			= '';
			var unread		= 0;
			var relationid	= $('#'+JW.ini.ChatContentbox).attr("relationid");//ID
			var typeid		= $('#'+JW.ini.ChatContentbox).attr("typeid");//ID
			for(var i in list)
			{
				var cls		= '';
				var src 	= JW.ini.ApiLogo+list[i].relationid;
				var click	= 'JWeb.ChatDetail(this)';
				unread 		= unread + parseInt(list[i].unreadnum);
				if(parseInt(list[i].unreadnum) > 0 && typeid == list[i].type && relationid == list[i].relationid && $('#'+JW.ini.ChatUnreadBox).parent().hasClass("hover"))
				{
					JW.ListChatMsg(1);
					unread = unread - parseInt(list[i].unreadnum);
				}
				if(list[i].type == 5)
				{
					cls 	= ' gr-item';
					src 	= JW.ini.GroupLogo;
				}
				rs += '<div class="fr-item'+cls+'" onClick="'+click+'" typeid="'+list[i].type+'" relationid="'+list[i].relationid+'" relationname="'+list[i].relationname+'" >\
							<div class="pic"><img src="'+src+'" border="0" alt=""></div>\
							<div class="txt"><b>'+list[i].relationname+'</b></div>\
						</div>';
			}
			if($('#'+JW.ini.ChatUnreadBox).parent().hasClass("hover"))
			{
				$('#'+JW.ini.FriendBox).html(rs);
			}
			var str 	= unread > 0 ? unread > 99 ? '99+' : ('&nbsp;'+unread+'&nbsp;') : '';
			$('#'+JW.ini.ChatUnreadBox).html(str);
			delete str;
		}
		delete list;
	}
	
	//#最近聊天
	JW.ChatList			= function(me)
	{
		JW.LeftMenu(me);
		$.ajax({
			url		: JW.ini.NearChatUrl,
			type 	: 'POST',
			data 	: {submit:1},
			dataType: 'JSON',
			success : function(json)
			{
				if(json.code == 0)
				{
					JW.ChatListRender(json.data);
					setTimeout(function(){
						JW.ChatList();
					},4000);
				}
				else
				{
					JW.ShowTips(json.msg);
				}
				delete json;
			}
		});
	}

	//#渲染用户列表
	JW.UserRender		= function()
	{
		var len 	= JW.ini.UserList.length;
		if(len > 0)
		{
			var rs		= '';
			var list 	= JW.ini.UserList;
			for(var i in list)
			{
				rs		+= '<dl><dt onClick="JWeb.FirstMenu(this)"><em></em><span>'+list[i].name+'</span></dt>';
				var len1	= list[i].data.length;
				if( len1 > 0 )
				{
					for(var ii in list[i].data)
					{
						rs 	+= '<dd><h3 onClick="JWeb.SecondMenu(this)">'+list[i].data[ii].name+'<em></em></h3>';
						var len2 	= list[i].data[ii].data.length;
						if( len2 > 0 )
						{
							for(var iii in list[i].data[ii].data)
							{
								rs 	+= '<div class="fr-item" userid="'+list[i].data[ii].data[iii].id+'" onClick="JWeb.UserDetail(this)" >\
											<div class="pic"><img src="'+JW.ini.ApiLogo+list[i].data[ii].data[iii].id+'" border="0" alt=""></div>\
											<div class="txt"><b>'+list[i].data[ii].data[iii].name+'</b>'+list[i].data[ii].data[iii].position+'</div>\
										</div>';
							}
						}
						rs	+= '</dd>';
					}
				}
				rs	+= '</dl>';
			}
			$('#'+JW.ini.FriendBox).html(rs);
			delete list;
			delete rs;
		}
	}

	//#获取用户列表
	JW.UserList		= function(me)
	{
		JW.LeftMenu(me);
		var len 	= JW.ini.UserList.length;
		if(len > 0)
		{
			JW.UserRender();
			return '';
		}
		$.ajax({
			url		: JW.ini.UserListUrl,
			type 	: 'POST',
			data 	: {},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					JW.ini.UserList	= json.data;
					JW.UserRender();
				}
				delete json;
			}
		});
	}

	//#用户详情渲染
	JW.UserDetailRender	= function(data)
	{
		var	rs 	= '<div class="group_info">'
		if(typeof(data) == 'object')
		{
			rs 	+= '<div class="members_info">\
						<div class="ava"><img src="'+JW.ini.ApiLogo+data.id+'"><h3>'+data.name+'</h3></div>\
						<div class="text">\
							<p><span>性别：</span>'+(data.sex > 0 ? data.sex > 1 ? '女' : '男' : '未知')+'</p>\
							<p><span>ID:</span>'+data.id+'</p>\
							<p><span>部位：</span>'+data.departmenttwo+'</p>\
							<p><span>职位：</span>'+data.position+'</p>\
						</div>\
						</div>\
					<div class="btns" typeid="4" relationid="'+data.id+'" relationname="'+data.name+'" onClick="JWeb.ChatDetail(this)" ><a href="javascript:;">发起会话</a></div>';
		}
		rs 	+= '</div>';
		$('#'+JW.ini.ContentBox).html(rs);
		delete rs;
		delete data;
	}

	//#用户详情
	JW.UserDetail		= function(me)
	{
		var userid 	= $(me).attr("userid");
		$.ajax({
			url		: JW.ini.UserDetail,
			type 	: 'POST',
			data 	: {userid:userid},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					JW.UserDetailRender(json.data);
					
				}
				delete json;
			}
		});	
	}

	//#渲染搜索
	JW.SearchRender		= function(rs)
	{
		var str 	= '<dl class="search-list">';
		var len1	= rs.userInfo.length;
		var len2	= rs.groupInfo.length;
		if( len1 > 0)
		{
			str 	+= '<dd><h3>通讯录<em></em></h3>';
			for(var i in rs.userInfo)
			{
				str += '<div class="fr-item" userid="'+rs.userInfo[i].id+'" >\
							<div class="pic"><img src="'+JW.ini.ApiLogo+rs.userInfo[i].id+'" border="0" alt=""></div>\
							<div class="txt"><b>'+rs.userInfo[i].name+'</b>'+rs.userInfo[i].position+'</div>\
						</div>';
			}
			str		+= '</dd>';
		}
		if( len2 > 0)
		{
			str 	+= '<dd><h3>群组<em></em></h3>';
			for(var ii in rs.groupInfo)
			{
				str += '<div class="fr-item" groupid="'+rs.groupInfo[ii].groupId+'" >\
							<div class="pic"><img src="'+JW.ini.GroupLogo+'" border="0" alt=""></div>\
							<div class="txt"><b>'+rs.groupInfo[ii].groupName+'</b>Android开发</div>\
						</div>';
			}
			str		+= '</dd>';
		}
		str += '</dl>';
		$('#'+JW.ini.FriendBox).html(str);
		delete rs;
		delete str;
	}

	//#搜索
	JW.SearchGroup		= function()
	{
		var keyword	= $('#jsval_search_input').val();
		if(keyword == '')
		{
			JW.ShowTips('请输入关键字');
			return false;
		}
		$.ajax({
			url		: JW.ini.SearchUrl,
			type 	: 'POST',
			data 	: {keyword:keyword},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					JW.SearchRender( json.data );
				}
				delete(json);
			}
		});
	}

	//#渲染群组
	JW.GroupRender	= function()
	{
		var len = JW.ini.GroupList.length;
		var rs 	= '';
		if(len > 0)
		{
			for(var i in JW.ini.GroupList)
			{
				rs 	+= '<div class="fr-item gr-item" groupid="'+JW.ini.GroupList[i].id+'" groupname="'+JW.ini.GroupList[i].name+'" onClick="JWeb.GroupUserList(this)" >\
							<div class="pic"><img src="'+JW.ini.GroupLogo+'" border="0" alt=""></div>\
							<div class="txt"><b>'+JW.ini.GroupList[i].name+'</b></div>\
						</div>';
			}
			$('#'+JW.ini.FriendBox).html(rs);
		}
	}

	//#获取群列表
	JW.GroupList	= function(me)
	{
		JW.LeftMenu(me);
		/*
		var len = JW.ini.GroupList.length;
		if( len > 0)
		{
			JW.GroupRender();
			return '';
		}
		*/
		$.ajax({
			url		: JW.ini.GroupUrl,
			type 	: 'POST',
			data 	: {submit:1},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					JW.ini.GroupList	= json.data;
					JW.GroupRender();
				}
			}
		});
	}

	//#群成员渲染
	JW.GroupUserListRender	= function(id,name,data)
	{
		var rs 	= '<div class="group_info">\
					<div class="title"><div class="group_name">'+name+'</div><div class="group_icon"><img src="'+JW.ini.GroupLogo+'"></div></div>\
					<div class="group_members">\
					<table>\
					<tbody><tr>\
						<th>姓名</th>\
						<th>性别</th>\
						<th>部门</th>\
						<th>职位</th>\
					</tr>';
		var len	= data.list.length;
		if(len)
		{
			for(var i in data.list)
			{
				rs	+= '<tr userid="'+data.list[i].id+'">\
							<td>'+data.list[i].name+'</td>\
							<td>'+(data.list[i].sex > 0 ? data.list[i].sex == 1 ? '男' : '女' : '未知')+'</td>\
							<td>'+data.list[i].departtwo+'</td>\
							<td>'+data.list[i].position+'</td>\
						</tr>';
			}
		}
		rs 	+= '</tbody></table>\
					</div>\
				<div class="btns" typeid="5" relationid="'+id+'" relationname="'+name+'" onClick="JWeb.ChatDetail(this)" ><a href="javascript:;">发起会话</a></div>\
				</div>';
		$('#'+JW.ini.ContentBox).html(rs);
		delete(data);
	}

	//#群成员列表
	JW.GroupUserList	= function(me)
	{
		var id 		= $(me).attr("groupid");
		var name 	= $(me).attr("groupname");
		$.ajax({
			url		: JW.ini.GroupUserListUrl,
			type 	: 'POST',
			data 	: {id:id},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					JW.GroupUserListRender(id,name,json.data);
				}
				else
				{
					JW.ShowTips(json.msg);
				}
				delete(json);
			}
		});
	}

	//#弹层分类点击
	JW.GroupFirstMenu	= function(me)
	{
		if( $(me).find("ul").length > 0 )
		{
			$(me).find("ul").toggle();
		}
	}

	//添加群成员
	JW.GroupUserAdd		= function(me)
	{
		var i 		= $(me).parent().attr("deptone");
		var ii 		= $(me).parent().attr("depttwo");
		var iii		= $(me).parent().attr("deptthree");
		var userid 	= $(me).parent().attr("userid");
		var c 		= $(me).attr("checked");
		var myclass	= JW.ini.MaskGroupAddUsetTr+userid;
		$('#'+JW.ini.MaskGroupAddUser).find('.'+myclass).remove();
		
		if(!c)
		{
			
			JW.ini.AddGroupUser[userid]	= 0;
			return '';
		}
		var user	= JW.ini.UserList[i].data[ii].data[iii];
		if(user)
		{
			var rs 	= '<tr class="'+JW.ini.MaskGroupAddUsetTr+user.id+'" deptone="'+i+'" depttwo="'+ii+'" deptthree="'+iii+'" >\
						<td> <img src="'+JW.ini.ApiLogo+user.id+'" />'+user.name+'</td>\
						<td>'+user.depttwo+'</td>\
						<td>'+user.position+'</td>\
					</tr>';
			$('#'+JW.ini.MaskGroupAddUser).append(rs);
			JW.ini.AddGroupUser[userid]	= 1;
		}		
	}

	//#群组全选
	JW.GroupSelectAll 	= function(me)
	{
		var c 	= false;
		var n 	= 0;
		if($(me).attr("checked"))
		{
			c 	= true;
			n 	= 1;
		}
		$('#'+JW.ini.MaskGroupUserBox).find("li").each(function(){
			var uid 	= $(this).attr("userid");
			var i 		= $(this).attr("deptone");
			var ii 		= $(this).attr("depttwo");
			var iii		= $(this).attr("deptthree");
			var user	= JW.ini.UserList[i].data[ii].data[iii];
			var myclass	= JW.ini.MaskGroupAddUsetTr+uid;
			$('#'+JW.ini.MaskGroupAddUser).find('.'+myclass).remove();
			$(this).find('.'+JW.ini.MaskGroupUser).attr("checked",c);
			JW.ini.AddGroupUser[uid]	= n;
			if(user && c)
			{
				var rs 	= '<tr class="'+JW.ini.MaskGroupAddUsetTr+uid+'" deptone="'+i+'" depttwo="'+ii+'" deptthree="'+iii+'" >\
							<td> <img src="'+JW.ini.ApiLogo+user.id+'" />'+user.name+'</td>\
							<td>'+user.depttwo+'</td>\
							<td>'+user.position+'</td>\
						</tr>';
				$('#'+JW.ini.MaskGroupAddUser).append(rs);
			}
		});
	}

	//#加载人员
	JW.GroupSecondMenu	= function(me,event)
	{
		event.stopPropagation();
		var i 		= $(me).attr("deptone");
		var ii 		= $(me).attr("depttwo");
		var list	= JW.ini.UserList[i].data[ii].data;
		var len 	= list.length;
		var rs 		= '';
		if(len > 0)
		{
			rs 	+= '<label><input type="checkbox" class="checkall" onClick="JWeb.GroupSelectAll(this)" />全选</label>\
					<ul id="jsval_MaskUserBox" class="hx">';
			for(var iii in list)
			{
				rs += '<li userid="'+list[iii].id+'" deptone="'+i+'" depttwo="'+ii+'" deptthree="'+iii+'" >\
							<input type="checkbox" class="'+JW.ini.MaskGroupUser+'" '+(JW.ini.AddGroupUser[list[iii].id] == 1 ? 'checked="checked"' : '' )+' onClick="JWeb.GroupUserAdd(this)" />\
							<img src="'+JW.ini.ApiLogo+list[iii].id+'" />'+list[iii].name+'\
						</li>';
			}
			rs += '</ul>';
		}
		$('#'+JW.ini.MaskGroupUserBox).html(rs);
	}


	//#渲染群组蒙层
	JW.GroupMaskRender	= function()
	{		
		var len	= JW.ini.UserList.length;
		var rs	= '<ul>';
		if(len)
		{
			list	= JW.ini.UserList;
			for(var i in list)
			{
				if(list[i].data.length > 0)
				{
					rs 	+= '<li onClick="JWeb.GroupFirstMenu(this)"><b>'+list[i].name+'</b><ul>';
					for(var ii in list[i].data)
					{
						if(list[i].data[ii].data.length > 0)
						{
							rs += '<li deptone="'+i+'" depttwo="'+ii+'" onClick="JWeb.GroupSecondMenu(this,event)">'+list[i].data[ii].name+'</li>';
						}
					}
					rs 	+= '</ul></li>';
				}
			}
		}
		rs 		+= '</ul>';
		$('#'+JW.ini.MaskGroupBox).html(rs);
	}

	//#展示创建群组蒙层
	JW.ShowGroupMask	= function()
	{
		var dialog	=$("#pop_add_member").xwDialog();
		dialog.insertBtn("好","confirm",function(){
			JW.CreateGroup(dialog);
		});
		dialog.insertBtn("取消","",dialog.hide);

		var len = JW.ini.UserList.length;
		if( len > 0)
		{
			JW.GroupMaskRender();
			return '';
		}
		$.ajax({
			url		: JW.ini.UserListUrl,
			type 	: 'POST',
			data 	: {submit:1},
			dataType: 'json',
			success : function(json)
			{
				JW.Auth(json);
				if(json.code == 0)
				{
					JW.ini.UserList	= json.data;
					JW.GroupMaskRender();
				}
				else
				{
					JW.ShowTips(json.msg);
				}
				delete(json);
			}
		});

	}

	//#创建群组
	JW.CreateGroup		= function(obj)
	{
		var userids 	= new Array();
		for(var u in JW.ini.AddGroupUser)
		{
			if(JW.ini.AddGroupUser[u] > 0)
			{
				userids.push(u);
			}
		}
		var len	= userids.length;
		if(len < 1)
		{
			JW.ShowTips('请添加群组成员');
			return false;
		}
		var nameArr 	= new Array();
		var num 	= len > 1 ? len > 2 ? 3 : 2 : 1;
		for(var n = 0; n < num; n++)
		{
			var mytr 	= $('#'+JW.ini.MaskGroupAddUser).find("tbody tr").eq(n);
			var i = mytr.attr("deptone");
			var ii = mytr.attr("depttwo");
			var iii = mytr.attr("deptthree");
			nameArr.push(JW.ini.UserList[i].data[ii].data[iii].name);
		}
		var name 	= nameArr.join(',');
		var userid 	= userids.join(',');
		$.ajax({
			url 	: JW.ini.GroupAddUrl,
			type 	: 'POST',
			data 	: {submit:1,userid:userid,name:name},
			dataType: 'JSON',
			success	: function(json)
			{
				obj.hide();
				if(json.code == 0)
				{
					JW.ShowTips('创建成功');
				}
				else
				{
					JW.ShowTips(json.msg);
				}	
				delete(json);
			}
		});
	}

	window.JWeb 	= JW;
})(window.JWeb || {} ,jQuery );
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
			href="ext/resources/css/ext-all.css" />
		<!-- GC -->
		<!-- LIBS -->
		<script type="text/javascript" src="ext/adapter/ext/ext-base.js">
	
</script>
		<!-- ENDLIBS -->
		<script type="text/javascript" src="ext/ext-all.js">
	
</script>

		<script type="text/javascript" src="ext/ext-lang-zh_CN.js">
	
</script>
<style type="text/css">
html,body {
	font: normal 12px verdana;
	margin: 0;
	padding: 0;
	border: 0 none;
	overflow: hidden;
	height: 100%;
}

.empty .x-panel-body {
	padding-top: 0;
	text-align: center;
	font-style: italic;
	color: gray;
	font-size: 11px;
}

.x-btn button {
	font-size: 14px;
}

.x-panel-header {
	font-size: 14px;
}
</style>
<script type="text/javascript">
        Ext.onReady(function () {
            //定义树形组件
            Ext.create('Ext.tree.Panel', {
                title: '简单的树形组件',
                width: 200,
                //数据容器
                store: Ext.create('Ext.data.TreeStore', {
                    //根节点
                    root: {
                        //是否展开
                        expanded: true,
                        children: [
                            //leaf属性标明是是否是根节点，如果是，必须指明
                            {text: "我的树1", leaf: true },
                            //child属性标明是此节点下面有子节点
                            { text: "我的树2", expanded: true,
                                children: [
                            { text: "我的树2.1", leaf: true },
                            { text: "我的树2.2", leaf: true }
                            ]
                            },
                            { text: "我的树3", leaf: true }
                            ]
                    }
                }),
                //是否显示根节点
                rootVisible: false,
                renderTo: 'myTree'
            });
        });
    </script>
</head>
<body>

</body>
</html>
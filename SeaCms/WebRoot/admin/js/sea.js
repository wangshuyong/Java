jQuery(document).ready(function () { 
    var oTable = $('#userlist').dataTable({
	"aLengthMenu": [
		[5, 10,15, 20, -1],
		[5, 10, 15, 20, "All"] // change per page values here
	],
	"oLanguage" : { // 汉化	
	"sProcessing" : "正在加载数据...",				
	"sLengthMenu" : "每页显示_MENU_条 ",				
	"sZeroRecords" : "没有您要搜索的内容",				
	"sInfo" : "显示_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",	
	"sInfoEmpty" : "记录数为0",
	"sInfoFiltered" : "(全部记录数 _MAX_条)",				
	"sInfoPostFix" : "",
	"sSearch" : "搜索",
	"sUrl" : "",				
	"oPaginate" : {	
		"sFirst" : "第一页",
		"sPrevious" : " 上一页 ",	
		"sNext" : " 下一页 ",
		"sLast" : " 最后一页 "	
	   }			
   },	
	
	// set the initial value
	"iDisplayLength": 5,
	"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"sPaginationType" : "full_numbers", // 分页，一共两种样式 另一种为two_button // 是datatables默认	
	"bProcessing" : false,
	"bServerSide" : true,
	"bDestroy": true,
	"bJQueryUI": true,			
	"bPaginate" : true,// 分页按钮			
	"bFilter" : true,// 搜索栏			
//    	"bLengthChange" : false,// 每行显示记录数
	"iDisplayStart":0,
	"sAjaxSource": 'admin/User_list', 
	"bRetrieve":true,	
	"bStateSave": true,	
	"fnServerData" : function (sSource, aoData, fnCallback) {
//    		  var jsonParam = JSON.stringify(aoData);
		$.ajax({
			"type" : 'get',
			"contentType": "application/json",
			"url" : sSource,
			"dataType" : "json",
			"data" : {aoData :JSON.stringify(aoData)},
			"success" : function(resp) {
				var member = eval("("+resp+")");
				fnCallback(member);
			}
		});
	},
	"aoColumns":[
	{"mDataProp": null, "sWidth": "5%", "sDefaultContent": "<input type='checkbox' id='checkBox' class='checkboxes' value='1'></input>", "bSortable": false },
	{ mDataProp: "id", sWidth : "5%","sClass":"center","bVisible": false},
	{ mDataProp: "phone",  "sClass":"center",},
	{ mDataProp: "realName", "sClass":"center",},
	{ mDataProp: "age", "sClass":"center" ,},
	{ mDataProp: "sex", "sClass":"center",},
	{ mDataProp: "email",  "sClass":"center",},
	{ mDataProp: "address", "sClass":"center",},
	{ mDataProp: "power",  "sClass":"center",},
	{mDataProp: null, "sDefaultContent": "<a id='edituser' >编辑</a>" ,"bSortable": false }
	]
});
	/**  
	,"aoColumnDefs": [{ "bVisible": false, "aTargets": [0] }]
		{mDataProp: null, "sDefaultContent": "<a id='edituser' href='../admin/User_edit?userId=$('#userlist').find('tr > td:first-child input:checkbox').val()'>编辑</a>" ,"bSortable": false }
		
	"fnRowCallback" : function(nRow, aData, iDisplayIndex) {  
			if (aData.power == '1')  
				$('td:eq(7)', nRow).html('管理员');  
			if (aData.power == '0')  
				$('td:eq(7)', nRow).html('一般用户');  
			if (aData.sex == '1')  
				$('td:eq(4)', nRow).html('女');  
			if (aData.sex == '0')  
				$('td:eq(4)', nRow).html('男'); 
		  
			return nRow;  
	 }, 

     //对行单击添加监听事件
     $('#userlist tbody').on('click', 'tr', function () {
         var tr = $(this).closest('tr');
         var checkbox = tr.find('td:first-child input:checkbox')[0];
         checkbox.checked = !checkbox.checked;
     });

	
 });
	
**/
	
	//编辑行数据
	var nEditing = null;
	//$('#userlist a#edituser').live('click', function (e) {
	$('#userlist a#edituser').live('click', function (e) {
		e.preventDefault();

		/* Get the row as a parent of the link that was clicked on */
		var nRow = $(this).parents('tr')[0];
		if (nEditing !== null && nEditing != nRow) {
			/* Currently editing - but not this row - restore the old before continuing to edit mode */
			restoreRow(oTable, nEditing);
			editRow(oTable, nRow);
			nEditing = nRow;
		} else {
			/* No edit in progress - let's start one */
			editRow(oTable, nRow);
			nEditing = nRow;
		}
	});
	
	$('#userlist a#cancel').live('click', function (e) {
		e.preventDefault();
		if ($(this).attr("id") == "cancel") {
			var nRow = $(this).parents('tr')[0];
			cancelEditRow(oTable, nRow)
		} else {
			restoreRow(oTable, nEditing);
			nEditing = null;
		}
	});
	
	$('#userlist a#save').live('click', function (e) {
		e.preventDefault();
		if ($(this).attr("id") == "save") {
			var nRow = $(this).parents('tr')[0];
			saveRow(oTable, nRow)
		} else {
			restoreRow(oTable, nEditing);
			nEditing = null;
		}
	});
	
	$("#del").click(function(){
		var ids="";
         $('#userlist').find('tr > td:first-child input:checkbox').each(function () {
			 if (this.checked) {
				 var nRow = $(this).parents('tr')[0];
				 var aData = oTable.fnGetData(nRow);
				 ids+=aData.id+",";	
			 }
          });
         //如果没有勾选，提示
         if (ids === "") {
             alert("请选择一行数据！");
             return;
         } else {
			 if (confirm("确认删除所选记录？删除后无法恢复，您确认？？？") == false) {
                    return;
                }     
			$.get("../admin/User_delete",{userId:ids},function(){oTable.fnDraw();alert("删除成功！");}); 	
         }
	});
	
//双击删除行数据
     $("#userlist tbody").dblclick(function(event) { //当点击表格内某一条记录的时候，会将此记录的cId和cName写入到隐藏域中
		$(event.target.parentNode).addClass('row_selected');
		var aData = oTable.fnGetData(event.target.parentNode);
		if(aData !=null){
			if (confirm("确认删除所选记录？删除后无法恢复，您确认？？？") == false) {
                    return;
            }
		}
		$.get("../admin/User_delete",{userId:JSON.stringify(aData.id)},function(){oTable.fnDraw();alert("删除成功！");
		});
	});
		
	function editRow(oTable, nRow) {
		var aData = oTable.fnGetData(nRow);
		var jqTds = $('>td', nRow);
		//jqTds[0].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.id + '">';
		jqTds[1].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.phone + '">';
		jqTds[2].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.realName + '">';
		jqTds[3].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.age + '">';
		jqTds[4].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.sex + '">';
		jqTds[5].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.email + '">';
		jqTds[6].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.address + '">';
		jqTds[7].innerHTML = '<input type="text" class="m-wrap small" value="' + aData.power + '">';
		jqTds[8].innerHTML = '<a id="save" href="">保存</a>  <a id="cancel" href="">取消</a>';
	}

	function saveRow(oTable, nRow) {
		var jqInputs = $('input', nRow);
		var aData = oTable.fnGetData(nRow);
		var user = {"user.id":aData.id,"user.phone":jqInputs[1].value,"user.realName":jqInputs[2].value,"user.age":jqInputs[3].value,"user.sex":jqInputs[4].value,"user.email":jqInputs[5].value,"user.address":jqInputs[6].value,"user.power":jqInputs[7].value};
		$.get("../admin/User_edit",user,function(){oTable.fnDraw();alert("修改成功！");});	
	}

	function cancelEditRow(oTable, nRow) {
//		restoreRow(oTable, nEditing);
        nEditing = null;
		oTable.fnDraw();
	}
	
	function restoreRow(oTable, nRow) {
		var aData = oTable.fnGetData(nRow);
		var jqTds = $('>td', nRow);
		for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
			oTable.fnUpdate(aData[i], nRow, i, false);
		}
		oTable.fnDraw();
	}
	$(function(){
		 $('#dropdown-import').on('click', function(e) {
		e.preventDefault();
		$(this).closest('input[type=file]').trigger('click');
		})
	})
	
	$(document).on('click', 'th input:checkbox', function() {
	 var that = this;
	 $(this).closest('table').find('tr > td:first-child input:checkbox')
		 .each(function() {
			 this.checked = that.checked;
	  });
	});
	
	$('#dropdown-import').on('click', function(e) {
    e.preventDefault();
    $('#importFile').trigger('click');
	
	$('#importFile').change(function(e) { 
		
		$("#loading")
			.ajaxStart(function(){
				$(this).show();
			})//开始上传文件时显示一个图片
			.ajaxComplete(function(){
				$(this).hide();
			});//文件上传完成将图片隐藏起来
			
			$.ajaxFileUpload
			({
				url:'../admin/userImport',//用于文件上传的服务器端请求地址
				secureuri:false,//一般设置为false
				fileElementId:'importFile',//文件上传空间的id属性  <input type="file" id="file" name="file" />
				dataType: 'json',//返回值类型 一般设置为json
				success: function (data, status)  //服务器成功响应处理函数
				{
					//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
					alert(data.message);
					oTable.fnDraw();
				},
				error: function (data, status, e)//服务器响应失败处理函数
				{
					alert(e);
				}
			})
       })
	})
});
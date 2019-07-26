<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'special.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui/css/layui.css" media="all">
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="layui/layui.js" ></script>
  </head>
  
 <style>
		#box{
			font-family: "微软雅黑";
			font-size: 16px;
		}table tr td{
			border-bottom: 1px #F5F5F5 solid;
		}tr{
			height: 40px;
		}
	</style>
	<body>
		<div id="box" style="width: 90%;">
		
				<div id="top" style="background-color:#EAEEF1;height: 40px;font-size: 26px;">
					<div style="float: left;">
						<a href="pages/wh/w-1.jsp"><img src="images/wh/w-cantai1.png"></a>
					</div>|时段
					<div style="float: right;">
						<input id="Button1" type="button" value="导出EXCEL"  onclick="javascript:method1('ta')" style="font-size:16px;" />
					</div>
				</div>
				
				<div id="addpaihao" style="display:none;width: 400px;height: 350px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
							<div style="float: left;margin-left: 10px;">新增时段</div>
							<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 10px;clear: both;margin-left: 50px;">
							
									<td>时段名称:</td><br/>
									<td><input type="text" style="height:30px;width:200px;" id="name1"></td>
									<span id="ae1"></span><br/>
									
									<td>开始时间:</td>
									<td><input type="text" class="layui-input" id="test1" style="width:200px"></td>
									<span id="ae2"></span><br/>
									
									<td>结束时间:</td>
									<td><input type="text" class="layui-input" id="test2" style="width:200px"></td>
									<span id="ae3">1111</span><br/>
							<div style="margin-top: 10px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i1"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="editpaihao" style="display:none;width: 400px;height: 350px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
						<div style="float: left;margin-left: 10px;">编辑时段</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 10px;clear: both;margin-left: 50px;">
							
									<td>时段名称:</td><br/>
									<td><input type="text" style="height:30px;width:200px" id="name2"></td>
									<span id="ee1"></span><br/>
									
									
									<td>开始时间:</td>
									<td><input type="text" class="layui-input" id="test3" style="width:200px"></td>
									<span id="ee2"></span><br/>
									
									<td>结束时间:</td>
									<td><input type="text" class="layui-input" id="test4" style="width:200px"></td>
									<span id="ee3"></span><br/><br/>
							<div style="margin-top: 10px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i3"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="deletepaihao" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
						<div style="float: left;margin-left: 40px;">提醒</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">确定删除？</div>
					<div>
					<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;margin-left:40px;cursor: pointer;" id="i5"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;" id="i6"><input type="image" src="images/wh/w-quxiao.png"></div>
					</div>
					</div>
				</div>
				
				<div id="middle" style="clear: both;margin-left:10px;">
				
					<div id="right" style="float: left;background-color: white;width:1000px">
						<div style="height: 30px;float: left;">退菜理由</div>
						<div style="float: right;"></div>
						<div style="clear: both;background-color: #F5F5F5;">
							<div style="float: left;cursor: pointer;" class="add"><img src="images/wh/w-time1.png"></div>
							<div style="float: left;cursor: pointer;" class="edit"><img src="images/wh/w-time2.png"></div>
							<div style="float: left;cursor: pointer;" class="delete"><img src="images/wh/w-time3.png"></div>
							<div style="float: right;"></div>
						</div>
						<div id="showInfo"  style="clear: both;width: 1000px;">
							<table cellpadding="0" cellspacing="0" width="1000px" id="ta">
								<tr style="background-color: lightgray;height: 40px;cursor: default;">
									<td width="50">编号</td>
									<td width="100">理由</td>
									<td width="100">开始时段</td>
									<td width="100">结束时段</td>
								</tr>
								<c:forEach items="${time }" var="t">
								<tr class="ccc">
									<td width="50">${t.id }</td>
									<td width="100">${t.name }</td>
									<td width="100">${t.starttime }</td>
									<td width="100">${t.endtime }</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			
		</div>
	</body>
	<script>
		$(function(){
		
			layui.use('laydate', function(){
 		 var laydate = layui.laydate;
		  
		  //时间选择器
		laydate.render({ 
		  elem: '#test1'
		  ,type: 'time'
		});
		});
		layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  
		  //时间选择器
		laydate.render({ 
		  elem: '#test2'
		  ,type: 'time'
		});
		});
		layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  
		  //时间选择器
		laydate.render({ 
		  elem: '#test3'
		  ,type: 'time'
		});
		});
		layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  
		  //时间选择器
		laydate.render({ 
		  elem: '#test4'
		  ,type: 'time'
		});
		});
			$(".cha").click(function(){
				$(this).parent().parent().css("display","none");
			});
			$(".quxiao").click(function(){
				$(this).parent().parent().parent().css("display","none");
			});
			/* $(".all").click(function(){
				$(this).css("background-color","darkgrey");
				$(this).siblings().css("background-color","#F5F5F5");
			}); */
			$(".ccc").live('click',function(){
					$(this).css({"background":"gold"}).attr("id","select");
					$(".ccc").not(this).css({"background":"white"}).attr("id","");
				});
			//添加光标的验证
			$("#name1").blur(function(){
				var name=$(this).val();
				//alert(name);
				if(name==""){
					$("#ae1").html("请输入名称");
					$("#i1").attr("disabled","disabled");
				}else{
					$.ajax({
						method:"get",//请求方式
	  					url:"time/findName.do",//请求地址
	  					dataType:"html",
	  					data:{"name":name},
	  					success:function(result){
	  						if(result=="111"){
	  							$("#ae1").html("名称已存在");
	  							$("#i1 input").attr("disabled","disabled");
	  						}else{
	  							$("#ae1").html("");
	  							$("#i1 input").attr("disabled",false);
	  						}
	  					}
				});
				}
				
			});
			//编辑光标的验证
			$("#name2").blur(function(){
				var s=true;
				var name=$(this).val().trim();
				//alert(name);
				if(name==""){
					$("#ee1").html("请输入名称");
					$("#i3").attr("disabled","disabled");
				}else{
					$(".ccc").each(function(){
						if($(this).attr("id")=="select"){
							s=false;					
							return;
						}
					});
					if(!s){
					//alert(1);
					$.ajax({
						method:"get",//请求方式
	  					url:"time/findName.do",//请求地址
	  					dataType:"html",
	  					data:{"name":name},
	  					success:function(result){
	  						if(result=="111"){
	  							$("#ee1").html("名称已存在");
	  							$("#i3 input").attr("disabled","disabled");
	  						}else{
	  							$("#ee1").html("");
	  							$("#i3 input").attr("disabled",false);
	  						}
	  					}
				});
				}
				}
			});
			//添加时段的点击事件
			$("#i1").click(function(){
				var c=true;
  				var ad1=$("#name1").val();
  				var ad2=$("#test1").val();
  				var ad3=$("#test2").val();
  				var ae1=$("#ae1").html();
  				var ae2=$("#ae2").html();
  				var ae3=$("#ae3").html();
  				//alert(1);
  				if(ad1==""){
  					$("#ae1").html("请输入名称");
  					c=false;
  					return;
  				}else if(ad2==""){
  					$("#ae1").html("");
  					$("#ae2").html("请选择时间");
  					c=false;
  					return;
  				}else if(ad3==""){
  				//alert(1);
  					$("#ae1").html("");
  					$("#ae2").html("");
  					$("#ae3").html("请选择时间");
  					c=false;
  					return;
  				}else{
  					$("#ae1").html("");
  					$("#ae2").html("");
  					$("#ae3").html("");
  				}
				//alert(ad1+"++"+ad2+"+++"+ad3+"++"+ae1+"++"+ae2+"++"+ae3);
				/* var test1=/^[\u4e00-\u9fa5]+$/; 
				if(!test1.test(ad1)){
					c=false;
					$("#ae1").html("请输入中文");
				} */
				if(c){
					$.ajax({
						method:"get",//请求方式
	  					url:"time/addTime.do",//请求地址
	  					dataType:"html",
	  					data:{"name":ad1,"starttime":ad2,"endtime":ad3},
	  					success:function(result){
	  						if(result=="111"){
	  						window.location.href="time/findAll.do";
	  						}else{
	  							alert("添加失败");
	  						}
	  					}
					});
				}
			});
			
			//编辑要求
			$("#i3").click(function(){
				var c=true;
				var s=true;
  				var ad1=$("#name2").val();
  				var ad2=$("#test3").val();
  				var ad3=$("#test4").val();
  				var ae1=$("#ee1").html();
  				var ae2=$("#ee2").html();
  				var ae3=$("#ee3").html();
				$(".ccc").each(function(){
						if($(this).attr("id")=="select"){
							d=$(this).find("td:eq(0)").html();//id
							//alert(d+ad1);
							s=false;					
							return;
						}
				});
				if(s){
					alert("请选择要编辑的菜单");
					$("#editpaihao").css("display","none");
				}
				if(ad1==""){
  					$("#ee1").html("请输入名称");
  					c=false;
  					return;
  				}else if(ad2==""){
  					$("#ee1").html("");
  					$("#ee2").html("请选择时间");
  					c=false;
  					return;
  				}else if(ad3==""){
  				//alert(1);
  					$("#ee1").html("");
  					$("#ee2").html("");
  					$("#ee3").html("请选择时间");
  					c=false;
  					return;
  				}else{
  					$("#ee1").html("");
  					$("#ee2").html("");
  					$("#ee3").html("");
  				}
				//alert(ad1+"++"+n+"+++"+ad3+"++"+ad4);
				
				if(c){
				//alert(1);
					$.ajax({
						method:"get",//请求方式
	  					url:"time/editTime.do",//请求地址
	  					dataType:"html",
	  					data:{"id":d,"name":ad1,"starttime":ad2,"endtime":ad3},
	  					success:function(result){
	  						if(result=="111"){
	  							window.location.href="time/findAll.do";
	  						}
	  					}
					}); 
					//alert(c);
				}
			});
			//删除要求
			$("#i5").click(function(){
				var d="";
				var s=true;
				$(".ccc").each(function(){
					if($(this).attr("id")=="select"){
						d=$(this).find("td:eq(0)").html();
						//alert(d);
						s=false;					
						return;
					}
				});
			if(s){
				alert("请选中要删除的内容！");
				$("#deletepaihao").css("display","none");
			}else{
				//alert(aaa);
				$.ajax({
					method:"get",
					url:"time/deleteTime.do",
					data:{"id":d},
					dataType:"html",
					success:function(result){
						if(result=="111"){
							window.location.href="time/findAll.do";
						}
					}
				});
			}
			});
			$(".add").click(function(){
				$("#addpaihao").find("span").html("");
				$("#addpaihao").find("input").val("");
				$("#addpaihao").css("display","block");	
				$("#editpaihao").css("display","none");
				$("#deletepaihao").css("display","none");
			});
			$(".edit").click(function(){
				//alert(1);
				$("#editpaihao").find("span").html("");
				$("#editpaihao").find("input").val("");
				$("#addpaihao").css("display","none");	
				$("#deletepaihao").css("display","none");
				$("#editpaihao").css("display","block");
			});
			$(".delete").click(function(){
				//alert(1);
				$("#deletepaihao").find("input").val("");
				$("#addpaihao").css("display","none");	
				$("#editpaihao").css("display","none");
				$("#deletepaihao").css("display","block");
			});
		});
		
	</script>
	<script type="text/javascript" language="javascript">
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie 
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox 
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method1(tableid) {//整个表格拷贝到EXCEL中
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");

                //创建AX对象excel 
                var oWB = oXL.Workbooks.Add();
                //获取workbook对象 
                var xlsheet = oWB.Worksheets(1);
                //激活当前sheet 
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                //把表格中的内容移到TextRange中 
                sel.select;
                //全选TextRange中内容 
                sel.execCommand("Copy");
                //复制TextRange中内容  
                xlsheet.Paste();
                //粘贴到活动的EXCEL中       
                oXL.Visible = true;
                //设置excel可见属性

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);

                    oWB.Close(savechanges = false);
                    //xls.visible = false;
                    oXL.Quit();
                    oXL = null;
                    //结束excel进程，退出完成
                    //window.setInterval("Cleanup();",1);
                    idTmr = window.setInterval("Cleanup();", 1);

                }

            }
            else
            {
                tableToExcel('ta')
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
              template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
                base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                format = function(s, c) {
                    return s.replace(/{(\w+)}/g,
                    function(m, p) { return c[p]; }) }
                return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
              }
            })()
    </script>
	
</html>

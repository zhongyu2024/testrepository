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
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>

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
		<div id="box">
				<div id="top" style="background-color:#EAEEF1;height: 40px;font-size: 26px;">
					<div style="float: left;">
						<a href="pages/wh/w-1.jsp"><img src="images/wh/w-cantai1.png"></a>
					</div>|特殊要求
					<div style="float: right;">
						<input id="Button1" type="button" value="导出EXCEL"  onclick="javascript:method1('ta')" />

					</div>
				</div>
				
				<div id="addpaihao" style="display:none;width: 400px;height: 300px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
							<div style="float: left;margin-left: 10px;">新增要求</div>
							<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
							
									<td>要求:</td>
									<td><input type="text" id="name1"></td>
									<span id="ae1"></span><br/>
								
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i1"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><input type="image" src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="editpaihao" style="display:none;width: 400px;height: 300px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
						<div style="float: left;margin-left: 10px;">编辑要求</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
							
									<td>要求:</td>
									<td><input type="text" id="name2"></td>
									<span id="ae2"></span><br/>
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i3"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;" id="i4"><input type="image" src="images/wh/w-quxiao.png"></div>
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
				
				<div id="middle" style="clear: both;">
					<div id="right" style="float: left;background-color: white;width:1000px">
						<div style="height: 30px;float: left;">特殊要求</div>
						<div style="float: right;"></div>
						<div style="clear: both;background-color: #F5F5F5;">
							<div style="float: left;cursor: pointer;" class="add"><img src="images/wh/w-special-1.png"></div>
							<div style="float: left;cursor: pointer;" class="edit"><img src="images/wh/w-special-2.png"></div>
							<div style="float: left;cursor: pointer;" class="delete"><img src="images/wh/w-special-3.png"></div>
							<div style="float: right;"></div>
						</div>
						<div id="showInfo"  style="clear: both;width: 1000px;">
							<table cellpadding="0" cellspacing="0" width="1000px" id="ta">
								<tr style="background-color: lightgray;height: 40px;cursor: default;">
									<td width="50">编号</td>
									<td width="100">要求</td>
								</tr>
								<c:forEach items="${info }" var="t">
								<tr class="ccc">
									<td width="50">${t.id }</td>
									<td width="100">${t.name }</td>
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
			$(".cha").click(function(){
				$(this).parent().parent().css("display","none");
			});
			$(".quxiao").click(function(){
				$(this).parent().parent().parent().css("display","none");
			});
			$(".all").live('click',function(){
				$(this).css("background-color","darkgrey");
				$(this).siblings().css("background-color","#F5F5F5");
			});
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
	  					url:"special/findName.do",//请求地址
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
				var name=$(this).val();
				//alert(name);
				if(name==""){
					$("#ae2").html("请输入名称");
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
	  					url:"special/findName.do",//请求地址
	  					dataType:"html",
	  					data:{"name":name},
	  					success:function(result){
	  						if(result=="111"){
	  							$("#ae2").html("名称已存在");
	  							$("#i3 input").attr("disabled","disabled");
	  						}else{
	  							$("#ae2").html("");
	  							$("#i3 input").attr("disabled",false);
	  						}
	  					}
				});
				}
				}
			});
			//添加餐台的点击事件
			$("#i1").click(function(){
				var c=true;
  				var ad1=$("#name1").val();
  				//alert(1);
				//alert(ad1+"++"+n+"+++"+ad3+"++"+ad4);
				var test1=/^[\u4e00-\u9fa5]+$/; 
				if(!test1.test(ad1)){
					c=false;
					$("#ae1").html("请输入中文");
				}
				if(c){
					$.ajax({
						method:"get",//请求方式
	  					url:"special/addSpecial.do",//请求地址
	  					dataType:"html",
	  					data:{"name":ad1},
	  					success:function(result){
	  						if(result=="111"){
	  						window.location.href="special/findAll.do";
	  						}
	  					}
					});
				}
			});
			
			//编辑要求
			$("#i3").click(function(){
				var c=true;
				var s=true;
				var n=0;
  				var ad1=$("#name2").val();
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
				//alert(ad1+"++"+n+"+++"+ad3+"++"+ad4);
				var test1=/^[\u4e00-\u9fa5]+$/; 
				if(!test1.test(ad1)){
					c=false;
					$("#ae2").html("请输入中文");
				}
				//alert(d+"++"+ad1);
				if(!s&&c){
				//alert(1);
					$.ajax({
						method:"get",//请求方式
	  					url:"special/editSpecial.do",//请求地址
	  					dataType:"html",
	  					data:{"id":d,"name":ad1},
	  					success:function(result){
	  						if(result=="111"){
	  							window.location.href="special/findAll.do";
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
					url:"special/deleteSpecial.do",
					data:{"id":d},
					dataType:"html",
					success:function(result){
						if(result=="111"){
							window.location.href="special/findAll.do";
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

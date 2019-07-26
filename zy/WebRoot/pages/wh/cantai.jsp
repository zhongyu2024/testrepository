<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cantai.jsp' starting page</title>
    
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
		<div id="box" style="width: 90%;">
				<div id="top" style="background-color:#EAEEF1;height: 40px;font-size: 26px;">
					<div style="float: left;">
						<a href="pages/wh/w-1.jsp"><img src="images/wh/w-cantai1.png"></a>
					</div>|区域/餐台
					<div style="float: right;">
						<input id="Button1" type="button" value="导出EXCEL"  onclick="javascript:method1('ta')" />
					</div>
				</div>
				
				<div id="addcantai" style="display:none;width: 400px;height: 300px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
							<div style="float: left;margin-left: 10px;">新增餐台</div>
							<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
							
									<td>餐台名称</td>
									<td><input type="text" id="name1" class="yz"></td>
									<span id="ae1"></span><br/>
								
									<td>所在区域</td>
									<td>
										<select style="width:153px;" id="area1">
											<option>大厅</option>
											<option>包厢</option>
										</select>
									</td><br/>
							
									<td>最低消费</td>
									<td><input type="text" id="cost1"></td>
									<span id="ae2"></span><br/>
								
									<td>餐台人数</td>
									<td>
										<select id="number1" style="width:153px;">
											<option>2</option>
											<option>4</option>
											<option>6</option>
											<option>8</option>
											<option>12</option>
											<option>18</option>
										</select>
									</td><br/>
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i1"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="i2"><img src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="editcantai" style="display:none;width: 400px;height: 300px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
						<div style="float: left;margin-left: 10px;">编辑餐台</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
							
									<td>餐台名称</td>
									<td><input type="text" class="yz" iD="name2"></td>
									<span id="ae3"></span><br/>
								
									<td>所在区域</td>
									<td>
										<select style="width:153px;" id="area2">
											<option>大厅</option>
											<option>包厢</option>
										</select>
									</td><br/>
								
									<td>最低消费</td>
									<td><input type="text" id="cost2"></td>
									<span id="ae4"></span><br/>
								
									<td>餐台人数</td>
									<td>
										<select id="number2" style="width:153px;">
											<option>2</option>
											<option>4</option>
											<option>6</option>
											<option>8</option>
											<option>12</option>
											<option>18</option>
										</select>
									</td><br/>
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i3"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="i4"><img src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="deletecantai" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
						<div style="float: left;margin-left: 40px;">提醒</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">确定删除？</div>
					<div>
					<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;margin-left:40px;cursor: pointer;" id="i5"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="i6"><img src="images/wh/w-quxiao.png"></div>
					</div>
					</div>
				</div>
				
				<div id="middle" style="clear: both;">
					<div id="left" style="float: left;width:15%;background-color: #F5F5F5;">
						
						<div style="clear: both;">						
							<div style="cursor: pointer;background-color: darkgrey;height: 30px;" class="all" align="center">全部</div>
							<div style="cursor: pointer;height: 30px;" class="all" align="center">大厅</div>
							<div style="cursor: pointer;height: 30px;" class="all" align="center">包厢</div>
						</div>
					</div>
					
					<div id="right" style="float: left;background-color: white;width:1000px">
						<div style="height: 30px;float: left;">大厅</div>
						<div style="float: right;"></div>
						<div style="clear: both;background-color: #F5F5F5;">
							<div style="float: left;cursor: pointer;" class="add"><img src="images/wh/w-cantai-add.png"></div>
							<div style="float: left;cursor: pointer;" class="edit"><img src="images/wh/w-cantai-edit.png"></div>
							<div style="float: left;cursor: pointer;" class="delete"><img src="images/wh/w-cantai-delete.png"></div>
							<div style="float: right;"></div>
						</div>
						<div id="showInfo"  style="clear: both;width: 1000px;">
							<table cellpadding="0" cellspacing="0" width="1000px" id="ta">
								<tr style="background-color: lightgray;height: 40px;cursor: default;">
									<td width="50">编号</td>
									<td width="100">餐台名</td>
									<td width="100">所在区域</td>
									<td width="100">座位数</td>
									<td width="100">最低消费</td>
									<td width="100">餐台状态</td>
								</tr>
								<c:forEach items="${cantai}" var="c">
								<tr class="ccc">
									<td width="50">${c.id }</td>
									<td width="100">${c.name }</td>
									<c:if test="${c.area==0 }">
									<td width="100">大厅</td>
									</c:if>
									<c:if test="${c.area==1 }">
									<td width="100">包厢</td>
									</c:if>
									<td width="100">${c.seatsize }</td>
									<td width="100">${c.minpay }</td>
									<c:if test="${c.state==0 }">
									<td width="100">空闲</td>
									</c:if>
									<c:if test="${c.state==1 }">
									<td width="100">就餐</td>
									</c:if>
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
			$(".all").click(function(){
				$(this).css("background-color","darkgrey");
				$(this).siblings().css("background-color","#F5F5F5");
			});
			$(".ccc").live('click',function(){
				$(this).css({"background":"gold"}).attr("id","select");
				$(".ccc").not(this).css({"background":"white"}).attr("id","");
			});
			//分类查询
			$(".all").click(function(){
				var c=$(this).html();
				//alert(c);
				$.ajax({
					method:"get",//请求方式
  					url:"cantai/findOthers.do",//请求地址
  					dataType:"html",
  					data:{"name":c},
  					success:function(result){
  						$("#showInfo").html(result);
  					}
				});
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
	  					url:"cantai/findByName.do",//请求地址
	  					dataType:"html",
	  					data:{"name":name},
	  					success:function(result){
	  						if(result=="111"){
	  							$("#ae1").html("名称已存在");
	  							$("#i1").attr("disabled","disabled");
	  						}else{
	  							$("#ae1").html("");
	  							$("#i1").attr("disabled",false);
	  						}
	  					}
				});
				}
				
			});
			//添加餐台的点击事件
			$("#i1").click(function(){
				var c=true;
				var n=0;
  				var ad1=$("#name1").val();
				var ad2=$("#area1").val();
				var ad3=$("#cost1").val();
				var ad4=$("#number1").val();
				if(ad2=="大厅"){
					n=0;
				}else{
					n=1;
				}
				if(ad1==""){
					c=false;
				}
				//alert(ad1+"++"+n+"+++"+ad3+"++"+ad4);
				var test1=/^\d{1,}$/; 
				if(!test1.test(ad3)){
					c=false;
					$("#ae2").html("输入不正确");
				}
				if(c){
					$.ajax({
						method:"get",//请求方式
	  					url:"cantai/addCanTai.do",//请求地址
	  					dataType:"html",
	  					data:{"name":ad1,"area":n,"seatsize":ad4,"minpay":ad3},
	  					success:function(result){
	  						if(result=="111"){
	  						window.location.href="cantai/findAll.do";
	  						}
	  					}
					});
				}
			});
			//编辑光标的验证
			$("#name2").blur(function(){
				var name=$(this).val();
				//alert(name);
				if(name==""){
					$("#ae3").html("请输入名称");
					$("#i3").attr("disabled","disabled");
				}else{
					$.ajax({
						method:"get",//请求方式
	  					url:"cantai/findByName.do",//请求地址
	  					dataType:"html",
	  					data:{"name":name},
	  					success:function(result){
	  						if(result=="111"){
	  							$("#ae3").html("名称已存在");
	  							$("#i3").attr("disabled","disabled");
	  						}else{
	  							$("#ae3").html("");
	  							$("#i3").attr("disabled",false);
	  						}
	  					}
				});
				}
				
			});
			//编辑餐台的点击事件
			$("#i3").click(function(){
				var c=true;
				var s=true;
				var n=0;
  				var ad1=$("#name2").val();
				var ad2=$("#area2").val();
				var ad3=$("#cost2").val();
				var ad4=$("#number2").val();
				if(ad2=="大厅"){
					n=0;
				}else{
					n=1;
				}
				$(".ccc").each(function(){
						if($(this).attr("id")=="select"){
							d=$(this).find("td:eq(0)").html();//原来的名称
							//alert(d);
							s=false;					
							return;
						}
					});
					if(s){
						alert("请选择要编辑的菜单");
						$("#editcantai").css("display","none");
					}
				//alert(ad1+"++"+n+"+++"+ad3+"++"+ad4);
				var test1=/^\d{1,}$/; 
				if(!test1.test(ad3)){
					c=false;
					$("#ae4").html("输入不正确");
				}
				if(!s&&c){
					$.ajax({
						method:"get",//请求方式
	  					url:"cantai/editCanTai.do",//请求地址
	  					dataType:"html",
	  					data:{"id":d,"name":ad1,"area":n,"seatsize":ad4,"minpay":ad3},
	  					success:function(result){
	  						if(result=="111"){
	  							window.location.href="cantai/findAll.do";
	  						}
	  					}
					});
					//alert(c);
				}
			});
			//删除
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
				$("#deletecantai").css("display","none");
			}else{
				//alert(aaa);
				$.ajax({
					method:"get",
					url:"cantai/deleteCanTai.do",
					data:{"id":d},
					dataType:"html",
					success:function(result){
						if(result=="111"){
							window.location.href="cantai/findAll.do";
						}
					}
				});
			}
			});
			/*$(".dating").click(function(){
				$(this).css("background-color","darkgrey");
			});
			$(".baoxiang").click(function(){
				$(this).css("background-color","darkgrey");
			});*/
			$(".add").click(function(){
				$("#addcantai").find("span").html("");
				$("#addcantai").find("input").val("");
				$("#addcantai").css("display","block");	
				$("#editcantai").css("display","none");
				$("#deletecantai").css("display","none");
			});
			$(".edit").click(function(){
				//alert(1);
				$("#editcantai").find("span").html("");
				$("#editcantai").find("input").val("");
				$("#addcantai").css("display","none");	
				$("#deletecantai").css("display","none");
				$("#editcantai").css("display","block");
			});
			$(".delete").click(function(){
				//alert(1);
				$("#addcantai").css("display","none");	
				$("#editcantai").css("display","none");
				$("#deletecantai").css("display","block");
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

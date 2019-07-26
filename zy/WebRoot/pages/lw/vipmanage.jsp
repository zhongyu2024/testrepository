<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vipmanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>
  <script>
  /*   var idTmr;
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
                tableToExcel('aj');
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
              };
            });  */
            
  	
  	//会员类型操作
  	$(function(){
  		//添加
  		$("#addv").click(function(){
  			$("#addvip").css("display","block");
  			$("#hide").css("display","block");
  		});
  		$("#a-tr").click(function(){
  			$("#addvip").css("display","none");
  			$("#hide").css("display","none");
  		}); 
  		$("#addn").click(function(){
  			$("#addvip").css("display","none");
  			$("#hide").css("display","none");
  		});
  		$("#addlei").focus(function(){
  			$(this).parent().next().html("");
  		});
  		$("#addzhe").focus(function(){
  			$(this).parent().next().html("");
  		});
  		$("#addjin").focus(function(){
  			$(this).parent().next().html("");
  		});
  		
  		
  		$("#addlei").blur(function(){
  			if($("#addlei").val()==""){
  				$(this).parent().next().html("不能为空");
  				$("#addy").attr("disabled","disabled");
  				return;
  			}
  			$("addy").attr("disabled",false);
  		});
  		$("#addzhe").blur(function(){
  			if($("#addzhe").val()==""){
  				$(this).parent().next().html("不能为空");
  				$("#addy").attr("disabled","disabled");
  				return;
  			}
  			var rule1=/^0.[0-9]*[1-9]$/;
	  		if(!rule1.test($("#addzhe").val())){
	  			$(this).parent().next().html("请输入正确的折扣（0-1）");
	  			$("#addy").attr("disabled","disabled");
	  			return;
	  		}
	  		$("#addy").attr("disabled",false);
  		});
  		
  		$("#addjin").blur(function(){
  			if($("#addjin").val()==""){
  				$(this).parent().next().html("不能为空");
  				$("#addy").attr("disabled","disabled");
  				return;
  			}
  			if($("#addjin").val()<0){
  				$(this).parent().next().html("请输入正确的金额");
  				$("#addy").attr("disabled","disabled");
  				return;
  			}
  			$("#addy").attr("disabled",false);
  		});
  		$("#addy").click(function(){
  			var name=$("#addlei").val();
  			var count=$("#addzhe").val();
  			var money=$("#addjin").val();
  			if(name==""||count==""||money==""){
  				alert("输入错误，不能为空");
  				return;
  			}
  			$("#addvip").css("display","none");
  			$("#hide").css("display","none");
  			alert("添加成功！");
  			//对中文进行编码
  			window.location="vip/add.do?name="+encodeURI(encodeURI(name))+"&count="+count+"&money="+money;
  			//window.location=location.href;
  			
  		});
  		
  		//修改
  		$("#modicou").focus(function(){
		  	$("#mo3").html("");
		 });
		 $("#modimon").focus(function(){
		  	$("#mo4").html("");
		 });
  		$("#modiv").click(function(){
  			$("#modivip").css("display","block");
  			$("#hide").css("display","block");
  			
  		$("#modicou").blur(function(){
  			var rule1=/^([1-9]|10)$/;
	  		if(!rule1.test($("#modicou").val())){
	  			$("#mo3").html("请输入正确的折扣（0-1）");
	  			$("#modiy").attr("disabled","disabled");
	  			return;
	  		} 
	  		$("#modiy").attr("disabled",false);
  		});
  		
  		$("#modimon").blur(function(){
  			if($("#modimon").val()==0){
  				$("#mo4").html("请输入正确的金额");
	  			$("#modiy").attr("disabled","disabled");
	  			return;
  			}
	  		if($("#modimon").val()<0){
	  			$("#mo4").html("请输入正确的金额");
	  			$("#modiy").attr("disabled","disabled");
	  			return;
	  		} 
	  		$("#modiy").attr("disabled",false);
  		});
  		
				  		
			
  		$("#modiy").click(function(){
  			var ml=$("#modiLe").val();
  			var mn=$("#modiname").val();
  			var mc=$("#modicou").val();
  			var mm=$("#modimon").val();
  			if(ml==""||mn==""||mc==""||mm==""){
  				alert("输入不能为空！");
  				return;
  			}
  			$.ajax({
				type:"post",
				url:"vip/xiu.do",
				data: {"id":ml,"name":mn,"count":mc,"money":mm}, 
				dataType:"html",
				success:function(result){
				
				}
			});	
  			//window.location="vip/xiu.do?id="+ml+"&name="+mn+"&count="+mc+"&momey="+mm;
  			$("#modivip").css("display","none");
  			$("#hide").css("display","none");
  			alert("修改成功！");
  		});
		  			
  		});
  		$("#b-tr").click(function(){
  			$("#modivip").css("display","none");
  			$("#hide").css("display","none");
  		}); 
  		$("#modin").click(function(){
  			$("#modivip").css("display","none");
  			$("#hide").css("display","none");
  		});
  		//删除
  		$("#delv").click(function(){
  			$("#delvip").css("display","block");
  			$("#hide").css("display","block");
  		});
  		$("#c-tr").click(function(){
  			$("#delvip").css("display","none");
  			$("#hide").css("display","none");
  		}); 
  		$("#deln").click(function(){
  			$("#delvip").css("display","none");
  			$("#hide").css("display","none");
  		});
  		$(".xiazuot tr").mouseenter(function(){
  			$(this).css("background","#DFF0D8");
  		});
  		$(".xiazuot tr").mouseleave(function(){
  			$(this).css("background","#F9F9F9");
  		});
  		$(".kayue").click(function(){
  			$("#xiaofei").css("display","block");
  		});
  		 $("#dely").click(function(){
  			var delid=$("#delLevel").val();
  			window.location="vip/delle.do?id="+delid;
  			alert("删除成功!");
  		});
  
  		
  		
  		
  });
  

  	
  	
  </script>
  <style>
  	button,select,#sousuo,.level{cursor: pointer;}
  	select{width:100px;height:35px;border:2px solid #ccc;margin-top: 10px;margin-left: 20px;border-radius:3px;}
  	#showv{height:80%;}
  	#showl{background: green;height:100%;width:100%;}
  	#fenye{text-align: center;}
    #hide{z-index: 2;background: #ccc;opacity:0.6;display: none;position: absolute;width:100%;height: 100%;left:0px;top:0px;}
  	#addvip{z-index: 3;display:none ;position: absolute;width:580px;height:260px;background: white;top:25%;left:30%;border-radius:8px;}
	#a-top{hieght:45px;}
	#a-tl{float: left; background-color: #EAEAEA;text-align: center;width:543px;line-height: 36px;font-weight: bold;}
	#a-tr{float: right;}
	#a-mid{padding-left:150px;margin-top: 50px;}
	#a-foot{padding-top: 25px;margin-left: 170px;clear: both;}
	#modivip{z-index: 3;display: none;position: absolute;width:580px;height:360px;background: white;top:25%;left:30%;border-radius:8px;}
	
	#b-top{hieght:45px;}
	#b-tl{float: left; background-color: #EAEAEA;text-align: center;width:543px;line-height: 36px;font-weight: bold;}
	#b-tr{float: right;}
	#b-mid{margin-top: 50px;}
	#b-foot{padding-top: 25px;margin-left: 170px;clear: both;}
	
	#delvip{z-index: 3;display: none;position: absolute;width:580px;height:180px;background: white;top:25%;left:30%;border-radius:8px;}
	#c-top{hieght:45px;}
	#c-tl{float: left; background-color: #EAEAEA;text-align: center;width:543px;line-height: 36px;font-weight: bold;}
	#c-tr{float: right;}
	#c-mid{padding-left:150px;margin-top: 50px;}
	#c-foot{padding-top: 25px;margin-left: 170px;}
  	
  	#mt{background: #F5F5F5;height:50px;}
  	#xiazuo{background: #F0F0F0;border:2px solid #ccc;height:100%;padding-top: 10px;}
  	#xiayou{border:2px solid #ccc;height:100%;}
  	.container{width:90%;height:85%;}
  	.fanhui{margin-top: 10px;}
  	.fanhuib{width: 120px;background: #00B96D;color:white;margin-top: 5px;}
  	.xiazuot{margin-top: 10px;}
  
  	#xiaofei{position:absolute;width:550px;height:55px;left:45px;border-radius:3px;display: none;background: #ccc;}
  	#xiaofei input{width:100px;height:35px;margin: 10px;border-radius:3px;border:2px solid #ccc;}
  	#xiaofei button{margin-top:10px;margin-left: 10px;}
  	.x1{float: left;}
  	.kayued{margin-left: 30px;}
  	
  	.kayue{width:100px;height:35px;border:2px solid #ccc;margin-top: 10px;border-radius:3px;background: white;}
  	.sh{text-align: center;padding-top:15px; }
  	.sh th{width:180px;text-align: center;}
  	#showv{background: #ccc;border-radius:5px;}
  	#showv #aj{}
  	#modiLevel{width:500px;margin-top:15px;margin-left:60px;}
	#modiLevel tr{height:40px;width:150px;}
	#modiLevel tr td{width:100px;}	
  	#mo3,#mo4{color:red;font-size: 12px;}
  </style>
  <body style="font-family: 微软雅黑;">
  <div id="hide">
  </div>
  <!-- 添加 -->
  	<div id="addvip">
  		<div id="a-top">
			<div id="a-tl">
				新增会员类型
			</div>
			<div id="a-tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		<div id="a-mid">
			<div style="margin-top: 20px;">
				<div style="float: left;">类型名称：<input type="text" id="addlei"></div>
				<div style="float: left;color:red;margin-left: 20px;"></div>
			</div>
			<div style="margin-top: 20px;clear: both;">
				<div style="float: left;margin-top: 10px;">默认折扣：<input type="text" id="addzhe"></div>
				<div style="float: left;margin-top: 10px;color:red;margin-left: 20px;"></div>
			</div>
			<div style="margin-top: 20px;">
					<div style="float: left;margin-top: 10px;">充值金额：<input type="text" id="addjin"></div>
					<div style="float: left;margin-top: 10px;color:red;margin-left: 20px;"></div>
			</div>
		</div>
		<div id="a-foot">
			 <button type="button" class="btn btn-default fanhuib" id="addy">确定</button>
			 <button type="button" class="btn btn-default fanhuib" id="addn">取消</button>
		</div>
  	</div>
  <!-- 修改 -->
  	<div id="modivip">
  		<div id="b-top">
			<div id="b-tl">
				修改会员类型
			</div>
			<div id="b-tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		<div id="b-mid">
			<table id="modiLevel">
				<tr>
					<td>会员类型：</td>
					<td>
						<select id="modiLe" style="width:180px;height:30px;border:1px solid #ccc;border-radius:0px;
									margin-left: 0px;">
							<c:forEach items="${les}" var="les" >
								<option value="${les.id}">
									${les.name}
								</option>
							</c:forEach>
						</select>
					</td>
					<td id="mo1" width="100px"></td>
				</tr>
				<tr>
					<td>会员名称：</td>
					<td><input type="text" id="modiname"></td>
					<td id="mo2"></td>
				</tr>
				<tr>
					<td>默认折扣：</td>
					<td><input type="text" id="modicou" ></td>
					<td id="mo3"></td>
				</tr>
				<tr>
					<td>消费金额：</td>
					<td><input type="text" id="modimon" onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
					<td id="mo4" ></td>
				</tr>
			</table>
		</div>
		<div id="b-foot">
			 <button type="button" class="btn btn-default fanhuib" id="modiy">确定</button>
			 <button type="button" class="btn btn-default fanhuib" id="modin">取消</button>
		</div>
  	</div>
  	
  <!-- 删除 -->
  	<div id="delvip">
  		<div id="c-top">
			<div id="c-tl">
				删除会员类型
			</div>
			<div id="c-tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		<div id="c-mid">
			<div style="margin-top: 20px;">
				会员类型：
			<select id="delLevel" style="width:155px;height:30px;border:1px solid #ccc;border-radius:0px;margin-left: 0px;">
				<c:forEach items="${les}" var="les" >
					<option value="${les.id}">
						${les.name}
					</option>
				</c:forEach>
			</select>
				
			</div>
		</div>
		<div id="c-foot">
			 <button type="button" class="btn btn-default fanhuib" id="dely">确定</button>
			 <button type="button" class="btn btn-default fanhuib" id="deln">取消</button>
		</div>
  	</div>
  	
  	
  <!--主体 -->
   	<div class="container">
	<div class="row clearfix" id="mt">
		<div class="col-md-3 column fanhui">
			 <button type="button" class="btn btn-default fanhuib" onclick="javascript:window.location.href='pages/lw/vip.jsp';">返回</button>
		</div>
		<div class="col-md-3 column fanhui">
		</div>
		<div class="col-md-3 column fanhui">
		</div>
		<!-- <div class="col-md-3 column fanhui">
			 <button type="button" class="btn btn-default fanhuib" id="daochu" onclick="javascript:method1('aj')">导出到Excel</button>
		</div> -->
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column" id="xiazuo">
			 <button type="button" class="btn btn-default fanhuib" id="addv" >新增会员类型</button><br>
			 <button type="button" class="btn btn-default fanhuib" id="modiv">修改会员类型</button><br>
			 <button type="button" class="btn btn-default fanhuib" id="delv" >删除会员类型</button>
			<div class="row clearfix">
				<div class="col-md-2 column">
				</div>
			</div>
			<table class="table table-hover table-striped xiazuot">
				<tr>
					<td id="0" class="level">全部</td>
				</tr>
				<c:forEach var="les" items="${les}">
					<tr id="${les.id}" class="level">
						<td>${les.name }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-10 column" id="xiayou">
			<div class="row clearfix">
				<div class="col-md-4 column">
					<div class="btn-group kayued">
						 <button type="button" class="btn btn-default kayue">卡余额</button>
					</div>
					<div id="xiaofei">
						<div class="x1">
							<input type="text" id="min">至
						</div>
						<div class="x1">
							<input type="text" id="max">
						</div>
						<div class="x1">
							<button type="button" class="btn btn-default fanhuib" id="qd">确定</button>
						</div>
						<div class="x1">
							<button type="button" class="btn btn-default fanhuib" id="qc">清除</button>
						</div>
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="btn-group">
						 卡状态：<select id="state" onchange="change()">
							<option value="2">全部</option>
							<option value="0">正常</option>
							<option value="1">停用</option>
						</select>
					</div>
				</div>
				<!-- <div class="col-md-2 column" style="margin-top: 15px;">
					搜索：<input type="text" name="searchv" id="searchv">
				</div>
				<div class="col-md-2 column" style="background: #00B96D;width:60px;height:28px;border-radius:5px;color:white;margin-top: 14px;line-height: 28px;" id="sousuo">
					确定
				</div> -->
			</div>
			<table class="table table-hover table-striped sh" id="sss">
				<thead>
					<tr>
						<th>
							姓名
						</th>
						<th>
							会员类型
						</th>
						<th>
							卡号
						</th>
						<th>
							余额
						</th>
						<th>
							联系方式
						</th>
						<th>
							状态
						</th>
						<th>消费总额</th>
						<th>折扣</th>
					</tr>
				</thead>
				</table>
				
				<div id="showv">
					
				</div>
		</div>
		
	</div>
	
</div>
   	
  </body>
  <script>
  
   		var qid=0;//会员等级
  		var min=0;//最小金额
  		var max=0;//最大金额
  		var qstate=2;//全部状态
		var pageno=1;//当前页数
   		  function sendAjax(){
   		 // alert("进入ajax")
			$.ajax({
				type:"post",//请求方式
				url:"vips/fv.do",//请求地址
				data: {"id":qid,"min":min,"max":max,"state":qstate,"pageno":pageno}, //请求的参数
				dataType:"html",//响应的数据格式html/script/json/jsonp
				success:function(result){//回调函数:当ajax正常响应时要做的处理
					$("#showv").html(result);
				}
			});	
		}  
	function change(){
  			qstate=$("#state").val();
  			sendAjax();
  		}
	$(function(){
		$("#back").live('click',function(){
			//alert(parseInt($("#pageno").val())+1);
			pageno=parseInt($("#pageno").val())+1;
			sendAjax();
		});
		$("#forward").live('click',function(){
			//alert(parseInt($("#pageno").val())+1);
			pageno=parseInt($("#pageno").val())-1;
			sendAjax();
		});
	
		sendAjax();
  		$(".level").click(function(){
  			qid=($(this).attr("id"));
  			sendAjax();
  		});
  		
 		
  	});
  		
  		$("#qd").click(function(){
  			$("#xiaofei").css("display","none");
  			$(".kayue").css("overflow","hidden");
  			var m1=$("#min").val();
  			var m2=$("#max").val();
  			
  			//验证是否符合规则：数字
  			var rule=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
  			if(!rule.test(m1))
  			{
  				$("#max").val("");
  				$("#min").val("");
  				alert("请输入正数！");
  				return;
  			}
  			if(!rule.test(m2))
  			{
  				$("#max").val("");
  				$("#min").val("");
  				alert("请输入正数！");
  				return;
  			}	 
  			if(m1>m2)
  			{
  				alert("最大值不能小于最小值！");
  				return;
  			}
  			min=$("#min").val();
  			max=$("#max").val();
  				
  		$("#qc").click(function(){
  			$("#xiaofei").css("display","none");
  			$("#min").val("");
  			$("#max").val("");
  			min=0;
  			max=0;
  			sendAjax();
  			$(".kayue").html("卡余额");//button
  		});
  			//alert(min+"--"+max);
  			sendAjax();
  			$(".kayue").html(min+"~"+max);
  			
  		
  		/* $("#sousuo").click(function(){
  			id=0;
  			state=1;
  			sendAjax();
  		}); */

  
  		//导出到EXCEL
      
 });
    </script>
</html>

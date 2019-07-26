<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="calendar/common.css" type="text/css"></link>
<link rel="stylesheet" href="calendar/lhgcalendar.css" type="text/css"></link>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
<link rel="stylesheet" href="calendar/prettify.css" type="text/css"></link>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="calendar/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="calendar/lhgcalendar.min.js"></script>
<script type="text/javascript" src="calendar/prettify.js"></script></head>
<script type="text/javascript" src="calendar/demo.js"></script>

  <script>

  	var myDate = new Date();//获取当前日期
  	var year=myDate.getFullYear();//获取年份
  //新增会员
  $(function(){
  		$("#addvip").click(function(){
  			$("#hide").css("display","block");
  			$("#adding").css("display","block");
  			//从数据库 中找出最新的id
  			window.location.reload="vip/ms.do";
  		}); 
  		$("#a-tr").click(function(){
  			$("#adding").css("display","none");
  			$("#hide").css("display","none");
  		}); 
  		$("#vipmanage").click(function(){
  			//进入会员管理界面
  			window.location="vip/m.do";
  		});
  		$("#chakuang input").focus(function(){
  			$(this).val("");
  		});
  		//取消
  		$("#qux").click(function(){
  			$("#adding").css("display","none");
  			$("#hide").css("display","none");
  		});
  		
  		//查找td中id结尾是Err的元素集合
  		 var list=$('td[id$=Err]');
  		 for(var i=0;i<list.size();i++)
  		 {
  		 	list.get(i).style.color="red";
  		 	list.get(i).style.fontSize="13px";
  		 }  
  		
  		$("#birth").focus(function(){
  			$("#birthErr").html("");
  		});
  		
  		$("#vname").focus(function(){
  			$("#nameErr").html("");
  		});
  		$("#vtel").focus(function(){
  			$("#telErr").html("");
  		});
  		$("#pwd1").focus(function(){
  				$("#pwd1Err").html("");
  		});
  		$("#pwd2").focus(function(){
  				$("#pwd2Err").html("");
  		});
  		 	//判断会员名
			$("#vname").blur(function(){
	  		var rule=/^[\u4E00-\u9FA5]+$/;
			if(!rule.test($("#vname").val()))
			{
				$("#qued").attr("disabled","disabled");
				$("#nameErr").html("请输入中文");
			}else{
				$("#qued").attr("disabled",false);
			}
  		});
  	 		//判断手机号
  			$("#vtel").blur(function(){
	  		var rule=/^1[3|4|5|7|8][0-9]{9}$/; 
			if(!rule.test($(this).val()))
			{
				$("#qued").attr("disabled","disabled");
				$("#telErr").html("请输入正确的手机号");
				
			}else{
				$("#qued").attr("disabled",false);
			}
  		});  
  			
  			//判断确认密码
  			$("#pwd1").blur(function(){
  				if($("#pwd1").val()==""){
  					$("#qued").attr("disabled","disabled");
	  				$("#pwd1Err").html("密码不能为空");
	  				return;
  				}else{
  					var rule=/^[^\s]{6,20}$/;
  					if(!rule.test($("#pwd1").val())){
  						$("#qued").attr("disabled",true);
  						$("#pwd1Err").html("密码须为6-20位字符");
  						return;
  					}
  					$("#pwd1Err").html("密码合格");
  					$("#qued").attr("disabled",false);
					
				} 
  			});
  			
  			$("#pwd2").blur(function(){
  				if($("#pwd1").val()!=$("#pwd2").val()){
  					$("#qued").attr("disabled","disabled");
	  				$("#pwd2Err").html("两次密码输入不一致");
	  				
	  			}else{
					$("#qued").attr("disabled",false);
				}
  			});
  			
  		//验证id
  		$("#vid").focus(function(){
  			$("#idErr").html("");
  		});
  		$("#vid").blur(function(){
  		var v1=$("#vid").val();
  		$.ajax({
				type:"post",
				url:"vips/jiancha.do",
				data: {"id":v1},
				dataType:"html",
				success:function(result){
					if(result==1)
					{
						$("#idErr").html("卡号已存在");
						$("#qued").attr("disabled","disabled");
					}
					else
					{
						$("#idErr").html("此卡号可用");
						$("#qued").attr("disabled",false);
					}	
				}
			});
  		});
  		
  		if($("#birth").val()!=""){
	  			var birth=$("#birth").val();
	  			var b=parseInt(birth.substring(0,4));
	  			var a=year-b;
	  			if(a<=0){
	  				$("#birthErr").html("请选择正确的时间");
	  				$("#qued").attr("disabled","disabled");
	  				return;
	  			}else{
	  				$("#qued").attr("disabled",false);
	  			}
	  		}   
  		
  		
  		//添加会员
  		var vid=0;
		$("#qued").click(function(){
			vid=$("#vid").val();
			var name=$("#vname").val();
  			var sex=$("input[name='sex']:checked").val();
  			var tel=$("#vtel").val();
  			var birthday=$("#birth").val();
			var v_level=$("#sel").val();
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
			if(name.trim()==""||tel==""||birthday==""||pwd1==""||pwd2==""){
				alert("输入有误,不能为空！");
				return;
			}
  		 	
  		 	$.ajax({
				type:"post",
				url:"vips/jiancha.do",
				data: {"id":vid},
				dataType:"html",
				success:function(result){
				if(result==1){alert("卡号已存在！");
						return;
					}
				}
			});
  			$("#adding").css("display","none");
  			$("#hide").css("display","none"); 
  			
  			$.ajax({
	  				type:"post",
	  				url:"vips/adv.do",
	  				data: {"id":vid,"name":name,"sex":sex,"tel":tel,"v_level":v_level,"pwd1":pwd1,"birthday":birthday},//请求的参数 
	  				dataType:"html",
	  				success:function(result){
	  					chongz();
	  				}
	  			});	
  			
		}); 
  		
  		
  		function chongz(){
  			confirm("确认会员已缴纳费用？");
  			var vids=$("#vid").val();
  			var nmoney=$("#needmoney").val();
  			$.ajax({
				type:"post",
				url:"vips/cz.do",
				data: {"vipid":vids,"money":nmoney},
				dataType:"html",
				success:function(result){
				//$("#needmoney").attr("value",result);
				}
				
			});
			alert("添加成功！");
  		}
		  		
  		//根据卡号或ID查找
  		$("#chazhao").click(function(){
  				$("#empty").html("");
  				var num=$("#td").val();
  				if(num==""||num=="输入手机号、会员卡号查找"){
  					alert("请输入内容");
  					return;
  				}
  				if(num.length<10){
  					var id=num;
	  					 $.ajax({
		  				type:"post",
		  				url:"vips/byid.do",
		  				data: {"id":id}, 
		  				dataType:"html",
		  				success:function(result){
		  					$("#vipinfo").html(result);
		  				}
		  			});	
  				}else{
  					var tel=num;
  					 $.ajax({
		  				type:"post",
		  				url:"vips/bytel.do",
		  				data: {"tel":tel},
		  				dataType:"html",
		  				success:function(result){
		  					$("#vipinfo").html(result);
		  				}
		  			});	
  				}
  				
  		});
  		
  		
  		
  	});
  	
  //日历插件	
  $(function(){
    $('#demo_inp1').calendar();
    $('.demo').calendar();
  });

  //表单验证
  
  </script>
  
  <style>
    #ccc{font-size: 20px;font-weight: bold;}
  	#sel option{width:200px;}
	#box{z-index: 1;margin-top: -10px;}
	#hide{z-index: 2;background: #ccc;opacity:0.6;display: none;position: absolute;width:100%;height: 100%;left:0px;top:0px;}
	#adding{z-index: 3;display: none;position: absolute;width:580px;height:460px;background: white;top:25%;left:30%;border-radius:8px;}
	#a-top{hieght:45px;}
	#a-tl{float: left; background-color: #EAEAEA;text-align: center;width:543px;line-height: 36px;font-weight: bold;}
	#a-tr{float: right;}
	#a-mid{padding-left:40px;}
	#a-mid table td{width:80px;}
	#a-foot{padding-top: 25px;margin-left: 170px;}
	
	#qued{background: #0EADCD;color:white;}
	#qux{background: #0EADCD;color:white;}
	#left{float:left;width:75%;height:100%;background:#E6EAED;}
	#addvip{float:left;padding-top: 30px; margin-left: 80px;cursor: pointer;}
	#vipmanage{float:left;padding-top: 30px;margin-left: 30px;cursor: pointer;}
	#search{border:3px solid #00BB6E;clear:both;width:360px;height:48px;margin-top:20%;margin-left:30%;}
	#chakuang{float: left;}
	#chakuang input{width:267px;height:42px;border:0px;}
	#chazhao{margin-left:267px;cursor:pointer;float:left;margin-top:-42px;}
	#right{float:left;width:25%;background: #F5F6F8;height:100%;background: #ccc}
	#info{height:260px;padding-left:30px;margin-top: 30px;}
	#info tr{height:30px;margin-top:15px;color:white;}
	#opt{height:200px;padding-left:25px;margin-top: 200px;}
	#sex{margin-left: 30px;}
	#red{color:red;}
	#vipinfo{height:60%;text-align: center;}
	#vipt tr td{width:150px;}
	.puka{margin-left:-12px;}
	.cols{margin-left: 10px;float: left;}
	.optbtn{width:80px;height:40px;margin-left:10px;margin-top:10px; background: #00BB6E;float:left;
	border-radius:6px;line-height: 40px;text-align: center;cursor: pointer;color:white;}

	/* 弹出层 */
	.tanchu{z-index: 3;display: none;position: absolute;width:580px;height:250px;background: white;top:25%;left:30%;border-radius:8px;}
	.top{hieght:45px;}
	.tl{float: left; background-color: #EAEAEA;text-align: center;width:93.6% ;line-height: 36px;font-weight: bold;}
	.tr{float: right;}
	#chong1{overflow: auto;overflow-x:hidden; }
	#xiao1{overflow: auto;overflow-x:hidden; }
	.mid table td{width:80px;}
	.tabhead tr td{width:160px;line-height: 40px;font-size: 20px;text-align: center;background: #ccc;}
	.sure{margin-top:40px;margin-left: 130px;float: left;}
	.canc{margin-top:40px;margin-left: 150px;float: left;}
	#chongji{display:none;width:800px;height:550px;}
	#chongji .tl{width:762px;}
	#chongjit tr{line-height: 30px;border-bottom: 1px solid #ccc;}
	#chongjit{width:800px;text-align: center;}
	#xiaoji{display:none;width:800px;height:550px;}
	#xiaoji .tl{width:762px;}
	#xiaojit tr{line-height: 30px;border-bottom: 1px solid #ccc;}
	#xiaojit{width:800px;text-align: center;}
	/* button{background: #00BB6E;width:120px;} */
	#ctab{width:500px;margin-top:15px;margin-left:60px; }
	#ctab tr{height:40px;width:150px;}
	#ctab tr td{180px;}
	#z1,#z2,#z5,#z6,#z7{color:red;font-size: 12px;}
</style>  
  <body style="font-family: 幼圆;">
  	<div id="hide">
	</div>
<script>

$(function(){
	//会员操作
 		$(".tr").click(function(){
 		$("#infom").html("");
 			$(this).parent().parent().css("display","none");
 			$("#hide").css("display","none");
 		});
 		$(".canc").click(function(){
 		$("#infom").html("");
 			$(this).parent().parent().parent().css("display","none");
 			$("#hide").css("display","none");
 		});
 		
 		
 		
 		//充值
 		$("#chongbtn").live('click',function(){
 		$("#infom").html("");
 			$("#chongzhi").css("display","block");
 			$("#hide").css("display","block");
			
			var cid=$("#cid").html();
			$("#chongka").attr("value",cid);
				
 			$("#c1").live('click',function(){
 				var vipid=cid;
 				var money=$("#chongjin").val();
 				if(money.length>10||money==""){
 					alert("请输入正确的金额！");
 					return;
 				}
 				if($("#kas").html().trim()=="停用")
 				{
 					$("#infom").html("该卡已停用，无法充值！");
 					$("#chongzhi").css("display","none");
 					$("#hide").css("display","none");
 					return;
 				}
 				
 				$(this).parent().parent().parent().css("display","none");
 				$("#hide").css("display","none");
 				
 				//window.location="vips/cz.do?vipid="+vipid+"&money="+money; 
 				 $.ajax({
		  				type:"post",//请求方式
		  				url:"vips/cz.do",//请求地址
		  				data: {"vipid":vipid,"money":money}, //请求的参数 
		  				dataType:"html",//响应的数据格式html/script/json/jsonp
		  				success:function(result){//回调函数:当ajax正常响应时要做的处理
		  					$("#vipinfo").html(result);
		  				}
		  			});
 				
 				alert("充值成功!");
 				return;
 			});
 			
 		});
 		
 		//充值记录
 		$("#chongjibtn").live('click',function(){
 			$("#chongji").css("display","block");
 			$("#hide").css("display","block");
 			var id=$("#cid").html();
			 $.ajax({
	  				type:"post",//请求方式
	  				url:"vipre/fr.do",//请求地址
	  				data: {"id":id}, //请求的参数 
	  				dataType:"json",//响应的数据格式html/script/json/jsonp
	  				success:function(result){//回调函数:当ajax正常响应时要做的处理
	  					$("#chongjit").html("");
		  				for(var i=0;;i++){
		  					$("#chongjit").append("<tr><td>"+result[i].id+"</td>"+"<td>"+result[i].vipid+"</td>"+
		  					"<td>"+result[i].time.substring(0,10)+"</td>"+"<td>充值</td>"+"<td>"+result[i].money+"</td>"+"<td>管理员</td></tr>");
		  				}
	  				}
	  				
	  			});	
 		});
 		
 		//消费记录
 		$("#xiaojibtn").live('click',function(){
 		$("#infom").html("");
 			$("#xiaoji").css("display","block");
 			$("#hide").css("display","block");
 			var id=$("#cid").html();
			 $.ajax({
	  				type:"post",//请求方式
	  				url:"vipre/fr1.do",//请求地址
	  				data: {"id":id}, //请求的参数 
	  				dataType:"json",//响应的数据格式html/script/json/jsonp
	  				success:function(result){//回调函数:当ajax正常响应时要做的处理
	  					$("#xiaojit").html("");
		  				for(var i=0;;i++){
		  					$("#xiaojit").append("<tr><td>"+result[i].id+"</td>"+"<td>"+result[i].vipid+"</td>"+
		  					"<td>"+result[i].time.substring(0,10)+"</td>"+"<td>消费</td>"+"<td>"+result[i].money+"</td>"+"<td>管理员</td></tr>");
		  				}
	  				}
	  				
	  			});	
 		});
 		
 		/* function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
		    try {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
		        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
		        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
		        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		        var hours = date.getHours();
		        var minutes = date.getMinutes();
		        var seconds = date.getSeconds();
		        var milliseconds = date.getMilliseconds();
		        return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds + "." + milliseconds;
		    } catch (ex) {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
		        return "";
		    }
		} */
 		
 		//编辑
 		$("#bianbtn").live('click',function(){
 			$("#infom").html("");
			$("#bian").css("display","block");
			$("#hide").css("display","block");
				
	 		$("#cname").attr("value",$("#ccc").html());
	 		$("#ctel").attr("value",$("#vt").html());
	 		$("#cbirth").attr("value",$("#vbir").html());
 		
 		 	$("#cname").focus(function(){
 		 		$("#z1").html("");
 		 	});
 		 		$("#ctel").focus(function(){
 		 		$("#z2").html("");
 		 	});
 		 	
 		 		$("#cbirth").focus(function(){
 		 		$("#z5").html("");
 		 	});
 		 		$("#cpwd").focus(function(){
 		 		$("#z6").html("");
 		 	});
 		 		$("#cpwd1").focus(function(){
 		 		$("#z7").html("");
 		 	});
 		 	
 		 	
 			//判断姓名
 			$("#cname").blur(function(){
	  			var rule=/^[\u4E00-\u9FA5]+$/;
				if(!rule.test($("#cname").val()))
				{
					$("#z1").html("请输入中文");
					$("#c4").attr("disabled","disabled");
					return ;
				}else{
					$("#c4").attr("disabled",false);
				}
			 }); 
			 
			 //判断手机号
  			$("#ctel").blur(function(){
		  		var rule=/^1[3|4|5|7|8][0-9]{9}$/;
				if(!rule.test($("#ctel").val()))
				{
					$("#z2").html("请输入正确的手机号");
					$("#c4").attr("disabled","disabled");
					return ;
				}else{
					$("#c4").attr("disabled",false);
				}
	  		}); 
	  		
  			$("#cpwd").blur(function(){
  				if($("#cpwd").val()==""){
	  				$("#z6").html("原密码不能为空");
	  				$("#c4").attr("disabled","disabled");
  				}else{
	  				var a=$("#cid").html();
	  					 $.ajax({
		  				type:"post",
		  				url:"vips/pwd.do",
		  				data: {"id":a},
		  				dataType:"html",
		  				success:function(result){
		  				var pp=result;
		  				if($("#cpwd").val()!=pp){
		  					$("#z6").html("原密码输入错误");
		  					$("#c4").attr("disabled","disabled");
		  					return;
		  				}
	  				}
	  			});	
					$("#c4").attr("disabled",false);
				}
  			});
  			
  			$("#cpwd1").blur(function(){
  				if($("#cpwd1").val()==""){
	  				$("#z7").html("新密码不能为空");
	  				$("#c4").attr("disabled","disabled");
	  				return;
  				}else{
					$("#c4").attr("disabled",false);
				}
  			});
  			
  			$("#cpwd1").blur(function(){
  				if($("#cpwd").val()==$("#cpwd1").val()){
	  				$("#z7").html("新密码不能与上一次相同");
	  				$("#c4").attr("disabled","disabled");
	  				return;
	  			}else{
					$("#c4").attr("disabled",false);
				}
  			});
  			
  			$("#cbirth").blur(function(){
  				if($(this).val()==""){
					$("#z5").html("生日不能为空");
					$("#c4").attr("disabled","disabled");
					return;				
  				}
  				if($("#birth").val()!=""){
		  			var birth=$("#birth").val();
		  			var b=parseInt(birth.substring(0,4));
		  			var a=year-b;
		  			if(a<=0){
		  				$("#z5").html("请选择正确的时间");
		  				$("#c4").attr("disabled","disabled");
		  				return;
		  			}else{
						$("#c4").attr("disabled",false);
					}
		  		}  
  			});
 		
			$("#c4").live('click',function(){
				var chid=$("#cid").html();
	 			var tel1=$("#ctel").val();
	 			var sex1=$("input[name='sex1']:checked").val();
	 			var le1=$("#sel1").val();
	 			var cbirth=$("#cbirth").val().substring(0,10);
	 			var cpwd=$("#cpwd1").val();
	 			var name2=$("#cname").val();
	 			
	 			if(name2==""||tel1==""||cbirth==""||cpwd==""){
					alert("输入有误,不能为空！");
					return;
				}
				
  					 $.ajax({
	  				type:"post",
	  				url:"vips/pwd.do",
	  				data: {"id":chid},
	  				dataType:"html",
	  				success:function(result){
	  				var pp=result;
	  				return;
	  				}
	  			});	
  			
  			
			 $.ajax({
	  				type:"post",
	  				url:"vips/change.do",
	  				data: {"id":chid,"name":name2,"tel":tel1,"sex":sex1,"v_level":le1,"pwd":cpwd,"birthday":cbirth}, //请求的参数 
	  				dataType:"html",
	  				success:function(result){
	  				}
	  			});	
		    $("#bian").css("display","none");
			$("#hide").css("display","none");
			alert("修改成功！");
			});
 		});
 		
 		//停用
 		$("#tingbtn").live('click',function(){
 		$("#infom").html("");
 			$("#ting").css("display","block");
 			$("#hide").css("display","block");
 			$("#c5").live('click',function(){
 				if($("#kas").html().trim()=="停用")
 				{
 					$("#infom").html("该卡已停用！");
 					$("#ting").css("display","none");
 					$("#hide").css("display","none");
 					return;
 				}
 				var t1=$("#cid").html();
 				 $.ajax({
		  				type:"post",
		  				url:"vips/stop.do",
		  				data: {"id":t1}, 
		  				dataType:"json",
		  				success:function(result){
		  					$("#vipinfo").html(result);
		  				}
		  			});	
 				$("#ting").css("display","none");
 				$("#hide").css("display","none");
 				alert("操作成功！");
 				return;
 			});
 		});
 		
 		//删除
 		$("#shanbtn").live('click',function(){
 			$("#infom").html("");
 			$("#shan").css("display","block");
 			$("#hide").css("display","block");
 			$("#c6").live('click',function(){
	 			var s1=$("#cid").html();
	 			if($("#kas").html().trim()!="停用")
 				{
 					$("#infom").html("该卡未停用，请停用后再删除！");
 					$("#shan").css("display","none");
 					$("#hide").css("display","none");
 					return;
 				}
	 				 $.ajax({
			  				type:"post",
			  				url:"vips/del.do",
			  				data: {"id":s1}, 
			  				dataType:"json",
			  				success:function(result){
			  					$("#vipinfo").html(result);
			  				}
			  			});	
	 				$("#shan").css("display","none");
	 				$("#hide").css("display","none");
	 				alert("删除成功！");
	 				return;
 			});
 			
 		});
 		 
 		 //添加
 		 $("#addvip").click(function(){
 		 	 var typeid=$("#sel").val();
 			 	$.ajax({
		  				type:"post",
		  				url:"vip/money.do",
		  				data: {"id":typeid},  
		  				dataType:"html",
		  				success:function(result){
		  					$("#needmoney").attr("value",result);
		  				}
		  			});	
 		 });
 		 
});
</script>
	<div id="empty" style="position: absolute;left:85%;top:32%;font-size: 20px;background: #00BB6E;color:white;">
		<c:if test="${empty vip1}">
	  			<c:out value="请先开始搜索"></c:out>
	  	</c:if>
  	</div>
  	
  	<%-- <div id="empty" style="position: absolute;">
		<c:if test="${empty vip1 or empty vip2}">
	  			<c:out value="没有"></c:out>
	  	</c:if>
  	</div> --%>
  		
	<!-- 会员充值 --> 
	<div id="chongzhi" class="tanchu">
		<div class="top">
			<div class="tl">
				会员充值记录查询
			</div>
			<div class="tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		
		<div class="mid">
			<div style="margin-left: 150px;margin-top: 60px;">充值的卡号：
				<input type="text" id="chongka" disabled="disabled">
			</div>
			<div style="margin-left: 150px;margin-top: 30px;">充值的金额：
				<input type="text" id="chongjin" onkeyup="this.value=this.value.replace(/\D/g,'')">
			</div>
			
		</div>
		<div class="foot">
			<div class="col-md-4 column">
			 	<button type="button" class="btn btn-default sure" id="c1">确定</button>
			</div>
			<div class="col-md-4 column">
				<button type="button" class="btn btn-default canc" >取消</button>
			</div>
		</div>
	</div>
	
	<!-- 充值记录 --> 
	<div id="chongji" class="tanchu">
		<div class="top">
			<div class="tl">
				充值记录
			</div>
			<div class="tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		
		<div class="mid">
		<table class="tabhead">
				<tr>
					<td>编号</td>
					<td>卡号</td>
					<td>时间</td>
					<td>类型</td>
					<td>金额</td>
					<td>操作人员</td>
				</tr>
			</table>
			<div id="chong1" style="height: 450px;width:800px;">
			<table id="chongjit" >
			
			</table>
			</div>
		</div>
	</div>
	
	<!-- 消费记录 --> 
	<div id="xiaoji" class="tanchu">
		<div class="top">
			<div class="tl">
				消费记录
			</div>
			<div class="tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		
		<div class="mid">
			<table class="tabhead">
				<tr>
					<td>编号</td>
					<td>卡号</td>
					<td>时间</td>
					<td>类型</td>
					<td>金额</td>
					<td>操作人员</td>
				</tr>
			</table>
			<div id="xiao1" style="height: 450px;width:800px;">
			<table id="xiaojit">
				
			</table>
			</div>
		</div>
	</div>
	
	<!-- 编辑会员 --> 
	<div id="bian" class="tanchu" style="height:420px;display:none;">
		<div class="top">
			<div class="tl">
				编辑会员信息
			</div>
			<div class="tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		
		<div class="mid">
			<table id="ctab">
				<tr>
					<td>姓名：</td>
					<td><input type="text" id="cname"></td>
					<td id="z1"></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td><input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" id="ctel"></td>
					<td id="z2"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" name="sex1" value="0" checked="checked">先生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex1" value="1">女士
					</td>
					<td></td>
				</tr>
				<tr>
					<td>等级：</td>
					<td>
						<select id="sel1" style="width:100px;">
							<c:forEach items="${vs}" var="vs1" >
								<option value="${vs1.id}">
									${vs1.name}
								</option>
							</c:forEach>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input type="text" class="demo" readonly="readonly" id="cbirth"></td>
					<td id="z5"></td>
				</tr>
				<tr>
					<td>原密码：</td>
					<td><input type="password" id="cpwd"></td>
					<td id="z6"></td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td><input type="password" id="cpwd1"></td>
					<td id="z7"></td>
				</tr>
			</table>
<!-- 		
			<div style="margin-left: 150px;margin-top: 60px;background: green">
				
			</div>
			<div style="margin-left: 150px;margin-top: 30px;">
				电话：
			</div>
			<div style="margin-left: 150px;margin-top: 30px;">
				性别：
			</div>
			<div style="margin-left: 150px;margin-top: 30px;">
				
			</div>
			<div style="margin-left: 150px;margin-top: 30px;">
				密码：
			</div>
			<div style="margin-left: 150px;margin-top: 30px;">
				生日：
			</div> -->
			
		</div>
		<div class="foot">
			<div class="col-md-4 column">
			 	<button type="button" class="btn btn-default sure" id="c4">确定</button>
			</div>
			<div class="col-md-4 column">
				<button type="button" class="btn btn-default canc" >取消</button>
			</div>
		</div>
	</div>
	
	<!-- 停用会员 --> 
	<div id="ting" class="tanchu">
		<div class="top">
			<div class="tl">
				会员停用
			</div>
			<div class="tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		
		<div class="mid" style="text-align: center;font-size: 20px;padding-top: 100px;height: 130px;color: red">
				停用该会员卡号并退返余额？
		</div>
		<div class="foot">
			<div class="col-md-4 column">
			 	<button type="button" class="btn btn-default sure" id="c5">确定</button>
			</div>
			<div class="col-md-4 column">
				<button type="button" class="btn btn-default canc" >取消</button>
			</div>
		</div>
	</div>
	
	<!-- 删除会员 --> 
	<div id="shan" class="tanchu">
		<div class="top">
			<div class="tl">
				删除会员
			</div>
			<div class="tr">
				<img src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		
		<div class="mid" style="text-align: center;font-size: 20px;padding-top: 100px;height: 130px;color: red">
				确认删除该会员并删除所有充值及消费记录？
		</div>
		<div class="foot">
			<div class="col-md-4 column">
			 	<button type="button" class="btn btn-default sure" id="c6">确定</button>
			</div>
			<div class="col-md-4 column">
				<button type="button" class="btn btn-default canc" >取消</button>
			</div>
		</div>
	</div>
	
	
	<!-- 主界面弹出 -->
	
	<!-- 添加会员 -->
	<div id="adding">
		<div id="a-top">
			<div id="a-tl">
				添加会员
			</div>
			<div id="a-tr">
				<img id="a-tri" src="images/vip/i-cha.jpg"></img>
			</div>
		</div>
		<!-- <form action="" id="sub" method="get"> -->
		<div id="a-mid">
			<table border="0" height="350" width="520">
				<tr>
					<td>会员姓名：</td>
					<td width="20"><input type="text" id="vname"></td>
					<td id="nameErr"></td>
				</tr>
				<tr>
					<td>会员性别：</td>
					<td><input type="radio" name="sex" value="0" checked="checked">先生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="1">女士
					</td>
					<td></td>
				</tr>
				<tr>
					<td>联系方式：</td>
					<td><input type="text" id="vtel"></td>
					<td id="telErr"></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td id="demo_inp1"><input type="text" readonly="readonly" id="birth"></td>
					<td id="birthErr"></td>
				</tr>
				<tr>
					<td>会员卡号：</td>
					<td><input type="text" id="vid" value="${id}"></td>
					<td id="idErr"></td>
				</tr>
				<tr>
					<td>会员类型：</td>
					<td>
						<select id="sel" onchange=changemoney()>
							<c:forEach items="${vs}" var="vs" >
								<option value="${vs.id}">
									${vs.name}
								</option>
							</c:forEach>
						</select>
					</td>
					<td></td>
					
				</tr>
				<tr>
					<td>需要充值：</td>
					<td>
						<input type="text" id="needmoney">
					</td>
					<td><!-- <input type="button" id="flushmoney" class="btn btn-default" value="点击查询"> --></td>
					
				</tr>
				<tr>
					<td>设置密码：</td>
					<td><input type="password" name="password" id="pwd1"></td>
					<td id="pwd1Err"></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="password" name="password" id="pwd2"></td>
					<td id="pwd2Err"></td>
				</tr>
			</table>
		</div>
		<div id="a-foot">
			<div class="col-md-4 column">
			 	<button type="button" class="btn btn-default" id="qued">确定</button>
			</div>
			<div class="col-md-4 column">
				<button type="button" class="btn btn-default" id="qux">取消</button>
			</div>
		</div>
		<!-- </form> -->
	</div>
	
	
    <div id="box">
    	<div id="left">
    		<div id="vip">
	    		<div id="addvip">
	    			<img src="images/vip/addvip.jpg"></img>
	    			
	    		</div>
	    		<div id="vipmanage">
	    			<img src="images/vip/i-vipman.jpg"></img>
	    		</div>
	    	</div>
	    	
	    	<div id="search">
	    		<div id="chakuang">
	    			<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" id="td" value="输入手机号、会员卡号查找" >
	    		</div>
	    		<div id="chazhao">
	    			<img src="images/vip/i-chazhao.jpg"></img>
	    		</div>
	    	</div>
	    	
    	</div>
    	<div id="right">
    		<div id="vipinfo">
	    		
    		</div>
    		<div id="infom" style="position:absolute;font-size: 20px;font-weight: bold;left:75%;top:84%;
    		text-align: center;width:25%;height:14%;background:#00BB6E;line-height: 200px;border-radius:5px;">	
    		</div>
    	</div>
    </div>
  </body>
  <script>
	function changemoney(){
	var typeid=$("#sel").val();
	$.ajax({
				type:"post",//请求方式
				url:"vip/money.do",//请求地址
				data: {"id":typeid}, //请求的参数 
				dataType:"html",//响应的数据格式html/script/json/jsonp
				success:function(result){//回调函数:当ajax正常响应时要做的处理
				$("#needmoney").attr("value",result);
				}
			});
}	
  </script>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'kuaican.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/xfr/kuaican.css">
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

  </head>
  
  <body >
  <div id="box">
  <form action="Kuaican/zuofei.do" method="post" id="ifm">
  <input type="hidden" name="state" id="sss">
  <input type="hidden" name="type" value="0">
  <input type="hidden" name="tid" value="${zl.id }">
    <div id="top">
    	<div id="info_left">
    		<table cellpadding="0" cellspacing="0">
    			<tr>
    				<td><a href="tangshi/findAllCanTai.do"><img src="images/xfr/26.jpg"></a></td>
    				<td><img src="images/xfr/29.jpg"></td>
    				<td>&nbsp;<label>${zl.tablename }----${zl.eatnum }人</label></td>
    			</tr>
    		</table>    	
    	</div>
    	<div id="info_right">
    		<table border="0" cellpadding="0" cellspacing="5">
    			<tr>
    				<td width="95px"><img src="images/xfr/27.jpg"></td>
    				<td width="95px"><img src="images/xfr/28.jpg"></td>
    			</tr>
    		</table>
    	</div>
    	</div>
    	<div style="clear: both;height:675px;">
    			
	    		<div id="msg_1">		    	    	
		    		<div id="msg_1_top">
		    			<div >单号：<label id="danhao">${zl.id }</label></div>
		    			<div >已点<label id="allnum">${allnum }</label>项，合计：<label id="allpay">${zl.paymoney }</label></div>
		    		</div>
		    		<c:forEach items="${lists }" var="l">
		    			<div class="msg_1_list" >
			    			<div class="m1l" id="${l.id}">
			    				<div class="in" style="width:50%"><img src="images/xfr/8.jpg">${l.cainame }</div>
			    				<div class="in" style="width:25%"><label class="num">${l.num }</label>*份</div>
			    				<div class="in" style="width:25%">￥<label class="pay">${l.money }0</label></div>
			    			</div>
			    			<div class="beizhu">${l.info }</div> 
			    		</div>	
		    		</c:forEach>	    		
	    		</div>
	    	 
	    	<div id="msg_2">
	   			<div><img src="images/xfr/9.jpg"></div>
	   			<div><img src="images/xfr/10.jpg"></div>
	   			<div><img src="images/xfr/11.jpg"></div>
	   			<div><img src="images/xfr/30.jpg"></div>
	    	</div> 
	    	<div id="msg_3">
	    		<c:forEach items="${foods}" var="f">
	    			<c:if test="${f.isguqing==0 }">
	    				<div class="cai">
			    			<div style="font-weight: bold;font-size:16px; height:35px ;padding-top: 20px; ">${f.name}</div>
			    			<div style="font-size: 12px;">￥${f.price }0</div>
			    		</div>
	    			</c:if>
	    			<c:if test="${f.isguqing==1 }">
	    				<div class="cai1">
			    			<div style="font-weight: bold;font-size:16px; height:35px ;padding-top: 20px; ">${f.name}</div>
			    			<div style="font-size: 12px;">￥${f.price }0</div>
			    		</div>
	    			</c:if>
	    		</c:forEach>    		
	    	</div> 
	    	<div id="msg_4">
	    		<div><img src="images/xfr/12.jpg"></div>
	    		<div class="type" style="color:green;border-left:3px solid green;background: white;" id="0">全部</div>
	    		<c:forEach items="${cts }" var="ck">
	    			<div class="type" id="${ck.id }"><label>${ck.name }</label></div>
	    		</c:forEach>
	    	</div>
    	</div> 
    
    </form>
  </div>
  <div id="cover"></div>
  <div id="confirm">
  		<br>
  	  	<h3>菜单中有未下单的菜品是否直接下单支付？</h3><br><br>
  	  	<input type="button" value="确认" id="conque" style="height:40px;width:100px;background: #00B944;margin-left: 20px;border: none;color:white;cursor: pointer;font-family: 微软雅黑;">
  	  	<input type="button" value="取消" id="conno" style="height:40px;width:100px;background: #00B944;margin-left: 20px;border: none;color:white;cursor: pointer;font-family: 微软雅黑;">
  </div>
  <div id="showinfo">
  	<div style="width:100%;height:350px;" id="dd">  		
  		<c:forEach items="${yqs }" var="y">
  			<div class="ss" style="width:100px;height:35px;cursor: pointer;background: white; border-radius:5px;margin-top: 10px;margin-left: 15px;text-align: center;padding-top: 5px;display: inline-block;">${y.name }</div>
  		</c:forEach>
  		
  	</div>
  	<div style="width:100%;height:45px;background: white;padding-top: 5px;">
  		&nbsp;&nbsp;自定义特殊要求：<input type="text" style="width:40%;height:40px;margin-left: 10px;" placeholder="自定义要求">
  		<input id="que" type="button" value="确定" style="height:40px;width:100px;background: #00B944;margin-left: 20px;border: none;color:white;cursor: pointer;">
  	</div>  	
  </div>
  <div id="showliyou">
  	<div style="width:100%;height:350px;" id="ddw">  		
  		<c:forEach items="${lys }" var="y">
  			<div class="ssw" style="width:100px;height:35px;cursor: pointer;background: white; border-radius:5px;margin-top: 10px;margin-left: 15px;text-align: center;padding-top: 5px;display: inline-block;">${y.name }</div>
  		</c:forEach>
  		
  	</div>
  	<div style="width:100%;height:45px;background: white;padding-top: 5px;">
  		&nbsp;&nbsp;自定义理由：<input type="text" style="width:40%;height:40px;margin-left: 10px;" placeholder="自定义理由">
  		<input id="quee" type="button" value="确定" style="height:40px;width:100px;background: #00B944;margin-left: 20px;border: none;color:white;cursor: pointer;">
  	</div>  	
  </div>
  <div id="showedit">
  	&nbsp;&nbsp;请输入菜品数量：<input type="text" style="width:150px;height:40px;" value="1">
  	<input id="que1" type="button" value="确定" style="height:40px;width:100px;background: #00B944;margin-left: 20px;border: none;color:white;cursor: pointer;">
  </div> 
  </body>
  <script type="text/javascript">
  var tid=0;//定义一个变量保存当前选中的菜系id
  var index=0;//定义一个全局变量保存菜品清单数  
  var h=$(window).height()+"px";
  var w=$(window).width()+"px";
  	$(function(){
  		/* var danhao="";
  		var myDate = new Date();
		//获取当前年
		var year=myDate.getFullYear();
		//获取当前月
		var month=myDate.getMonth()+1;
		//获取当前日
		var date=myDate.getDate(); 
		var h=myDate.getHours();       //获取当前小时数(0-23)
		var m=myDate.getMinutes();     //获取当前分钟数(0-59)
		var s=myDate.getSeconds(); 
		danhao="K"+year+month+date+h+m+s;
		$("#danhao").html(danhao); */
		//对当前清单的操作(下单)
		$("#info_right").find("td:eq(0)").click(function(){
			//alert("下单");
			save(2);
		});
		//结账
		$("#info_right").find("td:eq(1)").click(function(){
			
			save(1);
		});
  		//菜品分类
  		$(".type").click(function(){  
  			tid=$(this).attr("id");			
  			$(this).css({"color":"green","border-left":"3px solid green","background":"white"});
  			$(".type").not(this).css({"color":"black","border-left":"none","background":"#F5F5F5"});
  			var i=$(this).attr("id");
			//显示全部菜品
			$.ajax({
				method:"get",
				dataType:"html",
				url:"Tdiandan/showByType.do",
				data:{"typeid":i},
				success:function(result){
					$("#msg_3").html(result);
				}  			
			}); 			
  		});  		
  	});
  	$(".cai1").live('click',function(){
  		alert("该菜品已经售完！");
  	});
  	//点菜
  	$(".cai").live('click',function(){
  		var cainame=$(this).find("div:first").html();
  		var price=$(this).find("div:last").html().substring(1);
  		var img=$("<img/>");
  		img.attr("src","images/xfr/8.jpg");
  		var d1=$("<div></div");
  		d1.css("width","50%");
  		d1.append(img);
  		d1.append(cainame);
  		var d2=$("<div></div");
  		d2.css("width","25%");
  		var la=$("<label class='"+"num"+"'>"+1+"</label>");
  		d2.append(la);
  		d2.append("*份");
  		var d3=$("<div></div");
  		d3.css("width","25%");
  		var la2=$("<label class='"+"pay"+"'>"+price+"</label>");
  		d3.append("￥");
  		d3.append(la2);
  		var d4=$("<div></div");
  		d4.attr("class","m1l");
  		d4.append(d1);
  		d4.append(d2);
  		d4.append(d3);
  		var d5=$("<div></div");
  		d5.attr("class","beizhu");
  		var d6=$("<div></div");
  		d6.attr("class","msg_1_list");
  		var inp=$("<input  type='hidden' name='"+"lists["+index+"].cainame"+"'value='"+cainame+"'/>");
  		var inp1=$("<input type='hidden' name='"+"lists["+index+"].num"+"'value='"+1+"'/>");
  		var inp2=$("<input type='hidden' name='"+"lists["+index+"].listid"+"'value='"+$("#danhao").html()+"'/>");
  		var inp3=$("<input type='hidden' name='"+"lists["+index+"].money"+"'value='"+price+"'/>");
  		var inp4=$("<input type='hidden' name='"+"lists["+index+"].info"+"'value='"+""+"'/>");
  		d6.append(inp);
  		d6.append(inp1);
  		d6.append(inp2);
  		d6.append(inp3);
  		d6.append(inp4);
  		d6.append(d4);
  		d6.append(d5);
  		d6.appendTo($("#msg_1")); 
  		jisuan(cainame,1); 
  		refersh(1,parseInt(price)); 	
  		index++;
  	});
  	//选中菜品
  	$(".msg_1_list").live('click',function(){
  		$(this).css({"background":"#D5EAFF"}).attr("id","select");
  		$(".msg_1_list").not(this).css({"background":"white"}).attr("id","no");
  	});
  	//编辑菜品
  	$("#msg_2 img:eq(0)").click(function(){ 
  		var s=true;
  		var id;
  		var obj;
  		$(".msg_1_list").each(function(){
  			if($(this).attr("id")=="select"){ 
  				s=false;
  				obj=$(this);
  				id=$(this).find(".m1l").attr("id");
  			}
  		});
  		if(s){
  			//未选中
  			alert("请先选中菜品！");
  		}else{
  			if(typeof(id)!="undefined"){
  				alert("已下单的菜品不能编辑！");
  			}else{ 				
  				$("#cover").css({"display":"block"});
  				$("#showedit").css({"display":"block"});
  			}
  		}  		
  	});
  	//提交编辑
  	$("#que1").click(function(){  		
  		var res=$(this).prev().val();
  		var num=res;
  		if(isNaN(parseInt(res))){
  			//输入的字符串不能转化为数字
  			alert("错误的格式！");
  			return;
  		}else{
  			if(res.indexOf(".")!=-1){
  				//输入的是小数，就只取整数部分
  				num=res.substring(0,res.indexOf("."));
  			}else{
  				num=res;
  			}
  		}
  		//遍历获取被选中的菜品
  		/* var s=true;  */ 		
  		$(".msg_1_list").each(function(){
  			if($(this).attr("id")=="select"){ 
  				//s=false;
  				var $o=$(this);
  				//获取该菜品的单价 
  				var danjia=($(this).find(".pay").html())/($(this).find(".num").html());	
  				//获取增加的数量
  				var x=num-parseInt($(this).find(".num").html());
  				//获取菜名
  				var cainame=$(this).find("div:eq(0)").find("div:eq(0)").text();
  				$.ajax({
  					method:"post",
  					dataType:"html",
  					url:"Tdiandan/checkNum.do",
  					data:{"cainame":cainame},
  					success:function(result){ 
  						if(x>=result){
  							x=parseInt(result); 
  							num= parseInt(result)+parseInt($o.find(".num").html());  														
  						}
						//修改该菜品的数量		
		  				$o.find(".num").html(num);
		  				$o.find("input:eq(1)").val(num);
		  				//修改该菜品的总金额
		  				$o.find(".pay").html(num*danjia+".00");
		  				$o.find("input:eq(3)").val(num*danjia);
  												
  						//获取改变的金额
		  				var y=x*danjia;
		  				refersh(x,y);
		  				jisuan($o.find(".m1l").find("div:eq(0)").text(),x);
		  				return;
  					}
  				});
  				
  			};
  		});  		
  		var res=$(this).prev().val("1");
  		$("#cover").css({"display":"none"});
  		$("#showedit").css({"display":"none"});
  	});
  	//移除菜品
  	$("#msg_2 img:eq(1)").click(function(){
  		
  		var s=true;  		
  		$(".msg_1_list").each(function(){
  			if($(this).attr("id")=="select"){ 
  				s=false; 
  				var id=$(this).find(".m1l").attr("id");
  				if(typeof(id)!="undefined"){
  					alert("已下单的菜品不能删除！");
  				}
  				else{
	  				var x=parseInt($(this).find(".num").html());	
	  				var y=parseInt($(this).find(".pay").html());	
	  				$(this).remove();
	  				index--;
	  				refersh(-x,-y);  				
	  				jisuan($(this).find(".m1l").find("div:eq(0)").text(),-x);
	  				return;
  				}
  			};
  		});
  		if(s){
  			alert("请选择要删除的菜品！");
  		}
  	});	
  	//点击特殊要求
  	$("#msg_2 img:eq(2)").click(function(){
  		var s=true;
  		var id;
  		var obj;
  		$(".msg_1_list").each(function(){
  			if($(this).attr("id")=="select"){ 
  				s=false;
  				obj=$(this);
  				id=$(this).find(".m1l").attr("id");
  			}
  		});
  		if(s){
  			//未选中
  			alert("请先选中菜品！");
  		}else{
  			if(typeof(id)!="undefined"){
  				alert("已下单的菜品不能添加要求！");
  			}else{ 				
  				$("#cover").css({"display":"block"});
  				$("#showinfo").css({"display":"block"});
  			}
  		} 		
  	});
  	
  	//选择要求
  	$("#dd div").click(function(){
  		if($(this).attr("id")!="slc"){
  			$(this).css({"background":"#00B944"}).attr("id","slc");
  		}else{
  			$(this).css({"background":"white"}).attr("id","");
  		}
  	});
  	//选择理由
  	$("#ddw div").click(function(){
  		if($(this).attr("id")!="slc"){
  			$(this).css({"background":"#00B944"}).attr("id","slc");
  		}else{
  			$(this).css({"background":"white"}).attr("id","");
  		}
  	});
  	//提交要求
  	$("#que").click(function(){
  		var res=$(this).prev().val();
  		$("#dd div").each(function(){
  			if($(this).attr("id")=="slc"){
  				res+=$(this).html()+"/";
  			}
  		});  		
  		$(".msg_1_list").each(function(){
  			if($(this).attr("id")=="select"){
  				$(this).find(".beizhu").html(res);
  				$(this).find("input:eq(4)").val(res); 
  				$("#dd div").css({"background":"white"}).attr("id","");  		
		  		$("#cover").css({"display":"none"});
		  		$("#showinfo").css({"display":"none"});
  				return;
  			}
  		}); 		
  	});
  	//点击显示退菜理由
  	$("#msg_2 img:eq(3)").click(function(){
  		var s=true;
  		var id;
  		var obj;
  		var beizhu;
  		$(".msg_1_list").each(function(){
  			if($(this).attr("id")=="select"){ 
  				s=false;
  				obj=$(this);
  				id=$(this).find(".m1l").attr("id");
  				beizhu=$(this).find(".beizhu").html();
  			}
  		});
  		if(s){
  			//未选中
  			alert("请先选中菜品！");
  		}else{
  			if(typeof(id)=="undefined"){
  				alert("未下单的菜品不能退菜！");
  			}else{
  				if(beizhu.indexOf("退菜")!=-1){
  					alert("已退的菜品不能再退！");
  				}else{
  					$("#cover").css("display","block");
  				$("#showliyou").css("display","block"); 
  				}
  				
  			}
  		}
  	});
  	//提交退菜
  	$("#quee").click(function(){
  		var msg="是否确认退菜?";
  		if(confirm(msg)==true){
  			$("#cover").css("display","none");
	  		$("#showliyou").css("display","none");
	  		var id;
	  		$(".msg_1_list").each(function(){
	  			if($(this).attr("id")=="select"){ 
	  				id=$(this).find(".m1l").attr("id");
	  			}
	  		});
	  		var res=$(this).prev().val();
	  		$("#ddw div").each(function(){
	  			if($(this).attr("id")=="slc"){
	  				res+=$(this).html()+"*";
	  			}
	  		});
	  		window.location="Tdiandan/tuicai.do?id="+id+"&liyou="+res;
	  		
  		}else{
  			$("#cover").css("display","none");
	  		$("#showliyou").css("display","none");
  		}
  		
  	});
  	//更新总共点的菜品数量，以及总金额
  	function refersh(num, pay){
  		var newnum=parseInt($("#allnum").html())+num;
  		var newpay=parseInt($("#allpay").html())+pay;
  		$("#allnum").html(newnum);
  		$("#allpay").html(newpay+".00");
  	}
  	//实时查询
  	function jisuan(cainame,num){
  		$.ajax({
  			method:"post",
  			dataType:"html",
  			url:"Kuaican/jisuan.do",
  			data:{"cainame":cainame,"num":num,"typeid":tid},
  			success:function(result){
  				$("#msg_3").html(result);
  			}
  		}); 		
  	}
  	//确认结账
  	$("#conque").click(function(){
  		$("#ifm").attr("action","Tdiandan/jiezhang.do");		
		$("#ifm").submit();
  	});
  	//取消结账
  	$("#conno").click(function(){
  		$("#cover").css("display","none");
		$("#confirm").css("display","none");
  	});
  	//保存订单
  	function save(index1){
  		if($("#msg_1_top").next().html()==null){
				alert("当前没有点菜信息！");
			}else if(index==0 && index1==2){
				alert("当前没有点菜信息！");
			}else{		
				if(index1==1){
					//结账
					if(index==0){
						$("#ifm").attr("action","Tdiandan/jiezhang.do");
						/* $("#sss").val("0"); */						
					}else{
						$("#cover").css("display","block");
						$("#confirm").css("display","block");
						return ;
					}
		  		}else if(index1==2){
		  			//下单
		  			$("#ifm").attr("action","Tdiandan/zuofei.do");
					$("#sss").val("0");
		  		}					
				$("#ifm").submit();
			} 		
  	}
  </script>
</html>

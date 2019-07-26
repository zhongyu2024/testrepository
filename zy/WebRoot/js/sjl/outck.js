var url;
$("#rbody3 .change").mouseenter(function(){
	url=$(this).find("img").attr("src").substr(0,$(this).find("img").attr("src").indexOf('.'));
	$(this).find("img").attr("src",url+'1'+".jpg");
	$(this).css({"background":"#cccccc","color":"#354148"});
}).mouseleave(function(){
	$(this).find("img").attr("src",url+".jpg");
	$(this).css({"background":"white","color":"black"});
});


$("#rbody3 .ddd tr").css("background","#FFFFFF");
$("#rbody3 .ddd tr").eq(0).css("background","#DBE4ED");
var cid=$("#rbody3 .ddd tr").eq(0).find(".cid").text();
$("#rbody3 .ddd tr").click(function(){
	$(this).css("background","#DBE4ED");
	$(this).siblings().css("background","#FFFFFF");
	cid=$(this).find(".cid").text();
});

$(function(){
    $("#rbody3 .time").calendar();
});

var name;
$("#rbody3 .change").click(function(){
	var id="#rbody3 #change"+($(this).index()+1);
	$(id).css("display","block");
	$("#rbody3 #hidden1").css("display","block");
	name=$(id).find(".name").val();
	/*alert("111");*/
	$.ajax({
		url:"outCangku/tianjiaajax.do",
  		dataType:"html",
  		success:function(result){
  			$("#rbody3 #out-tj").html(result);
		}
	});
	/*alert($("#rbody2 #in-id").val())*/
	if($("#rbody3 #out-id").val().length==0){
		/*alert("cc");*/
		$.ajax({
			url:"outCangku/tianjiaajax.do",
	  		dataType:"html",
	  		success:function(result){
	  			$("#rbody3 #out-tj").html(result);
			}
		});
	}
});
var id=$("#rbody3 #out-lsid").val();
var cangkuid=$("#rbody3 #ckname").val();
var outtime=$("#rbody3 #outtime").val();
var doman=$("#rbody3 #buyman").val();
var info=$("#rbody3 #out-outinfo").val();
$("#rbody3 #sub1").click(function(){
	/*var count=$("#matertable").find("tr").length;
	alert(count);*/
	if($("#rbody3 #change1").find("#ckname").val()==0)
	{
		alert("请选择仓库");
	}else if($("#rbody3 #change1").find("#givername").val()==0)
	{
		alert("请选择供应商");
	}else if($("#rbody3 #change1").find("#buyman").val()==0)
	{
		alert("请选择操作员");
	}/*else if($("#rbody3 #change1").find("#inman").val()==0)
	{
		alert("请选择收货员")
	}*/else if($("#rbody3 #matertable").find("tr").length==1)
	{
		alert("请填写出库商品明细");
	}else{
		$("#rbody3 #change1").css("display","none"); 
		$("#rbody3 #hidden1").css("display","none");
		/*$("#change1 form").submit();*/
		id=$("#rbody3 #out-lsid").val();
		cangkuid=$("#rbody3 #ckname").val();
		outtime=$("#rbody3 #outtime").val();
		doman=$("#rbody3 #buyman").val();
		info=$("#rbody3 #out-outinfo").val();
		$.ajax({
			url:"outCangku/addCangkucun.do",
	  		dataType:"html",
	  		data:{
	  			"id":$("#rbody3 #out-lsid").val(),
	  			"cangkuid":$("#rbody3 #ckname").val(),
	  			"outtime":$("#rbody3 #outtime").val(),
	  			"doman":$("#rbody3 #buyman").val(),
	  			"info":$("#rbody3 #out-outinfo").val()
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-zhut").html(result);
			}
		});
		
		
		$("#rbody3 #ckname").val("");
		$("#rbody3 #givername").val("");
		$("#rbody3 #buyman").val("");
		$("#rbody3 #out-mx").html("");
	}
});
$("#rbody3 #res1").click(function(){
	$("#rbody3 #ckname").val("");
	$("#rbody3 #givername").val("");
	$("#rbody3 #buyman").val("");
	$("#rbody3 #out-mx").html("");
	
	$.ajax({
		url:"outCangku/deleteOutCailao.do",
  		dataType:"html",
  		data:{
  			"ckid":$("#rbody3 #out-lsid").val()
  		},
  		success:function(result){
  			$("#rbody3 #out-zhut").html(result);
		}
	});
	
	
	
	
	/*
	$("#rbody3 #inman").val("");*/
	$("#rbody3 #change1").css("display","none"); 
	$("#rbody3 #hidden1").css("display","none");
});

/*$("#sub2").click(function(){
	/*ajax更新取值*/
	
	/*if($("#change2").find(".name").val().trim().length==0)
	{
	alert("请输入名称,不可为空格");
	$("#change2").find(".name").val(name);
}else {
	$("#change2 form").submit();
}
});
$("#res2").click(function(){
	$("#change2").css("display","none");
	$("#hidden").css("display","none");
});*/

$("#rbody3 #res3").click(function(){
	$("#rbody3 #change3").css("display","none");
	$("#rbody3 #hidden1").css("display","none");
});

$("#rbody3 #sub4").click(function(){
	$("#rbody3 #newmater").css("display","block");
	$("#rbody3 #hidden1").css("z-index","4");
	
});

var hwname;
var hwid;
var hwdw;
var hwnum;
$("#rbody3 .cailiao").click(function(){
	if($("#rbody3 #change1").find("#ckname").val()==0)
	{
		alert("请选择仓库");
	}else{
	$("#rbody3 #choose").css("display","block");
	$.ajax({
		url:"outCangku/cailiaoAjax.do",
  		dataType:"html",
  		data:{"ckid":$("#rbody3 #change1").find("#ckname").val()},
  		success:function(result){
  			$("#rbody3 #chtable1").html(result);
		}
	});
	
	}
	
});

/*$("#rbody3 .ccl").click(function(){
	$(this).css("background","#E8E8E8");
	$(this).siblings().css("background","none");
	hwname=$(this).find(".hwname").text();
	hwid=$(this).find(".hwid").text();
	hwdw=$(this).find(".dw").text();
	alert(hwid+"---"+hwname);
});*/

$("#rbody3 .queren").click(function(){
	$("#rbody3 #choose").css("display","none");
	$("#rbody3 .cailiao").val(hwname);
	$("#rbody3 .cailiaoid").val(hwid);
	$("#rbody3 .cailiaodw").val(hwdw);
	$("#rbody3 #clmoney").val(hwnum);
	/*
	
	$.ajax({
		url:"outCangku/cailiaoAjax.do",
  		dataType:"html",
  		data:{"ckid":$("#rbody3 #change1").find("#ckname").val()},
  		success:function(result){
  			$("#rbody3 #chtable1").html(result);
		}
	});
	
	*/
});

var rule=/^0\.{1}\d{1,2}$/;
/*var rule1=/^[1-9]\d*$/;
var rule2=/^[1-9]+(.\d{1,2})?$/;*/
$("#rbody3 #sub5").click(function(){
	/*var dd=rule.test($("#rbody3 #clmoney").val())||rule2.test($("#rbody3 #clmoney").val());*/
	/*alert($("#rbody3 #clnum").val()+"---"+hwnum);*/
	if($("#rbody3 .cailiao").val()==0)
	{
		alert("请选择材料");
	}else if(!rule1.test($("#rbody3 #clnum").val()))
	{
		alert("请正确输入数量");
	}else if(parseInt($("#rbody3 #clnum").val())>parseInt($("#rbody3 #clmoney").val())){
		
		alert("仓库内仅有"+$("#rbody3 #clmoney").val()+hwdw+",请重新输入");
	}else{
		$("#rbody3 #newmater").css("display","none"); 
		$("#rbody3 #hidden1").css("z-index","2");
		/*$("#change1 form").submit();*/
		/*alert($("#rbody3 .cailiaoid").val())*/;
		
		$.ajax({
			url:"outCangku/mingxiAjax.do",
	  		dataType:"html",
	  		data:{
	  			"ckid":$("#rbody3 #change1").find("#ckname").val(),
	  			"outckid":$("#rbody3 #out-lsid").val(),
	  			"num":$("#rbody3 #clnum").val(),
	  			"materialsid":$("#rbody3 .cailiaoid").val()
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-mx").html(result);
			}
		});
		$("#rbody3 .cailiao").val("");
		$("#rbody3 .cailiaoid").val("");
		$("#rbody3 .cailiaodw").val("");
		$("#rbody3 #clmoney").val("");
		$("#rbody3 #clnum").val("");
	}
});

$("#rbody3 #res5").click(function(){
	$("#rbody3 #newmater").css("display","none");
	$("#rbody3 #hidden1").css("z-index","2");
	$("#rbody3 .cailiao").val("");
	$("#rbody3 .cailiaoid").val("");
	$("#rbody3 .cailiaodw").val("");
	$("#rbody3 #clmoney").val("");
	$("#rbody3 #clnum").val("");
});


$("#rbody3 #res4").click(function(){
	alert(mxcid+"---"+mxmid+"---"+mxckid+"---"+mxnum)
	$.ajax({
		url:"outCangku/mingxiAjax.do",
  		dataType:"html",
  		data:{
  			"ckid":$("#rbody3 #change1").find("#ckname").val(),
  			"outckid":mxckid,
  			"num":mxnum,
  			"materialsid":mxmid,
  			"mid":mxcid,
  			"type":2
  		},
  		success:function(result){
  			$("#rbody3 #out-mx").html(result);
		}
	});
});

var ckid=$("#rbody3 #change1").find("#ckname").val();
var tt=$("#rbody3 .type").val();
var text=$("#rbody3 .text").val().trim();

$("#rbody3 #sscl").click(function(){
	if($("#rbody3 .type").val()!=0&&$("#rbody3 .text").val().trim().length==0)
	{
		alert("请输入搜索的关键字");
	}else if($("#rbody3 .type").val()==0&&$("#rbody3 .text").val().trim().length!=0)
	{
		alert("请选择搜索字段类型");
	}else {
		ckid=$("#rbody3 #change1").find("#ckname").val();
		tt=$("#rbody3 .type").val();
		text=$("#rbody3 .text").val().trim();
		$.ajax({
			url:"outCangku/cailiaoByType.do",
	  		dataType:"html",
	  		data:{"ckid":$("#rbody3 #change1").find("#ckname").val(),
	  			  "tt":$("#rbody3 .type").val(),
	  			  "text":$("#rbody3 .text").val().trim()
	  			},
	  		success:function(result){
	  			$("#rbody3 #chtable1").html(result);
			}
		});
		$("#rbody3 .type").val("");
		$("#rbody3 .text").val("");
	}
});
$("#rbody3 #topsub").click(function(){
	if($("#rbody3 #typez").val()!=0&&$("#rbody3 #textz").val().trim().length==0)
	{
		alert("请输入搜索的关键字");
	}else if($("#rbody3 #typez").val()==0&&$("#rbody3 #textz").val().trim().length!=0)
	{
		alert("请选择搜索字段类型");
	}else if(($("#rbody3 #time1").val()!=0&&$("#rbody3 #time2").val().trim().length==0)||($("#rbody3 #time1").val()==0&&$("#rbody3 #time2").val().trim().length!=0))
	{
		alert("请明确时间区间");
	}else{
		$.ajax({
			url:"outCangku/ajaxsearch.do",
	  		dataType:"html",
	  		data:{
	  			"time1":$("#rbody3 #time1").val(),
	  			"time2":$("#rbody3 #time2").val(),
	  			"tt":$("#rbody3 #typez").val(),
	  			"text":$("#rbody3 #textz").val()
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-zhut").html(result);
			}
		});
		
		$("#rbody3 #time1").val("");
		$("#rbody3 #time2").val("");
		$("#rbody3 #typez").val("");
		$("#rbody3 #textz").val("");
		
	}
});
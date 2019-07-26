var url;
$("#rbody1 .change").mouseenter(function(){
	url=$(this).find("img").attr("src").substr(0,$(this).find("img").attr("src").indexOf('.'));
	$(this).find("img").attr("src",url+'1'+".jpg");
	$(this).css({"background":"#cccccc","color":"#354148"});
}).mouseleave(function(){
	$(this).find("img").attr("src",url+".jpg");
	$(this).css({"background":"white","color":"black"});
});

$("#rbody1 .ddd tr").eq(0).css("background","#DBE4ED");
$("#rbody1 .ddd tr").eq(0).find("a").css("display","block");
var cid=$("#rbody1 .ddd tr").eq(0).find(".cid").text();
$("#rbody1 .ddd tr").click(function(){
	$(this).css("background","#DBE4ED");
	$(this).find("a").css("display","block");
	$(this).siblings().css("background","none");
	$(this).siblings().find("a").css("display","none");
	cid=$(this).find(".cid").text();
});

var name;
$("#rbody1 .change").click(function(){
	if($(this).index()==1){
		$("#rbody1 #c2id").val(cid);
		$.ajax({
			url:"Cangku/findById.do",
	  		dataType:"json",
	  		data:{"id":cid},
	  		success:function(result){
	  			var json = eval(result);
	  			$("#rbody1 #c2name").val(json[0].name);
	  			$("#rbody1 #c2info").val(json[0].info);
			},error:function(result){
				alert("获取数据失败，请重试");
			}
		});
		
	}
	var id="#rbody1 #change"+($(this).index()+1);
	$(id).css("display","block");
	$("#rbody1 #hidden1").css("display","block");
	name=$(id).find(".name").val();
	
});

$("#rbody1 #sub1").click(function(){
	if($("#rbody1 #change1").find(".name").val().trim().length>0)
	{
		$("#rbody1 #change1").css("display","none");
		$("#rbody1 #hidden1").css("display","none");
		/*$("#rbody1 #change1 form").submit();*/
		$.ajax({
			url:"Cangku/addNews.do",
	  		dataType:"html",
	  		data:{"name":$("#rbody1 .name").val(),"info":$("#rbody1 .info").val(),"page":$("#rbody1 #ck-page").val()},
	  		success:function(result){
	  			$("#rbody1 #rtitle").html(result);
			},error:function(result){
				alert("新增失败，请重试");
			}
		});
		$("#rbody1 .name").val("");
		$("#rbody1 .info").val("");
	}else{
		alert("请输入名称,不可为空格");
		$("#rbody1 #change1").find(".name").val("");
	}
});

/*function sendAjax()
{
	alert("send");
	$.ajax({
		url:"Cangku/addNews.do",
  		dataType:"html",
  		data:{"name":$("#rbody1 .name").val(),"info":$("#rbody1 .info").val(),"page":$("#rbody1 #ck-page").val()},
  		success:function(result){
  			$("#rbody1 #rtitle").html(result);
		}
	});
}
*/


$("#rbody1 #res1").click(function(){
	$("#rbody1 .name").val("");
	$("#rbody1 .info").val("");
	$("#rbody1 #change1").css("display","none");
	$("#rbody1 #hidden1").css("display","none");
});

$("#rbody1 #sub2").click(function(){
	/*ajax更新取值*/
	
	if($("#rbody1 #change2").find(".name").val().trim().length==0)
	{
		alert("请输入名称,不可为空格");
		$("#rbody1 #change2").find(".name").val(name);
	}else {
		/*$("#rbody1 #change2 form").submit();*/
		/*alert($("#rbody1 #c2id").val());*/
		$("#rbody1 #change2").css("display","none");
		$("#rbody1 #hidden1").css("display","none");
		$.ajax({
			url:"Cangku/updateById.do",
	  		dataType:"html",
	  		data:{"id":$("#rbody1 #c2id").val(),"name":$("#rbody1 #c2name").val(),"info":$("#rbody1 #c2info").val(),"page":$("#rbody1 #ck-page").val()},
	  		success:function(result){
	  			$("#rbody1 #rtitle").html(result);
			},
			error:function(result){
				alert("修改失败，请重试");
			}
		});
	}
});
$("#rbody1 #res2").click(function(){
	$("#rbody1 #change2").css("display","none");
	$("#rbody1 #hidden1").css("display","none");
});

$("#rbody1 #res3").click(function(){
	$("#rbody1 #hidden1").css("display","none");
	$("#rbody1 #change3").css("display","none");
});

$("#rbody1 #sub3").click(function(){
	$("#rbody1 #hidden1").css("display","none");
	$("#rbody1 #change3").css("display","none");
	/*alert(cid);*/
	$.ajax({
		url:"Cangku/deleteById.do",
			dataType:"html",
			data:{"id":cid,"page":$("#rbody1 #ck-page").val()},
			success:function(result){
				$("#rbody1 #rtitle").html(result);
			},
			error:function(result){
				alert("该仓库内有材料，不可删除");
			}
	});
});
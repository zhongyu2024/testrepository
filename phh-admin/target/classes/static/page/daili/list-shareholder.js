layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

    //新闻列表
    var tableIns = table.render({
        elem: '#newsList',
        url : '/MemberApi/getMemberByType',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        where:{type:3, phone: $(".searchPhone").val(),
            userName: $(".searchVal").val()},
        limit : 20,
        limits : [10,15,20,25],
        id : "newsListTable",
   toolbar: true ,//开启工具栏，此处显示默认工具，可以自定义模板，详见文档     
   cols : [[
//            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: 'ID', width:60, align:"center"},
            {field: 'user_name', title: '用户名', width:350},
            {field: 'phone', title: '手机号', width:350},
            {field: 'member_name', title: '会员名称', align:'center'},
            {field: 'member_level_end_time', title: '到期时间', align:'center', minWidth:110, templet:function(d){
            	return createTime(d.member_level_end_time);
            }},
           // {title: '操作', width:170, templet:'#newsListBar',fixed:"right",align:"center"}
        ]]
    });


    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != '' || $(".searchPhone").val() != ''){
            table.reload("newsListTable",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    phone: $(".searchPhone").val(),
                    userName: $(".searchVal").val(),
                    type:3
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
    });

    $(".addPartner").click(function(){
       $(".addDiv").show();
    })

    $(".addNews_btn").click(function(){
    	
       var addPhone=$(".addPhone").val();
       if(typeof addPhone == "undefined" || addPhone == null || addPhone == ""){
    	   layer.msg("请输入要添加的用户的绑定手机号");
    	   return;
       }
       
      	$.ajax({
    		type : "post",
    		url : "/MemberApi/addPratner",
    		data :{"phone":$(".addPhone").val()},
    		cache : false,
    		async : false,
    		dataType : "json",
    		success : function(result) {
    			if (result.success) {
    				//监控提交成功
    				 $(".addDiv").hide();
    				 table.reload("newsListTable",{
    		                where: {
    		                    phone: $(".searchPhone").val(),
    		                    userName: $(".searchVal").val(),
    		                    type:3
    		                }
    		          })
    			} else {
    				layer.msg(result.message);
    			}

    		}
    	});
       
       
    })

    
    //列表操作
    table.on('tool(newsList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
      if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此文章？',{icon:3, title:'提示信息'},function(index){
                // $.get("删除文章接口",{
                //     newsId : data.newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                    tableIns.reload();
                    layer.close(index);
                // })
            });
        }
    });
    
    

    function createTime(v){
    	var date = new Date(v);
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        m = m<10?'0'+m:m;
        var d = date.getDate();
        d = d<10?("0"+d):d;
        var h = date.getHours();
        h = h<10?("0"+h):h;
        var M = date.getMinutes();
        M = M<10?("0"+M):M;
        var str = y+"-"+m+"-"+d+" "+h+":"+M;
        return str;
    }

})
layui.use(['table','form','element','laydate'], function(){
  var table = layui.table
 ,form = layui.form
 ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  var laydate = layui.laydate;
  
  laydate.render({
	    elem: '#date1' 
	  });
  
  laydate.render({
	    elem: '#date2' 
	  });
  
	/*  var ii = layer.load();
	  setTimeout(function(){
	    layer.close(ii);
	  }, 500);*/
  	
  		init()
  
  		$('.search-btn').on('click', function(){
  			init()
  		});   
  		
  		
  		function init(){
  			var date1=$("#date1").val()
  			var date2=$("#date2").val()
  			var user_name=$("#user_name").val()
  			var change_amount=$("#phone").val()
  			

  			if(date1>date2)
  			{
  				alert("结束时间不能大于开始时间")
  				return;
  			}
  			
  		    var tableIns = table.render({
  		        elem: '#userList',
  		        url : '/userapi/allBillList',
  		        id:'userList',
  		        cellMinWidth : 95,
  		        page : true,
  		        height : 400,
  		        limit : 10,
  		        limits : [10,20,30,40],
  		        where: {user_id:user_name,date1:date1,date2:date2,change_amount:change_amount}, 
  		        cols : [[
  		            {field: 'id', title: '序号', width:120, align:"center",align:'center'},
  		            {field: 'user_id', title: '用户ID', width:120,align:'center'},
  		            {field: 'change_amount', title: '改变的金额', width:120,align:'center'},
  		            {field: 'before_amount', title: '原金额', width:120,align:'center'},
  		            {field: 'message', title: '简介', align:'center',width:600},
  		            {field: 'producu_user_id', title: '账户改变关联', align:'center',width:150},
  		            {field: 'create_time', title: '创建时间', align:'center',width:180,
  		            	templet :function (row){
  		                    return createTime(row.create_time);
  		                }
  		            },
  		            //{title: '操作', width:150, toolbar:'#userlistBar',fixed:"right",align:"center"}
  		        ]]
  		    });
  			
  			
  		}
  		
  		/*//是否启用
	    form.on('switch(is_show)', function(data){
	    	 console.log(data.value+':'+data.elem.checked);
	    	 var user_id=data.value
	    	 var state
	    	 if(data.elem.checked){
	    		 state=1
	    	 }else{
	    		 state=0
	    	 }
	    	 $.ajax({
		            type:"GET",
		            url:"/userapi/updateuser",
		            data:{is_active:state,is_delete:0,user_id:user_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg("修改成功！")
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("修改失败！")
		            }
	         });
	    	 
	    });*/
	    
	    //列表操作
  	    table.on('tool(chapterlist)', function(obj){
  	        var layEvent = obj.event;
  	        var	data = obj.data;
  	        
  	        var user_id=data.id

  	        //删除
  	        if(layEvent === 'del'){ 
  	        	//询问框
	  	    	layer.confirm('确认删除？', {
	  	    	  btn: ['是','否'] //按钮
	  	    	}, function(){
	  	    		
	  	    		$.ajax({
			            type:"GET",
			            url:"/userapi/updatesuer",
			            data:{is_active:1,is_delete:1,user_id:user_id},
			         	datatype: "json",
			      		async:false,
			            success:function(result){
			            	if(result==1){
			            		layer.msg('删除成功！', {icon: 1});
			            		tableIns.reload();
			            	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			            	layer.msg("修改失败！")
			            }
	  	    		});
	  	    		
	  	    	}, function(){
	//		  	    	  layer.msg('操作取消', {
	//		  	    	    time: 20000, //20s后自动关闭
	//		  	    	    btn: ['明白了', '知道了']
	//		  	    	  });
	  	    	});
	        } 
  	        
  	    })
	    
    
})

/* layui end */

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


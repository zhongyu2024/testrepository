layui.use(['table','form','element','laydate','layer'], function(){
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
  
  var ii = layer.load();
  setTimeout(function(){
    layer.close(ii);
  }, 500);
  		
  		init()
	
    	//根据条件查找
  		$('.search-btn').on('click', function(){
  			init()
  		});   
  		
  		//列表操作
  	    table.on('tool(feedList)', function(obj){
  	        var layEvent = obj.event,
  	            data = obj.data;
  	        if(layEvent === 'edit'){ //编辑
  	        	
  	        	layer.open({
  	        	  type: 1,
  	        	  title: false,
  	        	  closeBtn: 0,
  	        	  shadeClose: true,
  	        	  skin: 'yourclass',
  	        	  content: ''
  	        	});
  	        	
  	        	/*
  	        	layer.prompt(
  	        		{
  	        			title: '请输入提点'
  	        		},
  	        		function(val, index){
  	        			var muser_id = data.user_id;
  	        			$.ajax({
  	        				type:"post",
  	        				url:"/emp/updateRate",
  	        				data:{muser_id:muser_id,rate:val},
  	        				dataType:"json",
  	        				success:function(result){
  	        					//alert(result)
  	        					
  	        				}

  	        			});
  	        			
  	        		layer.msg("修改成功");
  	        	    tableIns.reload();
  	        	    layer.close(index);
  	        	});*/
  	        	
  	        	
  	        } 
  	    });
  	    
  	    function init(){
  	    	var vx=$("#vx").val()
  	    	var name=$("#name").val()
  	    	
  			var tableIns = table.render({
  		        elem: '#feedList',
  		        url : '/user/api/feedList',
  		        id:'feedList',
  		        cellMinWidth : 95,
  		        page : true,
  		        height : 400,
  		        limit : 10,
  		        limits : [10,20,30,40],
  		        where: {name:name,vx:vx}, 
  		        cols : [[
  		        	{field: 'id', title: '序号', width:60, align:"center",align:'center'},
  		            {field: 'create_time', title: '提交时间', width:180,align:'center',
  		            	templet :function (row){
  		                    return createTime(row.create_time);
  		                }
  		            },
  		            {field: 'message', title: '反馈内容', width:500,align:'center'},
  		            {field: 'user_img', title: '头像', width:120,align:'center',
  		            	templet :function (row){
  		            		//console.log(row)
  		                    return '<img src="images'+row.user_img+'">';
  		                }
  		            },
  		            {field: 'user_vx_id', title: '微信号', width:180,align:'center'},
  		            {field: 'name', title: '姓名', width:120,align:'center'},
  		            {field: 'phone', title: '手机号', width:150,align:'center'},
  		            {title: '用户详情', width:100, templet:'#feedlistBar',fixed:"right",align:"center"}
  		        ]],
  		       
  		    });
  	    }
     
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


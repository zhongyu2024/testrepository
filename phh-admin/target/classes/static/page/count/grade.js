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
  			var timetype=$("#timetype option:selected").val()
  			var user_name=$("#user_name").val()
  			var phone=$("#phone").val()

  		    var tableIns = table.render({
  		        elem: '#userList',
  		        url : '/userapi/allGradeList',
  		        id:'userList',
  		        cellMinWidth : 95,
  		        page : true,
  		        height : 400,
  		        limit : 10,
  		        limits : [10,20,30,40],
 		        where: {user_name:user_name,phone:phone},
  		        cols : [[
  		        	{field: 'id', title: '排名', width:180,align:'center'},
  		            {field: 'sum(change_num)', title: '积分数', width:120, align:"center",align:'center'},
  		            {field: 'user_name', title: '用户名', width:180,align:'center'},
  		            {field: 'phone', title: '手机号', width:180,align:'center'}
  		        ]]
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


 
/**
 * 定义一个vue 
 */
var vm = new Vue({
	el : '#vue1',
	data : {
		req_data:{member_name:'市级代理'}
	}
});

var edit = new Vue({
	el : '#edit_vue',
	data : {
		can_add_province:[{id:1},{id:2}],
		can_add_city:{},
		edit_data:{},
		edit_index:0,
		add_index:0,
		select_province:0
	}
});

/**
 * 引入 layui
 */
layui.use(['form','element','layer','jquery','table','upload','slider','laypage'],function(){
	var form = layui.form;
	var $ = layui.jquery;
	var layer = layui.layer;
	var element = layui.element;
	var table = layui.table;
	 var upload = layui.upload;
	 var slider = layui.slider;
	 var laypage = layui.laypage;
	
	function SHOW_LOAD() {
	    return layer.msg('努力加载中...', { icon: 16, shade: [0.5, '#f5f5f5'], scrollbar: false, offset: '50%', time: 100000 });
	}
	function CLOSE_LOAD(index) {
	    layer.close(index);
	}
	function SHOW_TIP() {
	    layer.msg('加载完成！', { time: 1000, offset: '50%' });
	}
	
	/**
	 * vue 监听
	 */
	edit.$watch('edit_index', function(nval, oval) {
		form.render();
	});
	
	/**
	 * vue 监听
	 */
	edit.$watch('select_province', function(nval, oval) {
		form.render();
	});
	
	/**
	 * 表格渲染
	 */
	var table1 = table.render({
	    
		elem: '#table1'
	    ,url:'/MemberApi/user_order_auding_list'
	    ,toolbar: '#toolbarDemo'
	    ,title: '审核列表'
	    ,limits: [5,10,15,20]
		,limit:10
		,page: true
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'},
	      {field:'id', title:'id', width:90, fixed: 'left', unresize: true, sort: true},
	      {field:'order_no', title:'订单号', width:150},
	      {field:'user_name', title:'用户名', width:150},
	      {field:'user_phone', title:'手机号', width:150},
	      {field:'invite_name', title:'邀请人', width:150},
	      {field:'invite_phone', title:'邀请人手机号', width:150},
	      
	      {fixed: 'right', title:'操作', width:150,	templet: function(res){
	    	  if(res.return_type==3){
		    	  return '<span style="color:green;">结算完毕</sapn>'
		      }
	    	  else if(res.return_type==2){
		    	  return '<span style="color:#FF4500;">计算中</sapn>'
		      } 
	    	  else if(res.is_pay == 0&& res.return_type==0){
		    	  return '<a class="layui-btn layui-btn-xs" lay-event="allow">同意</a>'
		      } 
	    	  else if(res.auding_type == 1){
	    		  return '<a class="layui-btn layui-btn-xs" lay-event="allow">同意</a>'
		      }
	    	  else if(res.auding_type == 2){
		    	  return '<span style="color:#FF4500;">后台审核发放</sapn>'
		      }
	    	  else if(res.auding_type == 3){
		    	  return '<span style="color:red;">上级已拆分</sapn>'
		      } 
	    	  else if(res.auding_type == 3){
		    	  return '<span style="color:red;">系统发放</sapn>'
		      } 
	    	  
		   }}
	    ]],
	    done: function(res, curr, count){
	        //如果是异步请求数据方式，res即为你接口返回的信息。
	        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
	        console.log(res);
	        //得到当前页码
	        console.log(curr); 
	        //得到数据总量
	        console.log(count);
	      }
	    
	  });
	
	//头工具栏事件
	  table.on('toolbar(table1)', function(obj){
	    
	    if(obj.event === 'add'){
	    add();
	    }
	    });
	 //监听行工具事件
	  table.on('tool(table1)', function(obj){
	    var data = obj.data;
	    console.log(obj)
	    if(obj.event === 'allow'){
	    	allow(data);
	    }
	  });
	  
	  //搜索
	  $(".search_btn").click(function() {
		  var data ={};
		  data.member_name = '市级代理';
		  var user_name = $('.searchName').val();
		  var phone = $('.searchPhone').val();
		  if(user_name!=""){
			  data.user_name = user_name;
		  }
		  if(phone!=""){
			  data.phone = phone;
		  }
		  vm.$set(vm.$data,'req_data',data);
		  table1.reload({
			  where:vm.$data.req_data  
		  });
	  });
	  //编辑弹出层	  
	  function open_edit(data){
	  	console.log("待编辑的数据："+data);
	  	console.log(data);
	  	edit.$set(edit.$data,"edit_data",data);
	  	edit.$set(edit.$data,'select_province',data.province_id1);
	  	var index = layer.open({
			  title:'编辑',
			  area: ['500px', '400px'],
			  type: 1,
			  content: $('#edit') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
			});
	  	edit.$set(edit.$data,"edit_index",index);
	  };
	  
	  form.on('select(select_province)', function(data){
		  edit.$set(edit.$data,'select_province',data.value);
		  var edit_data = edit.$data.edit_data;
		  var can_add_city = edit.$data.can_add_city;
		  edit_data.city_id1 = can_add_city[data.value][0].id;
		  edit_data.city_name1 = can_add_city[data.value][0].name;
	  });
	  
	 
	  //编辑提交按钮
	  $(".edit").click(function() {
		 var edit_data = edit.$data.edit_data;
		 edit_data.new_province_id = $('#edit_province option:selected').val();
		 var url="/MemberApi/up_province";
			var i;
			$.ajax({type:'post',url:url,data:edit_data,dataType:'json',async:true,
		  		beforeSend: function () {
		              i = SHOW_LOAD();
		           },success:function(data){
		        	   CLOSE_LOAD(i);
		        	   console.log(data);
		        	   table1.reload();
		        	   layer.close(edit.$data.edit_index);
		        	   edit.$set(edit.$data,"edit_index",0);
		        },error:function(error){		//响应失败的回调函数
		  			CLOSE_LOAD(i);
		  			layer.alert("请求失败:" + error.status );
		  		} 
		  });
	  });
	  
	
	  function add(){
		  form.render();
		  var index = layer.open({
			  title:'添加',
			  area: ['500px', '400px'],
			  type: 1,
			  content: $('#add') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
			});
	  	edit.$set(edit.$data,"add_index",index);
	  };
	  
	//编辑提交按钮
	  $(".add").click(function() {
		var data = {};
		 data.province_id = $('#add_select_province option:selected').val();
		 data.city_id = $('#add_select_city option:selected').val();
		 data.phone = $('#add_phone').val();
		 var url="/MemberApi/addCity";
		 var i;
		 $.ajax({type:'post',url:url,data:data,dataType:'json',async:true,
		  		beforeSend: function () {
		              i = SHOW_LOAD();
		           },success:function(data){
		        	   CLOSE_LOAD(i);
		        	   console.log(data);
		        	   if(data.message=='该手机号未找到用户!!'){
		        		   layer.alert("该手机号未找到用户!!"); 
		        	   }
		        	   table1.reload();
		        	   layer.close(edit.$data.add_index);
		        	   edit.$set(edit.$data,"add_index",0);
		        },error:function(error){		//响应失败的回调函数
		  			CLOSE_LOAD(i);
		  			layer.alert("请求失败:" + error.status );
		  		} 
		  });
	  });
	  
	  
	  //同意审核
	  function allow(data){
		  	//审核	
		  	data.auding_type=2;
		  	var url="/MemberApi/allow";
			 var i;
			 $.ajax({type:'post',url:url,data:data,dataType:'json',async:true,
			  		beforeSend: function () {
			              i = SHOW_LOAD();
			           },success:function(data){
			        	   CLOSE_LOAD(i);
			        	   console.log(data);
			        	   table1.reload({
				     			  where:vm.$data.req_data  
				     		  });
			        	   if(data.message=='该手机号未找到用户!!'){
			        		   layer.alert("该手机号未找到用户!!"); 
			        	   }
			        	  
			         },error:function(error){		//响应失败的回调函数
			  			CLOSE_LOAD(i);
			  			layer.alert("请求失败:" + error.status );
			  		} 
			  });
	  };
	  //vue重新渲染页面
	  function reload(){
	  	vm.$forceUpdate();//重新渲染
	  }
});

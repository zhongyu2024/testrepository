
/**
 * 定义一个vue 
 */
var vm = new Vue({
	el : '#daili-vue',
	data : {
		req_data:{member_name:'省级代理'}
	}
});

var edit = new Vue({
	el : '#edit_vue',
	data : {
		can_add_province:[{id:1},{id:2}],
		edit_data:{},
		edit_index:0,
		add_index:0
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
	 * 表格渲染
	 */
	var table1 = table.render({
	    elem: '#table1'
	    ,url:'/MemberApi/provinceMemberUserList'
	    ,where:vm.$data.req_data
	    ,toolbar: '#toolbarDemo'
	    ,title: '省代列表'
	    ,limits: [5,10,15,20]
		,limit:10
		,page: true
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'},
	      {field:'id', title:'用户id', width:90, fixed: 'left', unresize: true, sort: true},
	      {field:'user_name', title:'用户名', width:150},
	      {field:'phone', title:'手机号', width:150},
	      {field:'member_name', title:'会员等级', width:150},
	      {field:'province_name1', title:'省份', width:150},
	      //{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
	    ]],
	    done: function(res, curr, count){
	        //如果是异步请求数据方式，res即为你接口返回的信息。
	        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
	        console.log(res);
	       edit.$set(edit.$data,'can_add_province',res.can_add_province);
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
	    if(obj.event === 'del'){
	      layer.confirm('真的删除行么?', function(index){
	    	layer.close(index);
	    	del_test(data);
	      });
	      
	    } else if(obj.event === 'edit'){
	    	open_edit(data);
	    }
	  });
	  
	  //编辑弹出层	  
	  function open_edit(data){
	  	console.log("待编辑的数据："+data);
	  	console.log(data);
	  	edit.$set(edit.$data,"edit_data",data);
	  	var index = layer.open({
			  title:'编辑',
			  area: ['500px', '400px'],
			  type: 1,
			  content: $('#edit') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
			});
	  	edit.$set(edit.$data,"edit_index",index);
	  };
	  
	//搜索
	  $(".search_btn").click(function() {
		  var data ={};
		  data.member_name = '省级代理';
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
		 data.province_id = $('#add_province option:selected').val();
		 data.city_id = 0;
		 data.phone = $('#phone').val();
		 	var url="/MemberApi/addProvince";
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
	  
	  //vue重新渲染页面
	  function reload(){
	  	vm.$forceUpdate();//重新渲染
	  }
});

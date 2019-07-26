layui.use(['table','form','element','laydate','upload','layer'], function(){
  var table = layui.table
 ,form = layui.form
 ,upload = layui.upload
 ,element = layui.element
 ,layer = layui.layer; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  var laydate = layui.laydate;
  laydate.render({
	    elem: '#create_time' 
  });
  
  laydate.render({
	    elem: '#end_time' 
  });

  
	init();
  	$('.search_soldier').on('click', function(){
		init()
	});
  
  	function init(){
  		var soldierNames=$("#soldier_names").val();
  	//方法级渲染
    var tableIns = table.render({
        elem: '#list',
        url : '/SoldierApi/getApplyAll',
        id:'id',
        cellMinWidth : 95,
        page : true,
        height : 550,
        limit : 10,
        limits : [10,20,30,40],
        where:  {"soldierNames":soldierNames},
        cols : [[
            {field: 'id', title: '编号', width:100, align:"center",align:'center'},
            {field: 'real_name', title: '姓名', width:180,align:'center'},
            {field: 'type', title: '类型', width:180, align:'center',templet :function (row){
            	if(row.type==1){
            		return "军人";
            	}else{
            		return "残疾人";
            	}
            	
            }
            },
            {field: 'sexy_type', title: '性别', width:180,align:'center',templet :function (row){
            	if(row.type==1){
            		return "男";
            	}else{
            		return "女";
            	}
            	
            }},
            {field: 'card_img_url', title: '证书图片', width:180,align:'center',height: 100,templet:'<div><img src="http://erp.wnduoduo.com/phaha/static_file/upload_img/{{ d.card_img_url }}"></div>'
            },
            {field: 'bir_date_time', title: '生日', width:180,align:'center',templet :function (row){
                return createTime(row.create_time);
            }},
            {title: '操作', width:240,fixed:"right",align:"center",templet: function(res){
	    	  if(res.apply_type==2){
		    	  return '<span style="color:green;">审核通过</sapn>'
		      }
	    	  if(res.apply_type==3){
		    	  return '<span style="color:#FF4500;">审核拒绝</sapn>'
		      } 
	    	  if(res.apply_type==1){
		    	  return '<a class="layui-btn layui-btn-xs" lay-event="agree">同意</a>'
		    	  +'<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="unAgree">拒绝</a>'
		      } 
            }}
        ]]
    });

    
  	}
	//列表操作
    table.on('tool(list)', function(obj){
        var layEvent = obj.event;
        var	id = obj.data.id;
        //编辑
		if(layEvent === 'agree'){
			
			console.log(obj)
			console.log(obj.data.elem) //被执行事件的元素DOM对象，一般为button对象
		  console.log(obj.data) //被执行提交的form对象，一般在存在form标签时才会返回
		  console.log(obj.data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		  var url = "/MemberApi/add_lev1_for_soldier";
		  var i;
		  $.ajax({type:'post',url:url,data:obj.data,dataType:'json',async:true,
		  		beforeSend: function () {
		              i =  layer.load(1); //换了种风格
		           },success:function(res){
		        	   layer.close(i);
		        	   console.log(res);
		        	   layer.alert(res.message);
		        	   tableIns.reload();
		           },error:function(error){		//响应失败的回调函数
		        	   layer.close(i);
		  			layer.alert("请求失败:" + error.status );
		  		} 
		  });
		
			
		} 
        	
      //删除
      if(layEvent === 'unAgree'){ 
    	  //询问框
  	    	layer.confirm('确认删除？', {
  	    	  btn: ['是','否'] //按钮
  	    	}, function(){
  	    		var data = obj.data;
  	    		data.apply_type = 3;
  	    		data.apply_message = "信息不符合！无法通过申请";
  	    		$.ajax({
		            type:"post",
		            url:"/SoldierApi/up_app_soldier_apply",
		            data:JSON.stringify(data),
		         	datatype: "json",
		      		async:false,
		      		 // headers必须添加，否则会报415错误
		      	    headers: {
		      	        'Accept': 'application/json',
		      	        'Content-Type': 'application/json'
		      	    },
		            success:function(result){
		            	if(result.code==0){
		            		layer.msg(result.msg, {icon: 1});
		            		tableIns.reload();
		            	}
		            	if(result.code==1){
		            		layer.msg(result.msg, {icon: 5});
		            		tableIns.reload();
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg('请求失败！', {icon: 2});
		            }
	          });
  	    		
  	    	}, function(){
//		  	    	  layer.msg('操作取消', {
//		  	    	    time: 20000, //20s后自动关闭
//		  	    	    btn: ['明白了', '知道了']
//		  	    	  });
  	    	});
        } 
  	      
    });
		
	  	
	  //timestamp-》date
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
  		    var S = date.getSeconds();
		    S = S<10?("0"+S):S;
  		    var str = y+"-"+m+"-"+d+" "+h+":"+M+":"+S;
  		    return str;
  		}
  	    
    
})/*layend*/

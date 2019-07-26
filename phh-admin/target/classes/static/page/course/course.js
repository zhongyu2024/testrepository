layui.use(['table','form','element','laydate','treeSelect','form'], function(){
  var table = layui.table
 ,form = layui.form
 ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  var addlayer
  var laydate = layui.laydate;
//  laydate.render({
//	    elem: '#create_time' 
//  });
//  
//  laydate.render({
//	    elem: '#end_time' 
//  });
  
  laydate.render({
	    elem: '#end_time',
	    format: 'yyyy-MM-dd HH:mm:ss'
  });
  
  var i = layer.load();
  setTimeout(function(){
    layer.close(i);
  }, 500);
  
  
  
  var treeSelect= layui.treeSelect;

  treeSelect.render({
      // 选择器
      elem: '#tree',
      // 数据
      data: '/courseapi/getAllCateForSelect',
      // 异步加载方式：get/post，默认get
      type: 'get',
      // 占位符
      placeholder: '请选择分类',
      // 是否开启搜索功能：true/false，默认false
      search: true,
      // 点击回调
      click: function(d){
    	  $("#category_id").val(d.current.id);
      },
      // 加载完成后的回调函数
      success: function (d) {
    	  
    	 
      }
  });
  
  	init();
  	$('.search_course').on('click', function(){
		init()
	});
  	$('.reset_course').on('click', function(){
  		$("#course_names").val("");
		init();
	});
  	
  	
  	
	function init(){
	  	var courseName=$("#course_names").val();
	    
	  	//方法级渲染
	    var tableIns = table.render({
	        elem: '#chapterlist',
	        url : '/courseapi/getAll',
	        page : true,
	        limit : 10,
	        limits : [10,20,30,40],
	        where:  {courseName:courseName},
	       // autoSort:true,
	       // initSort:{field:'chapter_sort_id', type:'asc'},
	        cols : [[
	            {field: 'sort', title: '序号',  align:"center",align:'center'},
	            {field: 'title', title: '课程名称', align:'center'},
	            {field: 'context', title: '课程介绍', align:'center'},
	            {field: 'image_url', title: '图片', align:'center',templet :function (row){
	            	if((row.image_url).indexOf('http')!=-1){
	            		return "<img src="+row.image_url+">";
	            	}
	                return "<img src="+"http://erp.wnduoduo.com/phaha/static_file/upload_img/"+row.image_url+">";
	            	}
	            },
	            {field: 'sales', title: '销量', align:'center'},
	            {field: 'price', title: '课程价格', align:'center'},
	            {field: 'type', title: '课程类型', align:'center'},
	            {field: 'create_time', title: '创建时间',align:'center',
		            	templet :function (row){
		                    return createTime(row.create_time);
		                }
	            },
	            {field: 'end_time', title: '结束时间',align:'center',
	            	templet :function (row){
	                    return createTime(row.end_time);
	                }
	            },
	            {field: 'is_index', title: '是否显示到首页', width:180,align:'center',
	            	templet :function (res){
	            		var s = ''
	            		if(res.is_index==1){
	            			s='checked=1'
	            		}
	                    return "<input type='checkbox' lay-skin='switch' lay-filter='is_index' "+s+" " +
	                    		"value='"+res.id+"' attr='"+res.is_index+"'>"
	                }
	            },
	            ,{title: '操作', toolbar:'#chapterlistBar',fixed:"right",align:"center"}
	        ]]
	    });
			
		}

  		$('#add-btn').on('click', function(){
  			clean();
  			addTeacher();
  			//addCategory();
  			
  			$("#demo1").attr("src"," ");
  			var obj = document.getElementById("edit");
				 obj.style.cssText = "display:none;" 
  			
  			var obj = document.getElementById("add-confirm");
				 obj.style.cssText = "display:block;"
			addlayer=layer.open({
	        	  type: 1,
	        	  title: '添加课程',
	        	  area: ['500px', '650px'],
	        	  closeBtn: 1,
	        	  shadeClose: true,
	        	  skin: 'yourclass',
	        	  content: $("#add_course")
	        });
  	        
  		});  
  		
  			//点击确定添加
	  	    $("#add-confirm").click(function(){
	  	    	//验证数据
				
				//添加数据
				$.ajax({
			            type:"GET",
			            url:"/courseapi/insert",
						data:$("#course_info").serialize(),		         	
			         	datatype: "json",
			      		async:false,
			            success:function(data){
			            	console.log(data)
			            	layer.msg("添加成功！")
			            	layer.close(addlayer)
			            	var courseName=$("#course_names").val();
			            	table.reload('chapterlist',{
         		                where: { //设定异步数据接口的额外参数，任意设
         		                	courseName:courseName
         		                }
         		            });
			            }
		        }); 
			})
  		
  		//列表操作
  	    table.on('tool(chapterlist)', function(obj){
  	        var layEvent = obj.event;
  	        var	data = obj.data;
  	        var id=data.id
  	       
  	        //章节管理
  	        if(layEvent === 'chapter'){
  	        	layer.open({
  				  type: 2,
  				  title: '章节管理',
  				  shadeClose: true,
  				  area: ['800px', '500px'], //宽高
  				  skin: '',
  				  content: "/chapter?courseId="+data.id
  				});
  	        }
  	        //编辑
			if(layEvent === 'edit'){
				clean();
				layer.open({
				  type: 1,
				  title: '修改课程',
				  shadeClose: true,
				  area: ['500px', '650px'], //宽高
				  content: $("#add_course")
				});
				//填充数据
				var obj = document.getElementById("add-confirm");
				 obj.style.cssText = "display:none;"
				 var obj = document.getElementById("edit");
				 obj.style.cssText = "display:block;"
				//addCategory()
				
				$.ajax({
 		            type:"GET",
 		            url:"/courseapi/getcourse",
 		            data:{id:id},
 		         	datatype: "json",
 		      		async:false,
 		            success:function(data){
 		            	if(data!=null||data!=''){
 		            		$("#category_id").val(data[0].category_id);
 		            		treeSelect.checkNode('tree', data[0].category_id);
 		            	//	treeSelect.checkNode('tree', );
 		            		$("#is_good option[value='" +ch(data[0].is_good)+ "']").prop("selected", "selected"); 
 		            		$("#title").val(data[0].title)
 		            		$("#update_id").val(data[0].id)
 		            		$("#context").val(data[0].context)
 		            		$("#image_url").val(data[0].image_url)
 		            		$("#demo1").attr("src","http://erp.wnduoduo.com/phaha/static_file/upload_img/"+data[0].image_url)
 		            		$("#teacher_id").val(data[0].teacher_id)
 		            		$("#price").val(data[0].price)
 		            		$("#sort_").val(data[0].sort)
 		            		$("#type option[value='" +data[0].type+ "']").prop("selected", "selected"); 
 		            		$("#end_time").val(createTime(data[0].end_time));
 		            		if(data[0].is_member==true){
 		            			$("input[name='is_member']").prop("checked", true);
 		            		}
 		            		if(data[0].is_free==true){
 		            			$("input[name='is_free']").prop("checked", true);
 		            		}
 		            		if(data[0].is_show==true){
 		            			$("input[name='is_show']").prop("checked", true);
 		            		}
 		            	}
 		            },
 		            error: function (jqXHR, textStatus, errorThrown) {
 		            	layer.msg("系统错误")
 		            }
				});
				
				
			} 
  	        	
  	          //删除
	  	      if(layEvent === 'del'){ 
	  	    	  //询问框
		  	    	layer.confirm('确认删除？', {
		  	    	  btn: ['是','否'] //按钮
		  	    	}, function(){
		  	    		
		  	    		$.ajax({
				            type:"GET",
				            url:"/courseapi/deleteCourse",
				            data:{id:id},
				         	datatype: "json",
				      		async:false,
				            success:function(result){
				            	if(result==1){
				            		layer.msg('删除成功！', {icon: 1});
				            		var courseName=$("#course_names").val();
				            		table.reload('chapterlist',{
		            		                where: { //设定异步数据接口的额外参数，任意设
		            		                	courseName:courseName
		            		                }
		            		            });
				            	}
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				            	layer.msg('删除失败！', {icon: 2});
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
	  	    
	  	    
	  	//编辑提交前验证
  			$('#edit').on('click', function(){
  				/*var name = $(".cname").val()
  				if(name==""){
  					layer.msg("请输入章节名")
  					return
  				}
  				if($(".base").filter(":checked").length==0){
  					layer.msg("请选择题库")
  					return
  				}*/
  				//获取选中的checkbox的值
  				$.ajax({
 		            type:"GET",
 		            url:"/courseapi/update",
 		            data:$("#course_info").serialize(),
 		         	datatype: "json",
 		      		async:false,
 		            success:function(data){
 		            	if(data==1){
 		            		layer.closeAll();
 		            		layer.msg("修改成功！");
 		            		var courseName=$("#course_names").val();

 		            		table.reload('chapterlist',{
 		            		                where: { //设定异步数据接口的额外参数，任意设
 		            		                	courseName:courseName
 		            		                }
 		            		            });
 		            	}
 		            },
 		            error: function (jqXHR, textStatus, errorThrown) {
 		            	layer.msg("系统错误")
 		            }
 	         });
  				
  			})
  	    
  				//是否显示到首页
	    form.on('switch(is_index)', function(data){
	    	 console.log(data.value+':'+data.elem.checked);
	    	 var state
	    	 var id=data.value
	    	 if(data.elem.checked){
	    		 state=true
	    	 }else{
	    		 state=false
	    	 }
	    	 $.ajax({
		            type:"GET",
		            url:"/courseapi/updateIsIndex",
		            data:{is_index:state,id:id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg("操作成功！")
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("系统异常！")
		            }
	         });
	    	 
	    });
  	    
  	    
  		//timestamp-》date
  		function createTime(v){
  			var date = new Date(v);
  			 var y = date.getFullYear();  
  		    var m = date.getMonth() + 1;  
  		    m = m < 10 ? ('0' + m) : m;  
  		    var d = date.getDate();  
  		    d = d < 10 ? ('0' + d) : d;  
  		    var h = date.getHours();
  		    h = h < 10 ? ('0' + h) : h;
  		    var minute = date.getMinutes();
  		    var second = date.getSeconds();
  		    minute = minute < 10 ? ('0' + minute) : minute;  
  		    second = second < 10 ? ('0' + second) : second; 
  		    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second; 
  		}
  		
  		function clean(){
  			$("#title").val("")
     		$("#context").val("")
     		$("#image_url").val("")
     		$("#teacher_id").val("")
     		$("#price").val("")
     		$("#is_good option[value='" +0+ "']").prop("selected", "selected"); 
     		//$("#type option[value='" +data[0].type+ "']").prop("selected", "selected"); 
     		$("#end_time").val("")
     		$("input[name='is_member']").removeAttr("checked")
     		$("input[name='is_free']").removeAttr("checked")
     		$("input[name='is_show']").removeAttr("checked")
  		}
  		
  		function ch(val){
  			if(val==true){
  				return 1
  			}
  			return 0
  		}
    
})/*layend*/


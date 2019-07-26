layui.use(['table','form','element','laydate'], function(){
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
  	
  	//方法级渲染
    var tableIns = table.render({
        elem: '#chapterlist',
        url : '/courseapi/getCourseGood',
        page : false,
        limit : 10,
        limits : [10,20,30,40],
        cols : [[
            {field: 'id', title: 'id',  align:"center",align:'center',width:'200'},
            {field: 'title', title: '课程名称', align:'center',width:'400'},
            {field: 'img', title: '图片', align:'center',width:'200',templet :function (row){
            	if((row.img).indexOf('http')!=-1){
            		return "<img src="+row.img+">";
            	}
                return "<img src="+"http://erp.wnduoduo.com/phaha/static_file/upload_img/"+row.img+">";
            	}
            },
            {field: 'sort_id', title: '排序', align:'center',width:'100'},
            ,{title: '操作', toolbar:'#chapterlistBar',fixed:"right",align:"center",width:'100'}
        ]]
    });
    	
    var cid;
    var isSer =  false;
    
  		//列表操作
  	    table.on('tool(chapterlist)', function(obj){
  	        var layEvent = obj.event;
  	        var	data = obj.data;
  	        cid=data.id
  	        
  	        //编辑
			if(layEvent === 'edit'){
				layer.open({
				  type: 1,
				  title: '修改课程',
				  shadeClose: true,
				  area: ['500px', '650px'], //宽高
				  content: $("#add_course")
				});
				//window.location.reload()

				$.ajax({
 		            type:"GET",
 		            url:"/courseapi/getCourseGoodById",
 		            data:{id:cid},
 		         	datatype: "json",
 		      		async:false,
 		            success:function(data){
 		            	if(data!=null){
 		            		console.log(data)
 		            		$("#id").val(data.id)
 		            		
 		            		    addCourse(data.course_id)
		 		   				$("#course_id").searchableSelect();
 		            		
 		            		
 		            		//$(".searchable-select-items option[data-value='" +data.course_id+ "']").prop("selected", "selected"); 
 		            		
 		            		//select(data.course_id)
 		            		
 		            		$("#img").val(data.img)
 		            		$("#sort_id").val(data.sort_id)
 		            	}
 		            },
 		            error: function (jqXHR, textStatus, errorThrown) {
 		            	layer.msg("系统错误")
 		            }
				});
				
				//$("#course_id option[value='" +63+ "']").prop("selected", "selected"); 
				
			} 
  	        	
  	    });
	  	    
	  	//编辑提交前验证
  			$('#edit').on('click', function(){
  				var course_id=$("#course_id").val()
  				
  				if(course_id==0){
  					layer.msg("请选择课程")
  				}
  				
  				$.ajax({
 		            type:"GET",
 		            url:"/courseapi/updateCourseGood",
 		            data:$("#course_info").serialize(),
 		         	datatype: "json",
 		      		async:false,
 		            success:function(data){
 		            	if(data==1){
 		            		tableIns.reload();
 		            		layer.closeAll();
 		            		layer.msg("修改成功！")
 		            	}else if(data==2){
 		            		layer.msg("系统繁忙！")
 		            	}
 		            },
 		            error: function (jqXHR, textStatus, errorThrown) {
 		            	layer.msg("系统异常")
 		            }
 	         });
  				
  		})
  	    
  		function ch(val){
  			if(val==true){
  				return 1
  			}
  			return 0
  		}
  			
  			function select(val){
  				var obj = document.getElementById("course_id");
         		for(i=0;i<obj.length;i++){
         		    if(obj[i].value==val)
         		        obj[i].selected = true;
         		}
  				
  			}
    
})//


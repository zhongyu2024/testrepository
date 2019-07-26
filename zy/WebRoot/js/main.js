$(function(){
	//
	var flag = true;
	//alert(flag);
	$(".img_style img").click(function(){
		//alert("a");
		//切换子版块收展状态
		$(this).parents(".mainBoard").next().slideToggle(500);
		if(flag){
			$(this).attr("src","images/unfold.gif");
			//子版块收
		}else{
			$(this).attr("src","images/fold.gif");
			//子版块展开
		}
		flag=!flag;
	});
});



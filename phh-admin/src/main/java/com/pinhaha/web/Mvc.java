package com.pinhaha.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.pinhaha.mapper.AppCourseChapterMapper;
import com.pinhaha.pojo.AppCourseChapter;
import com.pinhaha.tools.FileUtils;
import com.pinhaha.util.CookieUtil;



@Controller
public class Mvc {
	
	@Value("${static_path}")
	String static_path;
	
	@Autowired
	private AppCourseChapterMapper appCourseChapterMapper;

/*	@RequestMapping("{folder}/{view}")
	public String pages(@PathVariable("folder")String folder,@PathVariable("view")String view){
		return folder+"/"+view;
	}*/
	@RequestMapping("")
	public String home(){
		return "index";
	}
	
	@RequestMapping("{view}")
	public String pages(@PathVariable("view")String view){
		return view;
	}
	
	
	@RequestMapping("soldier/{view}")
	public String soldier(@PathVariable("view")String view){
		return "soldier/"+view;
	}
	
	
	
	@RequestMapping("daili/{view}")
	public String daili(@PathVariable("view")String view){
		return "daili/"+view;
	}
	
	@RequestMapping("chapter")
	public String Chapter(String courseId,Model model){
		List<AppCourseChapter> list = appCourseChapterMapper.selectBYCourseId(Long.parseLong(courseId));
		for (AppCourseChapter appCourseChapter : list) {
			   appCourseChapter.setIsDeleteStr(appCourseChapter.getIs_deleted()==0?"上架":"下架");
		}
		model.addAttribute("list", list);
		return "course/chapter";
	}
	
	@RequestMapping(value = "/uploadVideo",method = RequestMethod.POST)
    @ResponseBody
    public Object uploadVideo(@RequestParam("layuiVideo") MultipartFile[] layuiFile, HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map=new HashMap<>();
        Map<String,Object> map2=new HashMap<>();
        FileUtils kitFileUtil=new FileUtils();
        map = kitFileUtil.kitFileUtil(layuiFile, request, response,static_path);
        String error = map.get("error").toString();
        if("101".equals(error)){
            map2.put("error",101);
            map2.put("message",map.get("message"));
            return map;
        }
        map2.put("error",0);
        String url[]=(String[])map.get("url");
        map2.put("url",url[0]);
        return JSONObject.toJSON(map2);
    }
	
	@RequestMapping("add_zhangjie")
	@ResponseBody
	public String createZhangjie(AppCourseChapter appCourseChap){
		try {
			appCourseChap.setCreate_time(new Date());
			appCourseChap.setIs_deleted(0l);
			appCourseChapterMapper.insert(appCourseChap);
		} catch (Exception e) {
			return "章节添加失败,请稍后重新添加";
		}
		return "章节添加成功";
	}
	
	@RequestMapping("update_zhangjie")
	@ResponseBody
	public String updateZhangjie(@RequestParam("k_id") String k_id,
			@RequestParam("fileName_url")String fileName_url,
			@RequestParam("titles")String titles,
			@RequestParam("teacher_id")long teacher_id){
		System.out.println("updateZhangjie12"+titles+k_id+fileName_url);
		AppCourseChapter app = appCourseChapterMapper.selectByPrimaryKey(k_id);
		app.setTittle(titles);
		app.setVedio_url(fileName_url);
		app.setTeacher_id(teacher_id);;
		appCourseChapterMapper.updateByPrimaryKey(app);
		return "修改成功";
	}
	
	@RequestMapping("dw_zhangjie")
	@ResponseBody
	public String dwZhangjie(String k_id,String type){
		AppCourseChapter app = appCourseChapterMapper.selectByPrimaryKey(k_id);
		if(type.equals("1")){
			app.setIs_deleted(0l);
		}else{
			app.setIs_deleted(1l);
		}
		appCourseChapterMapper.updateByPrimaryKey(app);
		return "状态修改成功";
	}
	
	@RequestMapping("get_zhangjie")
	@ResponseBody
	public Object getZhangjie(String k_id){
		AppCourseChapter app = appCourseChapterMapper.selectByPrimaryKey(k_id);
		return JSONObject.toJSON(app);
	}
	
	@RequestMapping("course")
	public String Course(){
		return "course/course";
	}
	
	@RequestMapping("category")
	public String category(){
		return "cate/category";
	}
	@RequestMapping("xuexima/{view}")
	public String xuexima(@PathVariable("view")String view){
		return "xuexima/"+view;
	}
	
	@RequestMapping("userlist")
	public String user(){
		return "user/userlist";
	}
	
	@RequestMapping("getmoney")
	public String getmoney(){
		return "user/getmoney";
	}
	
	@RequestMapping("insgetmoney")
	public String insgetmoney(){
		return "ins/insgetmoney";
	}
	
	@RequestMapping("getvouchermoney")
	public String getvouchermoney(){
		return "user/getvouchermoney";
	}
	
	@RequestMapping("indexPic")
	public String indexPic(){
		return "pic/indexPic";
	}
	
	@RequestMapping("bill")
	public String bill(){
		return "count/bill";
	}
	
	@RequestMapping("grade")
	public String grade(){
		return "count/grade";
	}
	
	@RequestMapping("teacher/{view}")
	public String teacher(@PathVariable("view")String view){
		return "teacher/"+view;
	}
	
	
	@RequestMapping("checkAdmin")
	public String checkAdmin(HttpServletRequest request, HttpServletResponse response){
		return "checkAdmin/checkAdmin";
	}
	
	@RequestMapping("login")
	public String login(){
		return "login/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletResponse response){
		CookieUtil.deleteCookieAuto(response, "admin");
		return "login/login";
	}
	
	@RequestMapping("goodcourse")
	public String goodcourse(){
		return "course/goodcourse";
	}
	
	@RequestMapping("ins")
	public String ins(){
		return "ins/ins";
	}
	
}

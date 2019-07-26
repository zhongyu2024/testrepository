/**
 * 
 */
package com.pinhaha.api;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pinhaha.mapper.AppCategoryMapper;
import com.pinhaha.mapper.AppCourseGoodMapper;
import com.pinhaha.mapper.AppCourseMapper;
import com.pinhaha.mapper.AppTeacherMapper;
import com.pinhaha.pojo.AppCategory;
import com.pinhaha.pojo.AppCourse;
import com.pinhaha.pojo.AppCourseGood;
import com.pinhaha.pojo.AppTeacher;

import lombok.extern.slf4j.Slf4j;

/**
*	<p>Title: </p>
* 	<p>Description: </p>
* 	<p>Company: </p> 
* 	@author zhongyu2024
* 	@date 2018年11月16日
*/
@Slf4j
@RestController
@RequestMapping("courseapi")
public class CourseApi extends BaseController{
	
	@Value("${img_path}")
	private String img_path;
	
	@Autowired
	private AppCourseMapper appCourseMapper;
	
	@Autowired
	private AppCategoryMapper catemapper;
	
	@Autowired
	private AppTeacherMapper teacherMapper;
	
	@Autowired
	private AppCourseGoodMapper goodMapper;
	
	@RequestMapping("getAll")
	public Map<String, Object> getAll(@RequestParam Map<String,Object> map){
		
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
//		map.put("page", (page-1)*limit);
//		map.put("limit", limit);
		PageHelper.startPage(page, limit);
		List<AppCourse> list = appCourseMapper.getAllCourseByParam(map);
		//int count = appCourseMapper.getAllNoLimit().size();
		PageInfo<AppCourse> p = new PageInfo<AppCourse>(list);
		int size = list.size();
		for(int i=0;i<size;i++){
			list.get(i).setSort(i+1L);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", "suc");
		map2.put("count", p.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("insert")  
	@Transactional
	public int insert(Long id,Long teacher_id,String title,@RequestParam(required=false)String sort,String context,String image_url,BigDecimal price,
			@RequestParam(required=false)String end_time,Boolean is_member,Boolean is_free,Boolean is_show,
			Long category_id,@RequestParam(required=false)Boolean is_good) throws Exception{
		AppCourse c = new AppCourse();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");    
		Date date = format.parse(end_time);
		c.setTitle(title);
		if(StringUtils.isNotBlank(sort)){
			c.setSort(Long.parseLong(sort));
		}
		c.setContext(context);
		c.setImage_url(image_url);
		c.setPrice(price);
		c.setEnd_time(date);
		c.setCategory_id(category_id);
		c.setIs_member(is_member==null?false:is_member);
		c.setIs_free(is_free==null?false:is_free);
		c.setIs_show(is_show==null?false:is_show);
		c.setIs_deleted(false);
		c.setIs_good(is_good==null?false:is_good);
		c.setCreate_time(new Date());
		
		try {
			appCourseMapper.insertSelective(c);
			catemapper.insertCateCourse(category_id,id);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	@RequestMapping("update")
	public int update(Long id,@RequestParam(required=false)Long teacher_id,@RequestParam(required=false)String title,@RequestParam(required=false)String sort,@RequestParam(required=false)String context,@RequestParam(required=false)String image_url,@RequestParam(required=false)BigDecimal price,
			@RequestParam(required=false)String end_time,@RequestParam(required=false)Boolean is_member,@RequestParam(required=false)Boolean is_free,@RequestParam(required=false)Boolean is_show,
			Long category_id,@RequestParam(required=false)Boolean is_good) throws Exception{
		try{
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");    
			Date date = null;
			if(end_time!=null){
				date = format.parse(end_time);
			}
			AppCourse c = appCourseMapper.selectByPrimaryKey(id);
			if(StringUtils.isNotBlank(sort)){
				c.setSort(Long.parseLong(sort));
			}
			c.setTitle(title);
			c.setContext(context);
			c.setCategory_id(category_id);
			c.setImage_url(image_url);
			c.setPrice(price);
			c.setEnd_time(date);
			c.setIs_member(is_member==null?false:is_member);
			c.setIs_free(is_free==null?false:is_free);
			c.setIs_show(is_show==null?false:is_show);
			c.setIs_good(is_good==null?false:is_good);
			appCourseMapper.updateByPrimaryKeySelective(c);
			
			catemapper.delCateCourse(id);
			catemapper.insertCateCourse(category_id, id);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return 1;
	}
	
	@RequestMapping("updateIsIndex")
	public int updateIsIndex(Long id,Boolean is_index) throws Exception{
		
		AppCourse c = appCourseMapper.selectByPrimaryKey(id);
		c.setIs_index(is_index);
		appCourseMapper.updateByPrimaryKeySelective(c);
		
		return 1;
	}
	
	@RequestMapping("getTeacher")
	public List<AppTeacher> getTeacher(){
		return appCourseMapper.getTeacher();
	}
	
	@RequestMapping("getcourse")
	public List<AppCourse> getcourse(int id){
		return appCourseMapper.getcourse(id);
	}
	
	@RequestMapping("deleteCourse")
	public int deleteCourse(int id){
		appCourseMapper.deleteCourse(id);
		return 1;
	}
	
	/**
	 * 分类管理
	 */
	@RequestMapping("getCategoryByParam")
	public List<AppCategory> getCategoryByParam(){
		List<AppCategory> list = catemapper.getAllByParam(null);
		return list;
	}
	
	@RequestMapping("getAllCate")
	public Map<String, Object> getAllCate(@RequestParam(required=false) Integer page,@RequestParam(required=false) Integer limit
			,@RequestParam(required=false)String name){
		if(page==null){
			page=0;
		}
		if(limit==null){
			limit=999;
		}
		PageHelper.startPage(page, limit);
		List<AppCategory> list = catemapper.getAllByParam(name);
		PageInfo<AppCategory> pageInfo = new PageInfo<AppCategory>(list);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", "ok");
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("delCategory")
	public int delCategory(Long id){
		int num = catemapper.getCatesCourseNum(id);
		int num2 = catemapper.getCatesForDel(id);
		if(num>0){
			return 3;
		}
		if(num2>0){
			return 4;
		}
		catemapper.deleteCategory(id);
		return 1;
	}
	
	@RequestMapping("addCategory")
	public int addCategory(Long parentId,String name,Integer sort_index,String img_url,Integer sort){
		AppCategory parent=catemapper.selectByPrimaryKey(parentId);
		AppCategory c = new AppCategory();
		c.setIs_deleted(false);
		c.setName(name);
		c.setSort(sort);
		c.setSort_index(sort_index);
		if(parent==null){
			
		}else{
			c.setParent_id(parent.getId());
			c.setLevel_tree((parent.getLevel_tree()==null?"":parent.getLevel_tree())+parent.getId()+",");
		}
		c.setImg_url(img_url);
		catemapper.insert(c);
		return 1;
	}
	
	@RequestMapping("updateCategory")
	public int updateCategory(Long id,String name,@RequestParam(required=false)Boolean is_index,
			@RequestParam(required=false)Integer sort_index,@RequestParam(required=false)String img_url,
			@RequestParam(required=false)Integer sort){
		
		AppCategory c = catemapper.selectByPrimaryKey(id);
		if(sort_index!=0){
			c.setSort_index(sort_index);
		}
		if(sort_index!=0){
			c.setSort(sort);
		}
		c.setName(name);
		c.setIs_index(is_index);
		
		c.setImg_url(img_url);
		catemapper.updateByPrimaryKeySelective(c);
		return 1;
	}
	
	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
    public Map<String,Object> uploadImg(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        MultipartFile mf = null;
        File mff = null;
        int code = -1;
        if (!(request instanceof MultipartHttpServletRequest)) {
            String errorMsg = "your post form is not support ENCTYPE='multipart/form-data' ";
            log.error(errorMsg);
            throw new RuntimeException(errorMsg);
        }

        String fileName = "";
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFiles = multipartRequest.getFiles("file");
        if (null != multipartFiles && multipartFiles.size() > 0) {
            for (int i = 0; i < multipartFiles.size(); i++) {
                mf = multipartFiles.get(i);
                String originalFilename = mf.getOriginalFilename();// 图片名
                if(originalFilename.contains(".jpg")){
                	fileName = UUID.randomUUID()+".jpg";
                }
                else if(originalFilename.contains(".png")){
                	fileName = UUID.randomUUID()+".png";
                }
//                File source = new File(img_path);
//                if (source.exists()) {
//                    mff = source;
//                    code = 1;
//                } else {
                    try {
                    	File file=new File(img_path+"/static_file/upload_img/"+fileName);
                    	 mf.transferTo(file);
//                        mff = source;
                        code = 0;
                        log.debug("Upload file "  + " Success!");
                    } catch (Exception e) {
                        log.error("Upload file "  + " Error!" + e.getMessage());
                    }
//                }
//                InputStream is = mf.getInputStream();
//                byte[] byt = new byte[is.available()];
//                is.read(byt);
//                FileOutputStream out = new FileOutputStream(mff+"/"+fileName);
//                out.write(byt);
//                out.flush();
//                out.close();
            }
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", code);
        result.put("mff", mff);
        result.put("img_url", fileName);
        return result;
    }
	
	@RequestMapping("getTeacherAll")
	public Map<String, Object> getTeacherAll(@RequestParam("page") int page,@RequestParam("limit") int limit,@RequestParam(required=false)String name){
		PageHelper.startPage(page, limit);
		List<AppTeacher> list = teacherMapper.selectAll();
		PageInfo<AppTeacher> pageInfo = new PageInfo<AppTeacher>(list);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", pageInfo);
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("addteacher")
	public Integer addteacher(@RequestBody AppTeacher teacher){
		teacher.setCreate_time(new Date());
		log.info(teacher.toString());
		int s = teacherMapper.insert(teacher);
		return s;
	}
	
	@RequestMapping("upteacher")
	public Integer upteacher(@RequestBody AppTeacher teacher){
		log.info(teacher.toString());
		teacher.setCreate_time(new Date());
		int s = teacherMapper.updateByPrimaryKey(teacher);
		return s;
	}
	
	@RequestMapping("delteacher")
	public Integer delteacher(@RequestParam("id") long id){
		int s = teacherMapper.deleteByPrimaryKey(id);
		return s;
	}
	
	@RequestMapping("getAllCourse")
	public List<AppCourse> getAllCourse(){
		List<AppCourse> list = goodMapper.getAllCourse();
		return list;
	}
	
	@RequestMapping("getCourseGood")
	public Map<String, Object> getCourseGood(){
		List<AppCourseGood> list = goodMapper.getAll();
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", "success");
		map2.put("count", list.size());
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("updateCourseGood")
	public int updateCourseGood(Long id,Long course_id,String img,Long sort_id){
		try {
			System.out.println("img:"+img);
			AppCourseGood g=goodMapper.selectByPrimaryKey(id);
			g.setCourse_id(course_id);
			g.setImg(img);
			g.setSort_id(sort_id);
			goodMapper.updateByPrimaryKeySelective(g);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	@RequestMapping("getCourseGoodById")
	public AppCourseGood getCourseGoodById(Long id){
		
		return goodMapper.selectByPrimaryKey(id);
	}
	@RequestMapping("getAllCateForSelect")
	public List<Map<String, Object>> getAllCateForSelect(){
		List<Map<String, Object>> result=new ArrayList<>();
		List<AppCategory> list  =catemapper.selectParentCa();
		for(AppCategory ca:list){
			Map<String, Object> map=new HashMap<>();
			map.put("id", ca.getId());
			map.put("name", ca.getName());
			map.put("open", false);
			List<Map<String, Object>> children=getAllChildren(ca.getId());
			if(children!=null && children.size()!=0){
				map.put("children", children);
			}
			map.put("checked", false);
			
			result.add(map);
		}
		return result;
	}
	
	private List<Map<String, Object>> getAllChildren(Long id){
		List<Map<String, Object>> result=new ArrayList<>();
		List<AppCategory> list  =catemapper.selectChindrens(id);
		for(AppCategory ca:list){
			Map<String, Object> map=new HashMap<>();
			map.put("id", ca.getId());
			map.put("name", ca.getName());
			map.put("open", false);
			List<Map<String, Object>> children=getAllChildren(ca.getId());
			if(children!=null && children.size()!=0){
				map.put("children", children);
			}
			map.put("checked", false);
			result.add(map);
		}
		return result.size()==0?null:result;
	}
	
	//根据机构查找课程
	@RequestMapping("getCourseListByInsId")
	public Object getCourseListByInsId(@RequestParam("page") Integer page,@RequestParam("pageSize") Integer pageSize,
			@RequestParam("ins_id") Long ins_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageHelper.startPage(page, pageSize);
		List<AppCourse> list=appCourseMapper.getCourseListByCateId(ins_id);
		PageInfo<AppCourse> pages=new PageInfo<>(list);
		return this.getPageJson(0, "", pages.getTotal(), list);
	}
	
	
}

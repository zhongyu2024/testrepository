/**  
* <p>Title: BaseController.java</p>  
* <p>Description: </p>  
* <p>Copyright: Copyright (c) 2018</p>  
* <p>Company: ���������׵����������޹�˾</p>  
* @author ��ΰ  18768113020
* @date 2018��9��26��  
* @version 1.0  
*/
package com.pinhaha.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.github.pagehelper.PageInfo;

/**
 * <p>
 * Title: BaseController
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author ��ΰ
 * @phone 18768113020
 * @date 2018��9��26��
 */
public class BaseController {
	@InitBinder({ "page" })
	public void initBinderPage(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("page.");
	}
	@SuppressWarnings("rawtypes")
	protected <T> PageInfo getPageInfo(List<T> list) {
		return new PageInfo<T>(list);
	}
	public Map<String, Object> setJson(boolean success, String message, Object entity) {

		Map<String, Object> json = new HashMap<String, Object>();
		json.put("success", Boolean.valueOf(success));
		json.put("message", message);
		json.put("entity", entity);
		return json;
	}
	public Map<String, Object> getPageJson(int code, String msg, Long count, Object data) {
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("code", code);
		json.put("msg", msg);
		json.put("count", count);
		json.put("data", data);
		return json;
	}
	public static String getViewPath(String path) {
		if ((path != null) && (!path.trim().equals(""))) {
			return "" + path;
		}
		return "";
	}
}

package com.pinhaha.tools;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * Description:
 * This class {phh-admin}  code is all, prohibit other projects that are not the company's project.
 * @author shiquanli
 *    <p>15257129351@163.com</p>
 *    <p>1695446827@qq.com</p>
 *    TITLE ：phh-admin - FileUtils
 *    DATE ： 2018年11月22日 下午2:32:10
 */
public class FileUtils {

	public Map<String, Object> kitFileUtil(@RequestParam("imgFile") MultipartFile[] imgFile, HttpServletRequest request,
			HttpServletResponse response,String static_path) {

		// 文件保存目录路径
		String savePath = static_path + "/static_file/";
		// 文件保存目录URL
		String saveUrl = "/static_file/";

		// 定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,mp4");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2");

		// 最大文件大小
		//long maxSize = 9000000;

		response.setContentType("text/html; charset=UTF-8");

		if (!ServletFileUpload.isMultipartContent(request)) {
			return getError("请选择文件。");
		}
		// 检查目录
		File uploadDir = new File(savePath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		// 检查目录写权限
		if (!uploadDir.canWrite()) {
			return getError("上传目录没有写权限。");
		}

		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "media";
		}
		if (!extMap.containsKey(dirName)) {
			return getError("目录名不正确。");
		}

		// 创建文件夹
		savePath += dirName + "/";
		saveUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl += ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		String url[] = new String[imgFile.length];
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < imgFile.length; i++) {
			System.out.println(imgFile[i]);

			// 获取上传文件的名字
			String fileName = imgFile[i].getOriginalFilename();

			if (!imgFile[i].isEmpty()) {

				// 检查文件大小
				//if (imgFile[i].getSize() > maxSize) {
					//return getError("上传文件大小超过限制。");
				//}

				// 检查扩展名
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(fileExt)) {
					return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
				}

				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				try {
					// 保存文件
					System.out.println(saveUrl + newFileName);
					FileCopyUtils.copy(imgFile[i].getInputStream(), new FileOutputStream(savePath + newFileName));

				} catch (Exception e) {
					return getError("上传文件失败。");
				}

				url[i] = saveUrl + newFileName;
			}
		}
		map.put("error", 0);
		map.put("url", url);
		return map;
	}

	private Map<String, Object> getError(String message) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error", 101);
		map.put("message", message);
		return map;
	}

}
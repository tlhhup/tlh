package com.tlh.system.action.app;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tlh.util.FileUtil;

@Controller
@RequestMapping("/app/FileUploadAction")
public class FileUploadAction {

	//TODO 处理多个图片统一key的问题
	@RequestMapping(value="upload",method=RequestMethod.POST)
	public void upload(HttpServletRequest request,@RequestParam MultipartFile[] files){
		if(files!=null&&files.length>0){
			for(MultipartFile file:files){
			FileUtil.uploadFile(request, file);
			}
		}
	}
	
}

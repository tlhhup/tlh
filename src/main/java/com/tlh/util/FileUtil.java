package com.tlh.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	public static String uploadFile(HttpServletRequest request, MultipartFile file) {
		try {
			String path = request.getServletContext().getRealPath("upload");
			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			if ((file != null) && (!file.isEmpty())) {
				String oldName = file.getOriginalFilename();
				String ex = oldName.substring(oldName.lastIndexOf("."));
				String name = UUID.randomUUID().toString() + ex;
				File upload = new File(dir, name);
				file.transferTo(upload);
				return "/upload/" + name;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
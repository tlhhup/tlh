<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.json.simple.*"%>
<%
	//文件保存目录路径
	String savePath = pageContext.getServletContext().getRealPath("/") + "upload/";

	//文件保存目录URL
	String saveUrl ="/upload/";

	//定义允许上传的文件扩展名
	HashMap<String, String> extMap = new HashMap<String, String>();
	extMap.put("image", "gif,jpg,jpeg,png,bmp");
	extMap.put("flash", "swf,flv");
	extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
	extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2,apk");

	//最大文件大小
	long maxSize = 10000000;

	response.setContentType("text/html; charset=UTF-8");

	if (!ServletFileUpload.isMultipartContent(request)) {
		out.println(getError("请选择文件。"));
		return;
	}
	//创建文件上传根目录
	File dir = new File(savePath);
	if (!dir.exists()) {
		dir.mkdirs();
	}
	//检查目录写权限
	if (!dir.canWrite()) {
		out.println(getError("上传目录没有写权限。"));
		return;
	}

	//获取文件的存放的目录
	String targetPath = request.getParameter("dir");
	if (targetPath == null) {
		targetPath = "image";
	}
	if (!extMap.containsKey(targetPath)) {
		out.println(getError("目录名不正确。"));
		return;
	}
	//按文件类型及日期创建子文件夹
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String ymd = sdf.format(new Date());
	saveUrl+=targetPath+"/" + ymd + "/";
	File targetDir = new File(dir, targetPath+"/" + ymd + "/");
	if (!targetDir.exists()) {
		targetDir.mkdirs();
	}

	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("UTF-8");
	List items = upload.parseRequest(request);
	Iterator itr = items.iterator();
	while (itr.hasNext()) {
		FileItem item = (FileItem) itr.next();
		String fileName = item.getName();
		long fileSize = item.getSize();
		if (!item.isFormField()) {
			//检查文件大小
			if (item.getSize() > maxSize) {
				out.println(getError("上传文件大小超过限制。"));
				return;
			}
			//检查扩展名
			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			if (!Arrays.<String> asList(extMap.get(targetPath).split(",")).contains(fileExt)) {
				out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(targetPath) + "格式。"));
				return;
			}

			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			try {
				File uploadedFile = new File(targetDir, newFileName);
				item.write(uploadedFile);
			} catch (Exception e) {
				out.println(getError("上传文件失败。"));
				return;
			}

			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url", saveUrl + newFileName);
			out.println(obj.toJSONString());
		}
	}
%>
<%!private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}%>
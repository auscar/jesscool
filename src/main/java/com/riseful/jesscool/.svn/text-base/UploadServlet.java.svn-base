package com.riseful.jesscool;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.riseful.jesscool.base.Env;

public class UploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6434354687302362976L;

//	private String uploadPath = "/home/auscar/"; // 上传文件的目录
//	private String serverUploadPath = "/uploads/";
//  private String uploadPath = Env.staticRoot + Env.uploadFileSystemPath;
	private String uploadPath = Env.uploadFileSystemPath;
	public void init() throws ServletException {
		File uploadPath = new File(this.uploadPath);
		if (!uploadPath.exists()) {
				uploadPath.mkdirs();
		}
	 }
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		 try {
			 	String fileNames = "";
			 	
			   File tempfile = new File(System.getProperty("java.io.tmpdir"));//采用系统临时文件目录      
			   DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			   diskFileItemFactory.setSizeThreshold(4096);  // 设置缓冲区大小，这里是4kb
			   diskFileItemFactory.setRepository(tempfile);  //设置缓冲区目录
			   ServletFileUpload fu = new ServletFileUpload(diskFileItemFactory);
			   fu.setSizeMax(4194304);
			   List fileItems = fu.parseRequest(req);
			   Iterator i = fileItems.iterator();
			   while (i.hasNext()) {
				   FileItem fi = (FileItem) i.next();
				   String fileName = fi.getName();
				   
				   System.out.println(fileName);
				   
				   if (fileName != null) {
					   File fullFile = new File(fi.getName());
					   File savedFile = new File(uploadPath, fullFile.getName());
					   fi.write(savedFile);
					   fileNames += ("'"+ Env.staticRoot + Env.uploadPath +"/" + fi.getName() +"',");
				   }
			   }
			   fileNames = fileNames.substring(0,fileNames.lastIndexOf(","));
			   String json = "{fileNames:["+ fileNames +"]}";
			   System.out.println(fileNames);
			   res.getWriter().println(json);
		 	}catch (Exception e){
		 		e.printStackTrace();
			}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		doGet(req, res);
	}

}

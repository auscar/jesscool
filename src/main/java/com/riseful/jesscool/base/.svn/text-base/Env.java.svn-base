package com.riseful.jesscool.base;

import java.io.IOException;

public class Env {
	public static String staticRoot = null;
	public static String webRoot = null;
	public static String uploadPath = null;
	public static String uploadFileSystemPath = null;
	
	static{
		ConfigLoader loader = new ConfigLoader();
		try {
			loader.load("jesscoolConfig.properties");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Env.staticRoot = loader.get("staticServer");
		Env.webRoot = loader.get("webServer");
		Env.uploadPath = loader.get("uploadPath");
		Env.uploadFileSystemPath = loader.get("uploadFileSystemPath");
		
	}
	

	public static void main(String[] args){
		System.out.println(Env.uploadFileSystemPath);
	}
}

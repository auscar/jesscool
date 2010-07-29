package com.riseful.jesscool.base;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigLoader {
	Properties p = new Properties();
	public void load (String filePath) throws IOException{
	
			InputStream ips = this.getClass().getResourceAsStream(filePath);
			p.load(ips);
			
	
	}
	public String get(String key){
		return this.p.getProperty(key);
	}
	
	
	public static void main(String[] args) throws IOException{
		ConfigLoader loader = new ConfigLoader();
		loader.load("jesscoolConfig.properties");
		System.out.println(loader.get("staticServer"));

	}
}


package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.jesscool.base.Env;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.service.JesscoolService;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class MemberForget extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		//获取用户填写的信息
		String userName = req.getParameter("userName");
		
		//设置分发器的值
		String susUri = "/views/memberForget.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(susUri);
		
		//获取JesscoolService的实例
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//定义一个User对象，以便储存用户信息
		User user = service.getUserByName(userName);
		try {
			//判断用户所填写的用户名称是否存在
			if (user != null) { //如果用户存在，将密码发送到用户邮箱
				//设置参数以表示所填写帐号存在
				req.setAttribute("memSendFlag", "true");
				
				try{
					String tto = req.getParameter("userName");
					String ttitle = "找回密码";
					String tcontent = "亲爱的用户，您的密码为： " + user.getPwd() + " 请妥善保管";
					
					Properties props=new Properties();
					props.put("mail.smtp.host","smtp.126.com");//发件人使用发邮件的电子信箱服务器
					props.put("mail.smtp.auth","true"); //这样才能通过验证
					Session s=Session.getInstance(props);
					s.setDebug(true);
					
					MimeMessage message=new MimeMessage(s);
					
					//给消息对象设置发件人/收件人/主题/发信时间
					InternetAddress from=new InternetAddress("jesscool@126.com");  //发邮件的出发地（发件人的信箱）
					message.setFrom(from);
					InternetAddress to=new InternetAddress(tto);//发邮件的目的地（收件人信箱）
					message.setRecipient(Message.RecipientType.TO,to);
					message.setSubject(ttitle);
					message.setSentDate(new Date());
					
					
					//给消息对象设置内容
					BodyPart mdp=new MimeBodyPart();//新建一个存放信件内容的BodyPart对象
					mdp.setContent(tcontent,"text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
					Multipart mm=new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
					//象(事实上可以存放多个)
					mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
					message.setContent(mm);//把mm作为消息对象的内容
					
					message.saveChanges();
					Transport transport=s.getTransport("smtp");
					transport.connect("smtp.126.com","jesscool@126.com","147896325auscar");//发邮件人帐户密码
					transport.sendMessage(message,message.getAllRecipients());
					transport.close();
				}catch(MessagingException e){
					res.getWriter().println(e.toString());
				}
				
				//跳转到memberForget页面
				rd.forward(req, res);
			} else { //如果不存在，则提示用户重新填写帐号信息
				req.setAttribute("memSendFlag", "false");
				req.setAttribute("memberMsg", "抱歉，您的帐号不存在！，请重新填写！");
				rd.forward(req, res);
			}
		} catch (ServletException e) {
			e.printStackTrace();
			// TODO: handle exception
		}catch(IOException e){
			e.printStackTrace();
		}
		//设置登录失败后的提示信息
		req.setAttribute("loginMsg", "抱歉，帐户名或密码不正确！");
		
		
				
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}

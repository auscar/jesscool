	<%@ page contentType="text/html;charset=GB2312" %>
	<%request.setCharacterEncoding("gb2312");%>
	<%@ page import="java.util.*,javax.mail.*"%>
	<%@ page import="javax.mail.internet.*"%>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>发送成功</title>
	</head>
	
	<body>
	<%
	try{
	String tto=request.getParameter("to");
	String ttitle=request.getParameter("title");
	String tcontent=request.getParameter("content");
	
	Properties props=new Properties();
	props.put("mail.smtp.host","smtp.126.com");//发件人使用发邮件的电子信箱服务器
	props.put("mail.smtp.auth","true"); //这样才能通过验证
	Session s=Session.getInstance(props);
	s.setDebug(true);
	
	MimeMessage message=new MimeMessage(s);
	
	//给消息对象设置发件人/收件人/主题/发信时间
	InternetAddress from=new InternetAddress("riseful@126.com");  //发邮件的出发地（发件人的信箱）
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
	transport.connect("smtp.126.com","riseful@126.com","riseful147896325");//发邮件人帐户密码
	transport.sendMessage(message,message.getAllRecipients());
	transport.close();
	%>
	<div align="center">
	<p><font color="#FF6600">发送成功!</font></p>
	</div>
	<%
	}catch(MessagingException e){
	out.println(e.toString());
	}
	%>
	</body>
	</html>
	<%@ page contentType="text/html;charset=GB2312" %>
	<%request.setCharacterEncoding("gb2312");%>
	<%@ page import="java.util.*,javax.mail.*"%>
	<%@ page import="javax.mail.internet.*"%>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>���ͳɹ�</title>
	</head>
	
	<body>
	<%
	try{
	String tto=request.getParameter("to");
	String ttitle=request.getParameter("title");
	String tcontent=request.getParameter("content");
	
	Properties props=new Properties();
	props.put("mail.smtp.host","smtp.126.com");//������ʹ�÷��ʼ��ĵ������������
	props.put("mail.smtp.auth","true"); //��������ͨ����֤
	Session s=Session.getInstance(props);
	s.setDebug(true);
	
	MimeMessage message=new MimeMessage(s);
	
	//����Ϣ�������÷�����/�ռ���/����/����ʱ��
	InternetAddress from=new InternetAddress("riseful@126.com");  //���ʼ��ĳ����أ������˵����䣩
	message.setFrom(from);
	InternetAddress to=new InternetAddress(tto);//���ʼ���Ŀ�ĵأ��ռ������䣩
	message.setRecipient(Message.RecipientType.TO,to);
	message.setSubject(ttitle);
	message.setSentDate(new Date());
	
	
	//����Ϣ������������
	BodyPart mdp=new MimeBodyPart();//�½�һ������ż����ݵ�BodyPart����
	mdp.setContent(tcontent,"text/html;charset=gb2312");//��BodyPart�����������ݺ͸�ʽ/���뷽ʽ
	Multipart mm=new MimeMultipart();//�½�һ��MimeMultipart�����������BodyPart��
	//��(��ʵ�Ͽ��Դ�Ŷ��)
	mm.addBodyPart(mdp);//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart)
	message.setContent(mm);//��mm��Ϊ��Ϣ���������
	
	message.saveChanges();
	Transport transport=s.getTransport("smtp");
	transport.connect("smtp.126.com","riseful@126.com","riseful147896325");//���ʼ����ʻ�����
	transport.sendMessage(message,message.getAllRecipients());
	transport.close();
	%>
	<div align="center">
	<p><font color="#FF6600">���ͳɹ�!</font></p>
	</div>
	<%
	}catch(MessagingException e){
	out.println(e.toString());
	}
	%>
	</body>
	</html>
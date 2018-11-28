<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
* { 
	font-family: gulim; 
	font-size: 20px; 
} 
</style>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->

<%
	request.setCharacterEncoding("utf-8");
 	
	String stuname = request.getParameter("stuname");
	System.out.println("stuname : " + stuname);
	
	String address = request.getParameter("address");
	String subject = request.getParameter("subject");
	String subject2 = request.getParameter("subject2");
	int score = Integer.parseInt(request.getParameter("score"));
	int score2 = Integer.parseInt(request.getParameter("score2"));
	
	out.println("성명 : " + stuname + "<br>");
	out.println("주소 : " + address + "<br>");
	out.println("과목 : " + subject + "<br>");
	out.println("점수 : " + score + "<br>");
	out.println("과목2 : " + subject2 + "<br>");
	out.println("점수2 : " + score2 + "<br>");
	out.println("총점 : " + (score+score2) + "<br>");
	out.println("평균 : " + (score+score2)/2 + "<br>");
%>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
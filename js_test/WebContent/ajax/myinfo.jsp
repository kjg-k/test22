<%@ page contentType="text/html; charset=UTF-8" %> 

<%
	String name = "홍길동";
	String phone = "010-0000-0000";
	String address = "서울시 종로구";
%>

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

div#in {
	text-align: center;
	margin: auto;
	border: 1px solid black;
	width: 50%;
}
</style> 


</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->

<div id="in">
이름 : <%=name %>
<br>
전화번호 : <%=phone %>
<br>
주소 : <%=address %>
</div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
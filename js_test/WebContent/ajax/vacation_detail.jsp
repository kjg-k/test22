<%@ page contentType="text/html; charset=UTF-8" %> 

<%
	String name = request.getParameter("name"); 
	String url = "https://ko.wikipedia.org/wiki/" + name;
	
	out.print(url);	
%>
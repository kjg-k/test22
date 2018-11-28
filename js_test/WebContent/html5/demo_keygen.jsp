<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%  request.setCharacterEncoding("utf-8");
 
String user_name = request.getParameter("user_name");
String security = request.getParameter("security");
 
%>
<div>
 
<h1>
username : <%=user_name %> <br>
security : <%=security %>
</h1>
</div>



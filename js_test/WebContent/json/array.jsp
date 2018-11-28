<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="org.json.simple.*" %>

<%
JSONArray list = new JSONArray();

list.add("가길동");
list.add("나길동");
list.add("다길동");
list.add("라길동");
list.add("마길동");

out.print(list);
%>
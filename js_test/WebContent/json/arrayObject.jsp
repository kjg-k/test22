<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="org.json.simple.*" %>
<%@ page import="java.util.*,json.*" %>

<%
	List list = new ArrayList();
	SungjukDTO dto = null;
	 
	//JSONObject obj = new JSONObject();
	dto = new SungjukDTO("가길동", 100, 100);
	list.add(dto);
	dto = new SungjukDTO("나길동", 90, 90);
	list.add(dto);
	dto = new SungjukDTO("다길동", 80, 80);
	list.add(dto);
	dto = new SungjukDTO("라길동", 70, 70);
	list.add(dto);
	dto = new SungjukDTO("마길동", 60, 60);
	list.add(dto);
	 
	JSONObject json = new JSONObject();
	JSONArray jarray = new JSONArray();
	 
	for (int i=0;i<list.size();i++) {
	    dto = (SungjukDTO)list.get(i);
	    //SungjukDTO -> JSONObject로 변환
	    jarray.add(dto.toJSONObject());
	}
	json.put("list",jarray);
	out.print(json);
%>
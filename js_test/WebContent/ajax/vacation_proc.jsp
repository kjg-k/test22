<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%
	String spring = "석모도,무의도,영종도";
	String summer = "서해,동해,남해";
	String fall = "강화도,대부도,소래,오이도";
	String winter = "제부도,영흥도,선제도,월미도";	

	int num = Integer.parseInt(request.getParameter("num"));

	switch (num) {
		case 1:
			out.print(spring);
			break;
		case 2:
			out.print(summer);
			break;
		case 3:
			out.print(fall);
			break;
		case 4:
			out.print(winter);
			break;		
	}
%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% String root = request.getContextPath(); %> 
 
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
#suggest{
display: block;  
postion: static;  
left: 0px; 
top: 30px; 
color: #000000; 
background: #EAEAEA; 
width: 500px"
}
</style> 

<script type="text/javascript" src="../ajax/httpRequest.js"></script>
<script type="text/javascript">
var checkFirst = false;
var lastKeyword = "";
var loopSendKeyword = false;

function startSuggest() {
	if (checkFirst == false) {
		setTimeout("sendKeyword()", 500);
			// 0.5초 후에 sendKeyword() 실행
		loopSendKeyword = true;
	}
	checkFirst = true;
}

function sendKeyword() {
	if (loopSendKeyword == false) {
		return;
	}
	
	var keyword = document.search.keyword.value;
	
	if (keyword == "") {
		lastKeyword = "";
		hide("suggest");
	}
	else if (keyword != lastKeyword) {
		lastKeyword = keyword;
		
		var params = "keyword=" + encodeURIComponent(keyword);
		
		sendRequest("<%=root%>/suggest", params, response, "post");
	}
	
	setTimeout("sendKeyword()", 500);	
}

function response() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			var resultText = httpRequest.responseText;			
			var result = resultText.split("|");
			var count = parseInt(result[0]);
			var keywordList = null;
			
			if (count > 0) {
				keywordList = result[1].split(",");
				
				var html = "";
				html += "등록된 쿼리 목록(선택하세요)<br>";
				
				for (var i=0; i<keywordList.length; i++) {
					html += "<a href=\"javascript:select('" + keywordList[i] + 
							"')\">" + keywordList[i] + "</a><br>";
				}
				
				var listView = document.getElementById("suggestList");
				listView.innerHTML = html;
				
				show("suggest");
			}
			else {
				hide("suggest");
			}
		}
		else {
			alert("에러 발생 : " + httpRequest.status);
		}
	}
}

function select(selectedKeyword) {
	document.search.keyword.value = selectedKeyword;
	
	loopSendKeyword = false;
	checkFirst = false;
	
	hide("suggest");
}

function frmSend(f) {
	f.submit();
}
</script>

</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
<FORM name='search' method='POST' action='./suggest_proc.jsp'>
 <input type="text" name="keyword" id="keyword" size="70"
 		onkeydown="startSuggest()">
 	<!-- 텍스트 박스에 글자를 입력하면 onkeydown 발동 -->
 <input type='button' value='검색' onclick="frmSend(this.form)">
 
 <div id="suggest">
  <div id="suggestList"></div>
 </div>

</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>
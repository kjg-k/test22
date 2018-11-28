var httpRequest = null;
	// 전역변수

function sendRequest(url, params, response_function_name, method) {
	if (window.XMLHttpRequest) {
		httpRequest = new XMLHttpRequest();
	}
	else {
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	httpMethod = method.toLowerCase();
	
	var httpParams = (params==null || params=="") ? null : params;
		// params가 ""값으로 들어오면 null로 바꿔주기 위해서
	var httpUrl = url;
	
	if (httpMethod=="get" && httpParams!=null) {
		httpUrl += "?" + httpParams;
	} 
		// get 방식일 때 param값 전송
	
	httpRequest.open(httpMethod, httpUrl, true);
	
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	 // pram을 post방식으로 보낼 때 사용
	
	httpRequest.onreadystatechange = response_function_name;
	
	httpRequest.send(httpMethod=="post" ? httpParams : null);
}

function log(msg) {
	var console = document.getElementById("debugConsole");
		// div tag name
	
	if (console != null) {
		console.innerHTML += msg + "<br>";
	}
}
	// alert를 대신해서 값의 이동을 알아보는 메소드

function show(elementId) {
	var element = document.getElementById(elementId);
	
	if (element) {
		element.style.display = "";
	}
}

function hide(elementId) {
	var element = document.getElementById(elementId);
	
	if (element) {
		element.style.display = "none";
	}
}
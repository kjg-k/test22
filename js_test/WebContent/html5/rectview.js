function draw_rect() {
	alert("canvas를 클릭하면 clearRect 호출");
	
	var canvas = document.getElementById("canvas");
	var c = canvas.getContext("2d");
		// 2d를 이용한 작업
	c.lineWidth = 30;
	c.strokeStyle = "blue";
	c.strokeRect(75, 100, 200, 200);
	c.fillStyle = "rgb(255,0,0)";
	c.fillRect(325, 100, 200, 200);
	
	c.canvas.onmousedown = function(e) {
		c.clearRect(0, 0, canvas.width, canvas.height);
	}
}
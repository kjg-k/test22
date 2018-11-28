function draw_gradient() {
	var canvas = document.getElementById('canvas');
	context = canvas.getContext('2d');


	var grd = context.createLinearGradient(0, 0, 170, 0);
	grd.addColorStop(0, "red");
	grd.addColorStop(1, "white");
	context.fillStyle = grd;
	context.fillRect(20, 20, 150, 100);

	var grd2 = context.createLinearGradient(100, 100, 300, 0);

	grd2.addColorStop(0, "black");
	grd2.addColorStop("0.3", "magenta");
	grd2.addColorStop("0.5", "blue");
	grd2.addColorStop("0.6", "green");
	grd2.addColorStop("0.8", "yellow");
	grd2.addColorStop(1, "red");
	context.fillStyle = grd2;
	context.fillRect(200, 20, 150, 100);


	var grd3 = context.createRadialGradient(465, 30, 10, 480, 100, 100);
	grd3.addColorStop(0, "white");
	grd3.addColorStop(1, "black");
	context.fillStyle = grd3;
	context.fillRect(400, 20, 150, 100);

}
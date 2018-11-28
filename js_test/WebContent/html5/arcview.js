function draw_arc() {
	var canvas = document.getElementById('canvas');
	context = canvas.getContext('2d');
	context.strokeStyle = 'blue';
	context.fillStyle = 'red';
	context.lineWidth = '4';

	//open arcs 
	context.beginPath();
	context.arc(100, 100, 60, 0, Math.PI * 3 / 2);
	context.stroke();

	context.beginPath();
	context.arc(250, 100, 60, 0, Math.PI * 3 / 2);
	context.fill();

	context.beginPath();
	context.arc(400, 100, 60, 0, Math.PI * 3 / 2, true);
	context.stroke();
	context.fill();

	// Closed arcs  
	context.beginPath();
	context.arc(100, 300, 60, 0, Math.PI);
	context.closePath();
	context.stroke();

	context.beginPath();
	context.arc(250, 300, 60, 0, Math.PI);
	context.closePath();
	context.fill();

	context.lineWidth = 1;
	context.beginPath();
	context.moveTo(50, 10);
	context.lineTo(450, 10);
	context.stroke();

	context.beginPath();
	context.arc(400, 300, 60, 10, Math.PI);
	context.closePath();
	context.stroke();
	context.fill();
}
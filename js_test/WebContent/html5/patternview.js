var canvas = document.getElementById('canvas');
context = canvas.getContext('2d');

repeat = document.getElementById('repeat');
noRepeat = document.getElementById('noRepeat');
repeatX = document.getElementById('repeatX');
repeatY = document.getElementById('repeatY');

image = new Image();
image.src = 'apple.jpg';


function fillCanvasWithPattern(repeatString) {
	var pattern = context.createPattern(image, repeatString);
	context.clearRect(0, 0, canvas.width, canvas.height);
	context.fillStyle = pattern;
	context.fillRect(0, 0, canvas.width, canvas.height);
	context.fill();
}
;


repeat.onclick = function(e) {
	fillCanvasWithPattern('repeat');
};

repeatX.onclick = function(e) {
	fillCanvasWithPattern('repeat-x');
};

repeatY.onclick = function(e) {
	fillCanvasWithPattern('repeat-y');
};

noRepeat.onclick = function(e) {
	fillCanvasWithPattern('no-repeat');
};


image.onload = function(e) {
	fillCanvasWithPattern('repeat');
};
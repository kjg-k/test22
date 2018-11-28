onmessage = function(event){
  var receiveData = event.data;
  sleep(10000); 
    
  //워커를 호출한 곳으로 결과 메시지를 전송한다
  var sendData = receiveData + "OK~ I'm Worker"
  postMessage(sendData)
}
function sleep(milliSeconds){  
  var startTime = new Date().getTime(); // get the current time   
  while (new Date().getTime() < startTime + milliSeconds); // hog cpu 
} 
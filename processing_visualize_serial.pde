import processing.serial.*;

Serial serialPort = new Serial (this, "COM6", 9600);
float distance;

void setup(){
  size(1000, 1000);
  printArray(Serial.list());
  frameRate(30);
}

void draw(){
  background(0);
  //.available gibt aus wie viele bytes verfügbar sind
  while(serialPort.available() > 0){
    float serialIn = Integer.parseInt(serialPort.readString());   
    float newDistance = serialIn / 8500 * 1000;
    
    if(newDistance > 1000) newDistance = 1000;
    if(newDistance < 0) newDistance = 0;
     
    print(newDistance + "    ");
    newDistance = 1000 - newDistance;
    println(newDistance);
        
    if(newDistance > distance + 60) newDistance = distance + 60;
    else if(newDistance < distance - 60) newDistance = distance - 60;

    distance = newDistance;
  }
  ellipse(width/2, height/2, distance, distance);
}

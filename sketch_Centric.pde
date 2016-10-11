import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);
PVector position;
float r = 0;

void setup() {

  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);

  size(500,500);
  background(0);
  position = new PVector(0, 0);

}

void draw(){
  position.x = r*cos(frameCount);
  position.y = -r*sin(frameCount);
  
  fill(0, 255, 255);
  noStroke();
  ellipse(position.x + height/2, position.y + height/2, 1, 1);
  
  r = r+0.1;
  
}
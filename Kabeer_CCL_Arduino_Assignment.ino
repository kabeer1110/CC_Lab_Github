

const int buttonPin = 5;    
const int ledPin = 11;      

int ledState = LOW;         
int buttonState;            
int lastButtonState = HIGH; 

long lastDebounceTime = 0;  
long debounceDelay = 1000;  

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);

  digitalWrite(ledPin, ledState);
}

void loop() {
  int reading = digitalRead(buttonPin);

 
  if (reading != lastButtonState) {

    lastDebounceTime = millis();
  }

  if ((millis() - lastDebounceTime) > debounceDelay) {

    if (reading != buttonState) {
      buttonState = reading;

      if (buttonState == LOW) {
        ledState = !ledState;
      }
    }
  }


  digitalWrite(ledPin, ledState);

  lastButtonState = reading;
}


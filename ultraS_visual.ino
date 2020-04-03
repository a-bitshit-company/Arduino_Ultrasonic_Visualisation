# define trigPin 8
# define echoPin 9
int duration;
float centimeter;

void setup() {
  Serial.begin(9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  //iwas für saubereres Signal
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  //zeit die vergeht bis das signal ankommt (0 - 255)
  duration = pulseIn(echoPin, HIGH);

  //Durch zwei weil, kommt an objekt an und prallt zurück, 29.1 --> Schallgeschwindigkeit
  centimeter = (duration/2) / 29.1;

  Serial.print(duration);
  delay(80); 
}

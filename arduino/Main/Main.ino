void setup() {
Serial.begin(9600);
}

int byte_value=0;

void loop() {
if (Serial.available() > 0) {
   byte_value=Serial.read();
   Serial.println(byte_value, DEC);
}
Serial.write('_');
delay(1000);
}


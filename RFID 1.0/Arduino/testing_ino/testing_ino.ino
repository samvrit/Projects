// Dump to mega
#include <Adafruit_CC3000.h>
#include <RFID.h>
#include <SPI.h>



#define ADAFRUIT_CC3000_IRQ   3
#define ADAFRUIT_CC3000_VBAT  5
#define ADAFRUIT_CC3000_CS    10
#define SDAPIN 33
#define RESETPIN 32
RFID RC522(SDAPIN, RESETPIN); 

#define WLAN_SSID       "yourSSIDhere"        
#define WLAN_PASS       "yourWiFipassword"
#define WLAN_SECURITY   WLAN_SEC_WPA2 // This can be WLAN_SEC_UNSEC, WLAN_SEC_WEP, WLAN_SEC_WPA or WLAN_SEC_WPA2


Adafruit_CC3000 cc3000 = Adafruit_CC3000(ADAFRUIT_CC3000_CS, ADAFRUIT_CC3000_IRQ, ADAFRUIT_CC3000_VBAT, SPI_CLOCK_DIV2);


uint32_t ip = cc3000.IP2U32(192,168,1,6);
int port = 80;
String repository = "/dj/";

void setup(void)
{


  pinMode(22,OUTPUT);
  pinMode(24,OUTPUT);
  pinMode(26,OUTPUT);
  pinMode(28,OUTPUT);
  digitalWrite(24,LOW);
  digitalWrite(28,LOW);
  Serial.begin(115200);

  if (!cc3000.begin())
  {
    while(1);
  }

  cc3000.connectToAP(WLAN_SSID, WLAN_PASS, WLAN_SECURITY);
  Serial.println("Connected to WiFi network!");

  Serial.println(F("Request DHCP"));
  while (!cc3000.checkDHCP())
  {
    delay(100);
  } 
  digitalWrite(22,HIGH);
  delay(100);
  digitalWrite(22,LOW); 

  delay(50);
  SPI.begin(); 
  RC522.init();
}

void loop(void)
{
  readcard();
}




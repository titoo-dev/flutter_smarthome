/**
 * https://github.com/mobizt/Firebase-ESP-Client/blob/main/examples/RTDB/Basic/Basic.ino
 */

#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>
#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>
#define LED D1

#define WIFI_SSID "HR"
#define WIFI_PASSWORD "barryAllen"


#define API_KEY "AIzaSyByNuiOr0y-jArr0FLxUUF0Xm3LKwYZjI8"
#define DATABASE_URL "smarthome-ec75b-default-rtdb.firebaseio.com"

#define USER_EMAIL "hr@gmail.com"
#define USER_PASSWORD "hrhrhr"
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

int iVal = 0;

void setup()
{

  Serial.begin(9600);
  pinMode(LED, OUTPUT);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);
  config.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  config.database_url = DATABASE_URL;
  config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
  Firebase.setDoubleDigits(5);
}

void loop()
{
  Serial.printf("Get int ref... %s\n", Firebase.RTDB.getInt(&fbdo, F("/my_home/livingRoom1105/value"), &iVal) ? String(iVal).c_str() : fbdo.errorReason().c_str());
  Serial.println(iVal == 1);
  if (iVal == 1) {
    digitalWrite(LED, 1);
    Serial.println("ON");
  } else {
    digitalWrite(LED, 0);
    Serial.println("OFF");
  }
  delay(1000);
}

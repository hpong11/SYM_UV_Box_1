#define R_LED PA8
#define G_LED PA4
#define SW_U PB12
#define SW_D PB13
#define SW_E PB14
#define F_FAN PA15
#define UV_FAN1 PA7
#define UV_FAN2 PA6
#define OZ_FAN1 PB0
#define OZ_FAN2 PB1
#define UV_LAMP PB8
#define OZ_LAMP PB5
#include "TM1637.h"
#define CLK PA0//pins definitions for TM1637 and can be changed to other ports
#define DIO PA1
TM1637 Disp7(CLK,DIO);

int8_t NumTab[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};//0~9,A,b,C,d,E,F
int8_t ListDisp[4];

void Seven_Segment_Display(void);

void setup() {
  Disp7.init();
  Disp7.set(BRIGHT_TYPICAL);//BRIGHT_TYPICAL = 2,BRIGHT_DARKEST = 0,BRIGHTEST = 7;
  
  pinMode(F_FAN, OUTPUT);
  digitalWrite(F_FAN, 0);
  pinMode(R_LED, OUTPUT);
  pinMode(G_LED, OUTPUT);
  pinMode(SW_U, INPUT_PULLUP);
  pinMode(SW_D, INPUT_PULLUP);
  pinMode(SW_E, INPUT_PULLUP);
  pinMode(PB11, OUTPUT);
  pinMode(PB10, OUTPUT);
  digitalWrite(PB11, HIGH);
  digitalWrite(PB10, HIGH);
  pinMode(UV_FAN1, PWM);
  pinMode(UV_FAN2, PWM);
  pinMode(OZ_FAN1, PWM);
  pinMode(OZ_FAN2, PWM);
  pinMode(UV_LAMP, OUTPUT);
  pinMode(OZ_LAMP, OUTPUT);
  Timer1.setPrescaleFactor(40);
  Timer1.setOverflow(65454);
  
  
  Serial.begin(115200);

}

void loop() {
  digitalWrite(R_LED, 1);
  digitalWrite(G_LED, 1);
  
  digitalWrite(UV_LAMP, HIGH);
  digitalWrite(OZ_LAMP, LOW);
  digitalWrite(F_FAN, 1);
  pwmWrite(UV_FAN1, 25000);
  pwmWrite(UV_FAN2, 25000);
  pwmWrite(OZ_FAN1, 0);
  pwmWrite(OZ_FAN2, 0);
  delay(10000);

  digitalWrite(UV_LAMP, LOW);
  digitalWrite(OZ_LAMP, HIGH);
  digitalWrite(F_FAN, 1);
  pwmWrite(UV_FAN1, 0);
  pwmWrite(UV_FAN2, 0);
  pwmWrite(OZ_FAN1, 50000);
  pwmWrite(OZ_FAN2, 50000);
  delay(10000);
}

void Seven_Segment_Display(void){
  tm1637.display(0,ListDisp[0]);
  tm1637.display(1,ListDisp[1]);
  tm1637.display(2,ListDisp[2]);
  tm1637.display(3,ListDisp[3]);
}

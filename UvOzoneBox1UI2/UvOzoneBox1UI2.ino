#define R_LED PA8
#define G_LED PA4
#define SW_U PB12
#define SW_S PB13
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
#define ModeSetup 1
#define ModeOpe 2
#define ModeCoutD 3
#define OZ_UV 0
#define OZ 1
#define UV 2
#define T30 0
#define T60 1
#define T120 2
#define T180 3
#define Tim 2
#define Ope 1

TM1637 Disp7(CLK,DIO);
int8_t NumTab[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};//0~9,A,b,C,d,E,F
int8_t ListDisp[4];
byte Time_Display[4][3] = {{0x7f,3,0}, {0x7f,6,0}, {1,2,0}, {1,8,0}};
byte MainMode = ModeSetup;
byte OpeMode = OZ_UV;
byte TimeMode = T30;
unsigned int SegmentBlinkTime = 500;
byte SegBlinkMode = 0;
byte SetupMode = Ope;
unsigned long CurrentSegBlinkMill = millis()- SegmentBlinkTime, CurrentSW_S = millis(), CurrentSW_U = millis();
byte TimeOpe[4] = {30, 60, 120, 180};

void Seven_Segment_Display(void);
void SetupModeDisp(int SegmentBlinkMode);

void setup() {
  Disp7.init();
  Disp7.set(BRIGHT_TYPICAL);//BRIGHT_TYPICAL = 2,BRIGHT_DARKEST = 0,BRIGHTEST = 7;
  
  pinMode(F_FAN, OUTPUT);
  digitalWrite(F_FAN, 0);
  pinMode(R_LED, OUTPUT);
  pinMode(G_LED, OUTPUT);
  pinMode(SW_U, INPUT_PULLUP);
  pinMode(SW_S, INPUT_PULLUP);
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
  SetupModeDisp(SegBlinkMode);
  Serial.begin(115200);
  
}

void loop() {
  
  if(MainMode == ModeSetup){
    SetupModeDisp(SegBlinkMode);
    if((digitalRead(SW_S) == 0) && (millis()-CurrentSW_S>=500)){
      CurrentSW_S = millis();
      if(SetupMode==Tim){
        if(TimeMode==3) TimeMode=0;
        else TimeMode++;
      }
      SetupModeDisp(SegBlinkMode);
    }
    if((digitalRead(SW_U) == 0) && (millis()-CurrentSW_U>=500)){
      CurrentSW_U = millis();
      if(SetupMode==Ope){
        if(OpeMode==2) OpeMode=0;
        else OpeMode++;
      }
      SetupModeDisp(SegBlinkMode);
    }
    
    if(digitalRead(SW_E) == 0){
      int i=0;
      for (i;i<=3000;i++){
        if(digitalRead(SW_E) != 0)
        break;
        delay(1);
      }
      if(i>=3000){
        MainMode = ModeOpe;
        Serial.println("Oprating Mode");
      }
      Serial.println(i);
    }
  }
  if(MainMode == ModeCoutD){
    byte TimeCount = 30;
    
  }


}

void Seven_Segment_Display(void){
    Disp7.display(0,ListDisp[0]);
    Disp7.display(1,ListDisp[1]);
    Disp7.display(2,ListDisp[2]);
    Disp7.display(3,ListDisp[3]);
}

void SetupModeDisp(byte BlinkMode){
  if (BlinkMode == 0){
    ListDisp[0] = 10+OpeMode;
    ListDisp[1] = Time_Display[TimeMode][0];
    ListDisp[2] = Time_Display[TimeMode][1];
    ListDisp[3] = Time_Display[TimeMode][2];
  }
  else if(BlinkMode == 1){       //Blink OpeMode
    ListDisp[0] = 0x7f;
    ListDisp[1] = Time_Display[TimeMode][0];
    ListDisp[2] = Time_Display[TimeMode][1];
    ListDisp[3] = Time_Display[TimeMode][2];
  }
  else if(BlinkMode == 2){       //Blink TimeMode
    ListDisp[0] = 10+OpeMode;
    ListDisp[1] = 0x7f;
    ListDisp[2] = 0x7f;
    ListDisp[3] = 0x7f;
  }
  Seven_Segment_Display();
}

void SegmentNumberDisp(byte Numb){
  if(Numb>=1000){
    
  }
}
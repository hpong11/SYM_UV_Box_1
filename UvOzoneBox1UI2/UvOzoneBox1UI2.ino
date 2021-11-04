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
#define BUZZ PA10
#include "TM1637.h"
#define CLK PA0//pins definitions for TM1637 and can be changed to other ports
#define DIO PA1
#define ModeSetup 1
#define ModeCoutD 2
#define ModeOpe 3
#define ModePause 4
#define OZ_UV 0
#define OZ 1
#define UV 2
#define T30 0
#define T60 1
#define T120 2
#define T180 3
#define Tim 2
#define Ope 1
#define FAN_SPEED 20000
#define SwBeepTime 100


TM1637 Disp7(CLK,DIO);
int8_t ListDisp[4];
byte Time_Display[5][3] = {{0x7f,0x7f,2}, {0x7f,3,0}, {0x7f,6,0}, {1,2,0}, {1,8,0}};
byte MainMode = ModeSetup;
byte OpeMode = OZ_UV;
byte TimeMode = T30;
unsigned int SegmentBlinkTime = 500;
byte SegBlinkMode = 0;
byte SetupMode = Ope;
unsigned long CurrentSegBlinkMill = millis()- SegmentBlinkTime, CurrentSW_S = millis(), CurrentSW_U = millis();
byte TimeOpe[5] = {2, 30, 60, 120, 180}, OpeUvTime, OpeOzTime;
int CountDownmodeTime; //Secound
unsigned long CurrentCountDownMill, CurrentOpeMill, CurrentF_FanMill;
unsigned long CurrentPauseStartMill, CurrentPauseBlink, CurrentBuzzMill;
byte PauseBlinkStatus;

void Seven_Segment_Display(void);
void SetupModeDisp(int SegmentBlinkMode);
void SegmentNumberDisp(unsigned int Numb);
void TrunOnOzone(void);
void TrunOnUV(void);
void TrunOffAll(void);
void BUZZ_Beep(unsigned int TimeBeep);

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
  TrunOffAll();
  pinMode(BUZZ, OUTPUT);
  BUZZ_Beep(2000);
  Timer1.setPrescaleFactor(40);
  Timer1.setOverflow(65454);
  SetupModeDisp(SegBlinkMode);
  Serial.begin(115200);
}

void loop() {
  
  if(MainMode == ModeSetup){
    SetupModeDisp(SegBlinkMode);
    if((digitalRead(SW_S) == 0) && (millis()-CurrentSW_S>=300)){
      CurrentSW_S = millis();
      if(TimeMode==4) TimeMode=0;
      else TimeMode++;
      SetupModeDisp(SegBlinkMode);
      BUZZ_Beep(SwBeepTime);
    }
    if((digitalRead(SW_U) == 0) && (millis()-CurrentSW_U>=300)){
      CurrentSW_U = millis();
      if(OpeMode==2) OpeMode=0;
      else OpeMode++;
      SetupModeDisp(SegBlinkMode);
      BUZZ_Beep(SwBeepTime);
    }
    
    if(digitalRead(SW_E) == 0){
      int i=0;
      for (i;i<=2000;i++){
        if(digitalRead(SW_E) != 0)
        break;
        delay(1);
      }
      if(i>=2000){
        MainMode = ModeCoutD;
        Serial.println("Count Down Mode");
        CurrentCountDownMill = millis()+1000;
        BUZZ_Beep(2000);
        CountDownmodeTime = 5;
        switch (OpeMode){
        case OZ_UV:
          OpeUvTime = TimeOpe[TimeMode]/2;
          OpeOzTime = OpeUvTime;
          break;
        case OZ:
          OpeUvTime = 0;
          OpeOzTime = TimeOpe[TimeMode];
          break;
        case UV:
          OpeUvTime = TimeOpe[TimeMode];
          OpeOzTime = 0; 
          break;
        default:
          TrunOffAll();
          break;
        }
      }
    }
  }

  else if(MainMode == ModeCoutD){
    SegmentNumberDisp(CountDownmodeTime);
    if(CurrentCountDownMill <= millis()){
      CurrentCountDownMill += 1000;
      CountDownmodeTime--;
      if(CountDownmodeTime<0){
        Serial.println("Operating Mode");
        MainMode = ModeOpe;
        if(OpeOzTime>0) SegmentNumberDisp(OpeOzTime);
        else if (OpeUvTime>0){
          SegmentNumberDisp(OpeUvTime);
          TrunOnUV();
        }
        CurrentOpeMill = millis()+60000;
        CurrentF_FanMill = millis();
        CurrentBuzzMill = millis()+5000;
      }
    }
    if((digitalRead(SW_U) == 0)||(digitalRead(SW_S) == 0)) {
      int i=0;
      for (i;i<=100;i++){
        if((digitalRead(SW_U) != 0)&&(digitalRead(SW_S) != 0))
        break;
        delay(1);
      }
      if(i>=100){
        MainMode = ModeSetup;
        SetupModeDisp(SegBlinkMode);
        BUZZ_Beep(500);
        delay(500);
        BUZZ_Beep(500);
        while((digitalRead(SW_U) == 0)||(digitalRead(SW_S) == 0));
        Serial.println("Setup Mode");
      }
    }
  }

  else if(MainMode == ModeOpe){
    
    if(OpeOzTime > 0){
      TrunOnOzone();
      if(CurrentOpeMill<=millis()){
        OpeOzTime--;
        CurrentOpeMill=CurrentOpeMill+60000;
        SegmentNumberDisp(OpeOzTime);
        if(OpeOzTime<=0){
          TrunOffAll();
          if(OpeUvTime==0) MainMode = ModeSetup;
          else if(OpeUvTime > 0){
            SegmentNumberDisp(OpeUvTime);
            digitalWrite(F_FAN, LOW);
            TrunOnUV();
          }
        }
      }
      if(CurrentF_FanMill<=millis()){
        if(digitalRead(F_FAN)){
          digitalWrite(F_FAN, LOW);
          CurrentF_FanMill += 240000;
          Serial.println("F_Fan Off");
          Serial.println(millis());
          Serial.println();
        }
        else{
          digitalWrite(F_FAN, HIGH);
          CurrentF_FanMill += 30000;
          Serial.println("F_Fan On");
          Serial.println(millis());
          Serial.println();
        }
      }
    }
    else if((OpeUvTime > 0) && (CurrentOpeMill<=millis())){ 
      OpeUvTime--;
      CurrentOpeMill=CurrentOpeMill+60000;
      SegmentNumberDisp(OpeUvTime);
      if(OpeUvTime<=0){
        TrunOffAll();
        MainMode = ModeSetup;
        BUZZ_Beep(2000);
      }
    }

    if(CurrentBuzzMill<=millis()){
        BUZZ_Beep(200);
        CurrentBuzzMill += 5000;
    }

    if((digitalRead(SW_U) == 0)||(digitalRead(SW_S) == 0)||(digitalRead(SW_E) == 0)) {
      int i=0;
      for (i;i<=100;i++){
        if((digitalRead(SW_U) != 0)&&(digitalRead(SW_S) != 0)&&(digitalRead(SW_E) != 0))
        break;
        delay(1);
      }
      if(i>=100){
        TrunOffAll();
        MainMode = ModePause;
        CurrentPauseStartMill = millis();
        CurrentPauseBlink = CurrentPauseStartMill + 500;
        PauseBlinkStatus = 0;
        Disp7.clearDisplay();
        BUZZ_Beep(SwBeepTime);
        Serial.println("Mode Pause");
        while((digitalRead(SW_U) == 0)||(digitalRead(SW_S) == 0)||(digitalRead(SW_E) == 0));
      }
    }
  }
  
  if(MainMode == ModePause){
    if(CurrentPauseBlink <= millis()){
      CurrentPauseBlink += 500;
      if(PauseBlinkStatus){
        PauseBlinkStatus = 0;
        Disp7.clearDisplay();
      }
      else{
        PauseBlinkStatus = 1;
        if(OpeOzTime>0) SegmentNumberDisp(OpeOzTime);
        else if (OpeUvTime>0) SegmentNumberDisp(OpeUvTime);
      }
    }
    if(CurrentPauseStartMill+300000 <= millis()) MainMode = ModeSetup;
    if((digitalRead(SW_U) == 0)||(digitalRead(SW_S) == 0)) {
      int i=0;
      for (i;i<=1000;i++){
        if((digitalRead(SW_U) != 0)&&(digitalRead(SW_S) != 0))
        break;
        delay(1);
      }
      if(i>=1000){
        MainMode = ModeSetup;
        SetupModeDisp(SegBlinkMode);
        BUZZ_Beep(1000);
        while((digitalRead(SW_U) == 0)||(digitalRead(SW_S) == 0));
        Serial.println("Setup Mode");
      }
    }
    if(digitalRead(SW_E) == 0){
      PauseBlinkStatus = 1;
      if(OpeOzTime>0) SegmentNumberDisp(OpeOzTime);
      else if (OpeUvTime>0) SegmentNumberDisp(OpeUvTime);
      int i=0;
      for (i;i<=2000;i++){
        if((digitalRead(SW_E) != 0))
        break;
        delay(1);
      }
      if(i>=2000) {
        Disp7.clearDisplay();
        MainMode = ModeCoutD; 
        BUZZ_Beep(500);
        Serial.println("Count Down Mode");
        CurrentCountDownMill = millis()+1000;
        CountDownmodeTime = 5;
      }
    }
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

void SegmentNumberDisp(unsigned int Numb){
  unsigned int tempNumb = Numb;
  ListDisp[3] = Numb%10;
  tempNumb = tempNumb/10;
  if(Numb<10) ListDisp[2] = 0x7f;
  else ListDisp[2] = tempNumb%10;
  tempNumb = tempNumb/10;
  if(Numb<100) ListDisp[1] = 0x7f;
  else ListDisp[1] = tempNumb%10;
  tempNumb = tempNumb/10;
  if(Numb<1000) ListDisp[0] = 0x7f;
  else ListDisp[0] = tempNumb%10;

  Seven_Segment_Display();
}

void TrunOnOzone(void){
  digitalWrite(R_LED, HIGH);
  pwmWrite(OZ_FAN1, FAN_SPEED);
  pwmWrite(OZ_FAN2, FAN_SPEED);
  pwmWrite(UV_FAN1, FAN_SPEED);
  pwmWrite(UV_FAN2, FAN_SPEED);
  digitalWrite(OZ_LAMP, LOW);
}

void TrunOnUV(void){
  digitalWrite(G_LED, HIGH);
  pwmWrite(OZ_FAN1, FAN_SPEED);
  pwmWrite(OZ_FAN2, FAN_SPEED);
  pwmWrite(UV_FAN1, FAN_SPEED);
  pwmWrite(UV_FAN2, FAN_SPEED);
  digitalWrite(UV_LAMP, LOW);
}

void TrunOffAll(void){
  digitalWrite(R_LED, LOW);
  pwmWrite(OZ_FAN1, 0);
  pwmWrite(OZ_FAN2, 0);
  digitalWrite(OZ_LAMP, HIGH);
  digitalWrite(F_FAN, LOW);

  digitalWrite(G_LED, LOW);
  pwmWrite(UV_FAN1, 0);
  pwmWrite(UV_FAN2, 0);
  digitalWrite(UV_LAMP, HIGH);
}

void BUZZ_Beep(unsigned int TimeBeep){
  digitalWrite(BUZZ, LOW);
  delay(TimeBeep);
  digitalWrite(BUZZ, HIGH);
}

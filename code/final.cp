#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/final.c"

sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;
#line 28 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/final.c"
unsigned int NB_Adherent = 0;
unsigned int NB = 155;
unsigned int rep = 0;
unsigned int etat;
unsigned int fcardio;
unsigned int calc_dist;
unsigned int counter;
unsigned int st = 0;
unsigned int delay_counter = 0;
unsigned int display_repos = 0;
unsigned int previous_logic_state = 0;
unsigned int heart_rate = 60;
unsigned int distance_value = 0;

char txt1[] = "Bienvenue !";
char txt2[] = "Freq: ";
char txt3[] = "Bravo: ";

char txt4[] = "Tapis En Cours";

char temp_txt[16];

void float_to_string(float value, char* str) {
 int int_part = (int)value;
 int dec_part = (int)((value - int_part) * 100);

 str[0] = (int_part / 10) + '0';
 str[1] = (int_part % 10) + '0';
 str[2] = '.';
 str[3] = (dec_part / 10) + '0';
 str[4] = (dec_part % 10) + '0';
 str[5] = 0xDF;
 str[6] = 'C';
 str[7] = '\0';
}

void interrupt() {

 if (INTCON.RBIF) {
 if ( RB4_bit  == 1) {
 st = 1;
 display_repos = 0;
 }
 INTCON.RBIF = 0;
 }


 if (INTCON.T0IF) {
 while (NB != 0) {
  ( RB1_bit  = 1) ;
 Delay_ms(30);
  ( RB1_bit  = 0) ;
 Delay_ms(30);
 NB--;
 }
 if (NB == 0) {
 rep = 1;
 NB = 155;
 st = 0;
  ( RB1_bit  = 0) ;
 INTCON.T0IE = 0;
 }
 INTCON.T0IF = 0;
 }


 if (INTCON.INTF) {
 NB_Adherent++;
 EEPROM_Write(0x01, NB_Adherent);
  ( RB2_bit  = 1) ;
 Delay_ms(500);
  ( RB2_bit  = 0) ;
 etat = 1;
 INTCON.INTF = 0;
 }
}


void main() {
 int temp_value;
 float temperature;
 char adherent_txt[16];
 char heart_rate_txt[16];
 char distance_txt[16];



 TRISB = 0x71;
 PORTB = 0x00;
 TRISD = 0x00;
 TRISC = 0x00;
 PORTC=0;
 PORTD = 0x00;

 ADC_Init();
 INTCON.INTE = 1;
 INTCON.GIE = 1;
 INTCON.RBIE = 1;
 OPTION_REG.INTEDG = 1;
 OPTION_REG.PSA = 0;
 OPTION_REG.PS2 = 1;
 OPTION_REG.PS1 = 1;
 OPTION_REG.PS0 = 1;
 OPTION_REG.T0CS = 0;
 TMR0 = 0;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, txt1);
 Delay_ms(500);

 NB_Adherent = EEPROM_Read(0x01);

 while (1) {
 INTCON.T0IF=0;

 temp_value = ADC_Read(0);
 temperature = (temp_value * 5.0 * 100.0) / 1023.0;


 if (temperature > 28.0) {
  ( RC6_bit  = 1) ;
  ( RB1_bit  = 1) ;
 } else {
  ( RC6_bit  = 0) ;
  ( RB1_bit  = 0) ;
 }

 if (st == 1) {
 heart_rate += 5;
 Lcd_init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 3, txt4);
 INTCON.T0IE = 1;

 }


 if (rep==1) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "repos");
 display_repos = 0;
 rep=0;
 }


 if (etat == 1) {
 Lcd_Cmd(_LCD_CLEAR);
 IntToStr(NB_Adherent, adherent_txt);
 Lcd_Out(1, 1, "Adherent:");
 Lcd_Out(2, 1, adherent_txt);
 Delay_ms(3000);
 Lcd_Cmd(_LCD_CLEAR);
  ( RB2_bit  = 0) ;
 etat = 0;
 }










 if ( RB5_bit  == 1) {

 IntToStr(heart_rate, heart_rate_txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, txt2);
 Lcd_Out(2, 1, heart_rate_txt);
  ( RB2_bit  = 1) ;
 Delay_ms(1000);
  ( RB2_bit  = 0) ;
 Delay_ms(1000);
 } else if ( RB5_bit  == 0) {
  ( RB2_bit  = 0) ;
 }


 if ( RB6_bit  == 1) {
 distance_value+=15;
 IntToStr(distance_value, distance_txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Distance en m");
 Lcd_Out(2, 1, distance_txt);
  ( RB1_bit  = 1) ;
 Delay_ms(2000);
  ( RB1_bit  = 0) ;
 Delay_ms(2000);
 }else if( RB6_bit  == 0){
  ( RB2_bit  = 0) ;
 }

 temp_value=ADC_Read(0);
 temperature=(temp_value*5.0*100.0)/1023.0;
 float_to_string(temperature,temp_txt);
 Lcd_Out(2,9,temp_txt);
#line 236 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/final.c"
 }
}

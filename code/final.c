// LCD module connections
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

#define logic RB0_bit
#define led_green RB1_bit
#define led_red RB2_bit
#define led_blue RB3_bit
#define cardio RB5_bit
#define distance RB6_bit
#define Start RB4_bit
#define motor RC6_bit

// Macros
#define set_high(port) (port = 1)
#define set_low(port) (port = 0)
unsigned int NB_Adherent = 0;
unsigned int NB = 155;
unsigned int rep = 0;
unsigned int etat;
unsigned int fcardio;
unsigned int calc_dist;
unsigned int counter;
unsigned int st = 0; // Define 'st' variable
unsigned int delay_counter = 0; // Delay counter to track 5 seconds
unsigned int display_repos = 0; // Flag to control when to display "repos"
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
        if (Start == 1) {
            st = 1;
            display_repos = 0;
        }
        INTCON.RBIF = 0; // Clear RB port change interrupt flag
    }

    // Handle Timer0 overflow interrupt
    if (INTCON.T0IF) {
        while (NB != 0) {
            set_high(led_green);
            Delay_ms(30);
            set_low(led_green);
            Delay_ms(30);
            NB--; // Decrement the counter
        }
        if (NB == 0) {
            rep = 1;
            NB = 155; // Reset NB
            st = 0; // Reset start flag
            set_low(led_green);
            INTCON.T0IE = 0; // Disable Timer0 interrupt
        }
        INTCON.T0IF = 0; // Clear Timer0 interrupt flag
    }

    // Handle external interrupt (RB0)
    if (INTCON.INTF) {
        NB_Adherent++; // Increment adherent count
        EEPROM_Write(0x01, NB_Adherent); // Store updated count in EEPROM
        set_high(led_red); // Indicate action
        Delay_ms(500);
        set_low(led_red); // Turn off indicator
        etat = 1; // Indicate adherent state
        INTCON.INTF = 0; // Clear external interrupt flag
    }
}

// Main program
void main() {
    int temp_value;
    float temperature;
    char adherent_txt[16];
    char heart_rate_txt[16];
    char distance_txt[16];


    // Initialize Ports and ADC
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

    // Initialize LCD
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Out(1, 1, txt1);
    Delay_ms(500);
   // Lcd_Cmd(_LCD_CLEAR);
   NB_Adherent = EEPROM_Read(0x01);

    while (1) {
    INTCON.T0IF=0;
        // Read temperature
        temp_value = ADC_Read(0);
        temperature = (temp_value * 5.0 * 100.0) / 1023.0;

        // Temperature Control
        if (temperature > 28.0) {
            set_high(motor);
            set_high(led_green);
        } else {
            set_low(motor);
            set_low(led_green);
        }

        if (st == 1) {
        heart_rate += 5;
        Lcd_init();
        Lcd_Cmd(_LCD_CLEAR);
           Lcd_Out(1, 3, txt4);
           INTCON.T0IE = 1;
           // st = 0;
        }

        // Display "repos" after 5 seconds
        if (rep==1) {
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(1, 1, "repos");
            display_repos = 0;
            rep=0;
        }

        // Adherent State
        if (etat == 1) {
            Lcd_Cmd(_LCD_CLEAR);
            IntToStr(NB_Adherent, adherent_txt); // Convert count to string
            Lcd_Out(1, 1, "Adherent:");
            Lcd_Out(2, 1, adherent_txt); // Display adherent count
            Delay_ms(3000); // Keep displayed for 3 seconds
            Lcd_Cmd(_LCD_CLEAR);
            set_low(led_red);
            etat = 0; // Reset state
        }

        //if(Start==1){
       // Lcd_Out(1, 3, txt4);
       // set_high(led_blue);
       // Delay_ms(5000);
       // set_low(led_blue);     // Keep the message displayed for 5 seconds     // Reset the rep flag only after the delay
       // Lcd_Cmd(_LCD_CLEAR);
        //}

        // Cardio Trigger
         if (cardio == 1) {
    // Heart rate measurement and display
    IntToStr(heart_rate, heart_rate_txt); // Convert heart rate to string
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1, 1, txt2); // Display "Freq:"
    Lcd_Out(2, 1, heart_rate_txt); // Display heart rate value
    set_high(led_red);
    Delay_ms(1000);
    set_low(led_red);
    Delay_ms(1000);
    } else if (cardio == 0) {
    set_low(led_red); // Turn off red LED
    }

        // Distance Trigger
        if (distance == 1) {
           distance_value+=15;
            IntToStr(distance_value, distance_txt); // Convert distance to string
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(1, 1, "Distance en m");
            Lcd_Out(2, 1, distance_txt); // Display distance value
            set_high(led_green);
            Delay_ms(2000); // Wait for 2 seconds
            set_low(led_green);
            Delay_ms(2000);
        }else if(distance == 0){
              set_low(led_red);
        }
           //// temparature
           temp_value=ADC_Read(0);
           temperature=(temp_value*5.0*100.0)/1023.0;
           float_to_string(temperature,temp_txt);
             Lcd_Out(2,9,temp_txt);


        // Increment the delay_counter if the Start button was pressed
        /*if (st == 1) {
            delay_counter++;
            Delay_ms(1000); // Wait for 1 second, simulating 1-second intervals
        }   */
    }
}
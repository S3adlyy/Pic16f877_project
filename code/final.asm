
_float_to_string:

	MOVF       FARG_float_to_string_value+0, 0
	MOVWF      R0+0
	MOVF       FARG_float_to_string_value+1, 0
	MOVWF      R0+1
	MOVF       FARG_float_to_string_value+2, 0
	MOVWF      R0+2
	MOVF       FARG_float_to_string_value+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FLOC__float_to_string+0
	MOVF       R0+1, 0
	MOVWF      FLOC__float_to_string+1
	MOVF       FLOC__float_to_string+0, 0
	MOVWF      float_to_string_int_part_L0+0
	MOVF       FLOC__float_to_string+1, 0
	MOVWF      float_to_string_int_part_L0+1
	MOVF       FLOC__float_to_string+0, 0
	MOVWF      R0+0
	MOVF       FLOC__float_to_string+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FARG_float_to_string_value+0, 0
	MOVWF      R0+0
	MOVF       FARG_float_to_string_value+1, 0
	MOVWF      R0+1
	MOVF       FARG_float_to_string_value+2, 0
	MOVWF      R0+2
	MOVF       FARG_float_to_string_value+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      float_to_string_dec_part_L0+0
	MOVF       R0+1, 0
	MOVWF      float_to_string_dec_part_L0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__float_to_string+0, 0
	MOVWF      R0+0
	MOVF       FLOC__float_to_string+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_float_to_string_str+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_float_to_string_str+0, 0
	MOVWF      FLOC__float_to_string+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       float_to_string_int_part_L0+0, 0
	MOVWF      R0+0
	MOVF       float_to_string_int_part_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__float_to_string+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVLW      2
	ADDWF      FARG_float_to_string_str+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	MOVLW      3
	ADDWF      FARG_float_to_string_str+0, 0
	MOVWF      FLOC__float_to_string+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       float_to_string_dec_part_L0+0, 0
	MOVWF      R0+0
	MOVF       float_to_string_dec_part_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__float_to_string+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVLW      4
	ADDWF      FARG_float_to_string_str+0, 0
	MOVWF      FLOC__float_to_string+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       float_to_string_dec_part_L0+0, 0
	MOVWF      R0+0
	MOVF       float_to_string_dec_part_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__float_to_string+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVLW      5
	ADDWF      FARG_float_to_string_str+0, 0
	MOVWF      FSR
	MOVLW      223
	MOVWF      INDF+0
	MOVLW      6
	ADDWF      FARG_float_to_string_str+0, 0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	MOVLW      7
	ADDWF      FARG_float_to_string_str+0, 0
	MOVWF      FSR
	CLRF       INDF+0
L_end_float_to_string:
	RETURN
; end of _float_to_string

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      INTCON+0, 0
	GOTO       L_interrupt0
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_interrupt1
	MOVLW      1
	MOVWF      _st+0
	MOVLW      0
	MOVWF      _st+1
	CLRF       _display_repos+0
	CLRF       _display_repos+1
L_interrupt1:
	BCF        INTCON+0, 0
L_interrupt0:
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt2
L_interrupt3:
	MOVLW      0
	XORWF      _NB+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt32
	MOVLW      0
	XORWF      _NB+0, 0
L__interrupt32:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt4
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_interrupt5:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt5
	DECFSZ     R12+0, 1
	GOTO       L_interrupt5
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
	MOVLW      1
	SUBWF      _NB+0, 1
	BTFSS      STATUS+0, 0
	DECF       _NB+1, 1
	GOTO       L_interrupt3
L_interrupt4:
	MOVLW      0
	XORWF      _NB+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt33
	MOVLW      0
	XORWF      _NB+0, 0
L__interrupt33:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
	MOVLW      1
	MOVWF      _rep+0
	MOVLW      0
	MOVWF      _rep+1
	MOVLW      155
	MOVWF      _NB+0
	CLRF       _NB+1
	CLRF       _st+0
	CLRF       _st+1
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BCF        INTCON+0, 5
L_interrupt7:
	BCF        INTCON+0, 2
L_interrupt2:
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt8
	INCF       _NB_Adherent+0, 1
	BTFSC      STATUS+0, 2
	INCF       _NB_Adherent+1, 1
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _NB_Adherent+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt9:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt9
	DECFSZ     R12+0, 1
	GOTO       L_interrupt9
	DECFSZ     R11+0, 1
	GOTO       L_interrupt9
	NOP
	NOP
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      1
	MOVWF      _etat+0
	MOVLW      0
	MOVWF      _etat+1
	BCF        INTCON+0, 1
L_interrupt8:
L_end_interrupt:
L__interrupt31:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

	MOVLW      113
	MOVWF      TRISB+0
	CLRF       PORTB+0
	CLRF       TRISD+0
	CLRF       TRISC+0
	CLRF       PORTC+0
	CLRF       PORTD+0
	CALL       _ADC_Init+0
	BSF        INTCON+0, 4
	BSF        INTCON+0, 7
	BSF        INTCON+0, 3
	BSF        OPTION_REG+0, 6
	BCF        OPTION_REG+0, 3
	BSF        OPTION_REG+0, 2
	BSF        OPTION_REG+0, 1
	BSF        OPTION_REG+0, 0
	BCF        OPTION_REG+0, 5
	CLRF       TMR0+0
	CALL       _Lcd_Init+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _NB_Adherent+0
	CLRF       _NB_Adherent+1
L_main11:
	BCF        INTCON+0, 2
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      96
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main14
L_main13:
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
L_main14:
	MOVLW      0
	XORWF      _st+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      1
	XORWF      _st+0, 0
L__main35:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	MOVLW      5
	ADDWF      _heart_rate+0, 1
	BTFSC      STATUS+0, 0
	INCF       _heart_rate+1, 1
	CALL       _Lcd_Init+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        INTCON+0, 5
L_main15:
	MOVLW      0
	XORWF      _rep+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      1
	XORWF      _rep+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_final+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _display_repos+0
	CLRF       _display_repos+1
	CLRF       _rep+0
	CLRF       _rep+1
L_main16:
	MOVLW      0
	XORWF      _etat+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      1
	XORWF      _etat+0, 0
L__main37:
	BTFSS      STATUS+0, 2
	GOTO       L_main17
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVF       _NB_Adherent+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _NB_Adherent+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_adherent_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_final+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_adherent_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	CLRF       _etat+0
	CLRF       _etat+1
L_main17:
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main19
	MOVF       _heart_rate+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _heart_rate+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_heart_rate_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_heart_rate_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
	GOTO       L_main22
L_main19:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main23
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
L_main23:
L_main22:
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main24
	MOVLW      15
	ADDWF      _distance_value+0, 0
	MOVWF      R0+0
	MOVF       _distance_value+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _distance_value+0
	MOVF       R0+1, 0
	MOVWF      _distance_value+1
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_distance_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_final+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_distance_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
	GOTO       L_main27
L_main24:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main28
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
L_main28:
L_main27:
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_float_to_string_value+0
	MOVF       R0+1, 0
	MOVWF      FARG_float_to_string_value+1
	MOVF       R0+2, 0
	MOVWF      FARG_float_to_string_value+2
	MOVF       R0+3, 0
	MOVWF      FARG_float_to_string_value+3
	MOVLW      _temp_txt+0
	MOVWF      FARG_float_to_string_str+0
	CALL       _float_to_string+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main11
L_end_main:
	GOTO       $+0
; end of _main

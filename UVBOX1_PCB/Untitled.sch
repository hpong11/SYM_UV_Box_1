EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Untitled-rescue:stm32f103c8t6-module-china-stm32f103c8t6-module-china U1
U 1 1 611E0C92
P 5500 2900
F 0 "U1" H 5500 4637 60  0000 C CNN
F 1 "stm32f103c8t6-module-china" H 5500 4531 60  0000 C CNN
F 2 "MyFootprint:Stm32f103_module" H 5500 1200 60  0001 C CNN
F 3 "" H 5100 3150 60  0000 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 6122922A
P 1050 2700
F 0 "J1" H 1158 2981 50  0000 C CNN
F 1 "Conn_01x04_Male" H 1158 2890 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1050 2700 50  0001 C CNN
F 3 "~" H 1050 2700 50  0001 C CNN
	1    1050 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 61277107
P 1350 800
F 0 "J2" H 1430 792 50  0000 L CNN
F 1 "Power_IN" H 1430 701 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 1350 800 50  0001 C CNN
F 3 "~" H 1350 800 50  0001 C CNN
	1    1350 800 
	1    0    0    -1  
$EndComp
$Comp
L UVC_Sym:LM2596S_Module M1
U 1 1 61278BAA
P 1350 1650
F 0 "M1" H 1350 1925 50  0000 C CNN
F 1 "LM2596S_Module" H 1350 1834 50  0000 C CNN
F 2 "Untitled:HW-411" H 1050 1900 50  0001 C CNN
F 3 "" H 1050 1900 50  0001 C CNN
	1    1350 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0101
U 1 1 6127D1F5
P 1150 800
F 0 "#PWR0101" H 1150 650 50  0001 C CNN
F 1 "+12V" H 1165 973 50  0000 C CNN
F 2 "" H 1150 800 50  0001 C CNN
F 3 "" H 1150 800 50  0001 C CNN
	1    1150 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 6127DB8E
P 900 1550
F 0 "#PWR0102" H 900 1400 50  0001 C CNN
F 1 "+12V" H 915 1723 50  0000 C CNN
F 2 "" H 900 1550 50  0001 C CNN
F 3 "" H 900 1550 50  0001 C CNN
	1    900  1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  1550 900  1600
Wire Wire Line
	900  1600 1000 1600
$Comp
L power:GND #PWR0105
U 1 1 61284662
P 1700 1750
F 0 "#PWR0105" H 1700 1500 50  0001 C CNN
F 1 "GND" H 1705 1577 50  0000 C CNN
F 2 "" H 1700 1750 50  0001 C CNN
F 3 "" H 1700 1750 50  0001 C CNN
	1    1700 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 61284E83
P 1800 1550
F 0 "#PWR0106" H 1800 1400 50  0001 C CNN
F 1 "+5V" H 1815 1723 50  0000 C CNN
F 2 "" H 1800 1550 50  0001 C CNN
F 3 "" H 1800 1550 50  0001 C CNN
	1    1800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1600 1800 1600
Wire Wire Line
	1800 1600 1800 1550
$Comp
L power:GND #PWR0107
U 1 1 61285DB6
P 4000 4200
F 0 "#PWR0107" H 4000 3950 50  0001 C CNN
F 1 "GND" H 4005 4027 50  0000 C CNN
F 2 "" H 4000 4200 50  0001 C CNN
F 3 "" H 4000 4200 50  0001 C CNN
	1    4000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4200 4450 4200
$Comp
L power:GND #PWR0108
U 1 1 61289C69
P 6800 1500
F 0 "#PWR0108" H 6800 1250 50  0001 C CNN
F 1 "GND" H 6805 1327 50  0000 C CNN
F 2 "" H 6800 1500 50  0001 C CNN
F 3 "" H 6800 1500 50  0001 C CNN
	1    6800 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1500 6550 1500
Wire Wire Line
	4450 4050 4100 4050
$Comp
L power:+5V #PWR0109
U 1 1 61288DC5
P 4100 4050
F 0 "#PWR0109" H 4100 3900 50  0001 C CNN
F 1 "+5V" V 4115 4178 50  0000 L CNN
F 2 "" H 4100 4050 50  0001 C CNN
F 3 "" H 4100 4050 50  0001 C CNN
	1    4100 4050
	0    -1   -1   0   
$EndComp
Text GLabel 1250 2900 2    50   Input ~ 0
RX2
Text GLabel 6550 3300 2    50   Input ~ 0
RX2
Text GLabel 1250 2800 2    50   Input ~ 0
TX2
Text GLabel 6550 3450 2    50   Input ~ 0
TX2
$Comp
L power:+3V3 #PWR0112
U 1 1 612CB145
P 4450 4350
F 0 "#PWR0112" H 4450 4200 50  0001 C CNN
F 1 "+3V3" V 4465 4478 50  0000 L CNN
F 2 "" H 4450 4350 50  0001 C CNN
F 3 "" H 4450 4350 50  0001 C CNN
	1    4450 4350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0113
U 1 1 612CC986
P 1550 2600
F 0 "#PWR0113" H 1550 2450 50  0001 C CNN
F 1 "+3V3" H 1565 2773 50  0000 C CNN
F 2 "" H 1550 2600 50  0001 C CNN
F 3 "" H 1550 2600 50  0001 C CNN
	1    1550 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2700 1550 2750
Wire Wire Line
	1250 2600 1550 2600
Wire Wire Line
	1550 2700 1250 2700
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 612D50EC
P 10250 1000
F 0 "J3" H 10330 992 50  0000 L CNN
F 1 "SW_1" H 10330 901 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 10250 1000 50  0001 C CNN
F 3 "~" H 10250 1000 50  0001 C CNN
	1    10250 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 612D66EE
P 10250 1600
F 0 "J5" H 10330 1592 50  0000 L CNN
F 1 "SW_3" H 10330 1501 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 10250 1600 50  0001 C CNN
F 3 "~" H 10250 1600 50  0001 C CNN
	1    10250 1600
	1    0    0    -1  
$EndComp
Text GLabel 10050 1000 0    50   Input ~ 0
PB12
Text GLabel 10050 1300 0    50   Input ~ 0
PB13
Text GLabel 10050 1600 0    50   Input ~ 0
PB14
Text GLabel 4450 1500 0    50   Input ~ 0
PB12
Text GLabel 4450 1650 0    50   Input ~ 0
PB13
Text GLabel 4450 1800 0    50   Input ~ 0
PB14
$Comp
L power:GND #PWR01
U 1 1 612D7956
P 9700 1700
F 0 "#PWR01" H 9700 1450 50  0001 C CNN
F 1 "GND" H 9705 1527 50  0000 C CNN
F 2 "" H 9700 1700 50  0001 C CNN
F 3 "" H 9700 1700 50  0001 C CNN
	1    9700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1700 10050 1700
Wire Wire Line
	10050 1400 9700 1400
Wire Wire Line
	9700 1400 9700 1700
Connection ~ 9700 1700
Wire Wire Line
	10050 1100 9700 1100
Wire Wire Line
	9700 1100 9700 1400
Connection ~ 9700 1400
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 612D9DE5
P 10250 2300
F 0 "J6" H 10330 2292 50  0000 L CNN
F 1 "Blue LED" H 10330 2201 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 10250 2300 50  0001 C CNN
F 3 "~" H 10250 2300 50  0001 C CNN
	1    10250 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 612DA2A8
P 10250 2750
F 0 "J7" H 10330 2742 50  0000 L CNN
F 1 "Yellow LED" H 10330 2651 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 10250 2750 50  0001 C CNN
F 3 "~" H 10250 2750 50  0001 C CNN
	1    10250 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 612DAC3B
P 9800 2300
F 0 "R1" V 9595 2300 50  0000 C CNN
F 1 "R_US" V 9686 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9840 2290 50  0001 C CNN
F 3 "~" H 9800 2300 50  0001 C CNN
	1    9800 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 612DB4AA
P 9800 2750
F 0 "R2" V 9595 2750 50  0000 C CNN
F 1 "R_US" V 9686 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9840 2740 50  0001 C CNN
F 3 "~" H 9800 2750 50  0001 C CNN
	1    9800 2750
	0    1    1    0   
$EndComp
Text GLabel 9650 2300 0    50   Input ~ 0
B_LED
Text GLabel 9650 2750 0    50   Input ~ 0
Y_LED
$Comp
L power:GND #PWR03
U 1 1 612DC017
P 10050 2850
F 0 "#PWR03" H 10050 2600 50  0001 C CNN
F 1 "GND" H 10055 2677 50  0000 C CNN
F 2 "" H 10050 2850 50  0001 C CNN
F 3 "" H 10050 2850 50  0001 C CNN
	1    10050 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 612DC46D
P 10050 2400
F 0 "#PWR02" H 10050 2150 50  0001 C CNN
F 1 "GND" H 10055 2227 50  0000 C CNN
F 2 "" H 10050 2400 50  0001 C CNN
F 3 "" H 10050 2400 50  0001 C CNN
	1    10050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2300 10050 2300
Wire Wire Line
	9950 2750 10050 2750
Text GLabel 4450 2100 0    50   Input ~ 0
B_LED
Text GLabel 6550 3150 2    50   Input ~ 0
Y_LED
$Comp
L Connector:Screw_Terminal_01x04 J8
U 1 1 612DD7D5
P 10250 3550
F 0 "J8" H 10330 3542 50  0000 L CNN
F 1 "Relay" H 10330 3451 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 10250 3550 50  0001 C CNN
F 3 "~" H 10250 3550 50  0001 C CNN
	1    10250 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 612D5B9F
P 10250 1300
F 0 "J4" H 10330 1292 50  0000 L CNN
F 1 "SW_2" H 10330 1201 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 10250 1300 50  0001 C CNN
F 3 "~" H 10250 1300 50  0001 C CNN
	1    10250 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 612DF7F1
P 10050 3750
F 0 "#PWR05" H 10050 3500 50  0001 C CNN
F 1 "GND" H 10055 3577 50  0000 C CNN
F 2 "" H 10050 3750 50  0001 C CNN
F 3 "" H 10050 3750 50  0001 C CNN
	1    10050 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 612DFBFB
P 10050 3450
F 0 "#PWR04" H 10050 3300 50  0001 C CNN
F 1 "+5V" H 10065 3623 50  0000 C CNN
F 2 "" H 10050 3450 50  0001 C CNN
F 3 "" H 10050 3450 50  0001 C CNN
	1    10050 3450
	1    0    0    -1  
$EndComp
Text GLabel 10050 3650 0    50   Input ~ 0
PB5
Text GLabel 10050 3550 0    50   Input ~ 0
PB8
Text GLabel 4450 3750 0    50   Input ~ 0
PB8
Text GLabel 4450 3300 0    50   Input ~ 0
PB5
$Comp
L Connector:Screw_Terminal_01x04 J9
U 1 1 612E4095
P 1350 4150
F 0 "J9" H 1268 3725 50  0000 C CNN
F 1 "L298_1" H 1268 3816 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 1350 4150 50  0001 C CNN
F 3 "~" H 1350 4150 50  0001 C CNN
	1    1350 4150
	-1   0    0    1   
$EndComp
Text GLabel 1550 4250 2    50   Input ~ 0
PB1
Text GLabel 1550 4050 2    50   Input ~ 0
PB10
Text GLabel 1550 3950 2    50   Input ~ 0
PB0
Wire Wire Line
	1550 4150 1950 4150
$Comp
L Connector:Screw_Terminal_01x04 J10
U 1 1 612E66A2
P 1350 4950
F 0 "J10" H 1268 4525 50  0000 C CNN
F 1 "L298_2" H 1268 4616 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 1350 4950 50  0001 C CNN
F 3 "~" H 1350 4950 50  0001 C CNN
	1    1350 4950
	-1   0    0    1   
$EndComp
Text GLabel 1550 5050 2    50   Input ~ 0
PA6
Text GLabel 1550 4850 2    50   Input ~ 0
PB11
Text GLabel 1550 4750 2    50   Input ~ 0
PA7
$Comp
L power:GND #PWR0110
U 1 1 612E82FB
P 1950 4150
F 0 "#PWR0110" H 1950 3900 50  0001 C CNN
F 1 "GND" H 1955 3977 50  0000 C CNN
F 2 "" H 1950 4150 50  0001 C CNN
F 3 "" H 1950 4150 50  0001 C CNN
	1    1950 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 612E86AC
P 1550 2750
F 0 "#PWR0114" H 1550 2500 50  0001 C CNN
F 1 "GND" H 1555 2577 50  0000 C CNN
F 2 "" H 1550 2750 50  0001 C CNN
F 3 "" H 1550 2750 50  0001 C CNN
	1    1550 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 612E8B0E
P 1900 4950
F 0 "#PWR0115" H 1900 4700 50  0001 C CNN
F 1 "GND" H 1905 4777 50  0000 C CNN
F 2 "" H 1900 4950 50  0001 C CNN
F 3 "" H 1900 4950 50  0001 C CNN
	1    1900 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4950 1900 4950
$Comp
L Connector:Screw_Terminal_01x04 J11
U 1 1 612E94C6
P 1350 5750
F 0 "J11" H 1268 5325 50  0000 C CNN
F 1 "L298_3" H 1268 5416 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 1350 5750 50  0001 C CNN
F 3 "~" H 1350 5750 50  0001 C CNN
	1    1350 5750
	-1   0    0    1   
$EndComp
Text GLabel 1550 5650 2    50   Input ~ 0
PA15
$Comp
L power:GND #PWR0116
U 1 1 612EA11D
P 1850 5750
F 0 "#PWR0116" H 1850 5500 50  0001 C CNN
F 1 "GND" H 1855 5577 50  0000 C CNN
F 2 "" H 1850 5750 50  0001 C CNN
F 3 "" H 1850 5750 50  0001 C CNN
	1    1850 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5750 1850 5750
$Comp
L Connector:Screw_Terminal_01x02 J12
U 1 1 612EE48C
P 2250 800
F 0 "J12" H 2330 792 50  0000 L CNN
F 1 "Power_OUT" H 2330 701 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 2250 800 50  0001 C CNN
F 3 "~" H 2250 800 50  0001 C CNN
	1    2250 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0118
U 1 1 612EF0B9
P 2050 800
F 0 "#PWR0118" H 2050 650 50  0001 C CNN
F 1 "+12V" H 2065 973 50  0000 C CNN
F 2 "" H 2050 800 50  0001 C CNN
F 3 "" H 2050 800 50  0001 C CNN
	1    2050 800 
	1    0    0    -1  
$EndComp
Text GLabel 6550 2550 2    50   Input ~ 0
PB0
Text GLabel 6550 2250 2    50   Input ~ 0
PB10
Text GLabel 6550 2400 2    50   Input ~ 0
PB1
Text GLabel 6550 2700 2    50   Input ~ 0
PA7
Text GLabel 6550 2100 2    50   Input ~ 0
PB11
Text GLabel 6550 2850 2    50   Input ~ 0
PA6
Text GLabel 4450 2850 0    50   Input ~ 0
PA15
NoConn ~ 6550 1950
NoConn ~ 6550 3000
NoConn ~ 6550 3600
NoConn ~ 6550 3750
NoConn ~ 6550 3900
NoConn ~ 6550 4050
NoConn ~ 6550 4200
NoConn ~ 6550 4350
NoConn ~ 4450 3900
NoConn ~ 4450 3600
NoConn ~ 4450 3450
NoConn ~ 4450 3150
NoConn ~ 4450 3000
NoConn ~ 4450 2700
NoConn ~ 4450 2550
NoConn ~ 4450 2400
NoConn ~ 4450 2250
NoConn ~ 4450 1950
NoConn ~ 6550 1800
NoConn ~ 6550 1650
$Comp
L power:GND #PWR?
U 1 1 6135376E
P 1000 1750
F 0 "#PWR?" H 1000 1500 50  0001 C CNN
F 1 "GND" H 1005 1577 50  0000 C CNN
F 2 "" H 1000 1750 50  0001 C CNN
F 3 "" H 1000 1750 50  0001 C CNN
	1    1000 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61353B05
P 1150 900
F 0 "#PWR?" H 1150 650 50  0001 C CNN
F 1 "GND" H 1155 727 50  0000 C CNN
F 2 "" H 1150 900 50  0001 C CNN
F 3 "" H 1150 900 50  0001 C CNN
	1    1150 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61353DF9
P 2050 900
F 0 "#PWR?" H 2050 650 50  0001 C CNN
F 1 "GND" H 2055 727 50  0000 C CNN
F 2 "" H 2050 900 50  0001 C CNN
F 3 "" H 2050 900 50  0001 C CNN
	1    2050 900 
	1    0    0    -1  
$EndComp
$EndSCHEMATC

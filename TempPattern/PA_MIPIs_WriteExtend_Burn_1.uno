Unison:SyntaxRevision1909.12;
Pattern PA_MIPI_WriteExtend_Burn {
Comment = "";
Type Logic;

PinList = "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin";
SubsetPins mipibus = "CLK_pin+DATA_pin";
PinUsage "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin" = FX;
AliasMap LTXC_MSDMap;
Default WaveformTable Timing;
Default Vector *0000*;
SendRef DSP_Send_Ref = "DATA_pin";


$START
*00* Timing, mipibus;
*00* Timing, mipibus; <SELECT 0>
*00* Timing, mipibus; <RPT SendPipeline> "SSC_2 Start" 
*01* Timing, mipibus; "SSC_1" 
*00* Timing, mipibus; "SSC_0" 
*11* Timing, mipibus; "SA_3 USID(1110)" 
*11* Timing, mipibus; "SA_2" 
*11* Timing, mipibus; "SA_1" 
*10* Timing, mipibus; "SA_0" 
*10* Timing, mipibus; "Mode_3 mode Extend write(010)" 
*10* Timing, mipibus; "Mode_2 " 
*10* Timing, mipibus; "Mode_1" 
*10* Timing, mipibus; "Mode_0" 
*10* Timing, mipibus; "BC_3 0000 => write 1byte" 
*10* Timing, mipibus; "BC_2" 
*10* Timing, mipibus; "BC_1" 
*10* Timing, mipibus; "BC_0" 
*11* Timing, mipibus; "P" 
*11* Timing, mipibus; "Addr_7 Addr:0xA0" 
*10* Timing, mipibus; "Addr_6" 
*11* Timing, mipibus; "Addr_5" 
*10* Timing, mipibus; "Addr_4" 
*10* Timing, mipibus; "Addr_3" 
*10* Timing, mipibus; "Addr_2" 
*10* Timing, mipibus; "Addr_1" 
*10* Timing, mipibus; "Addr_0" 
*11* Timing, mipibus; "P 0xA0" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_7 SendArray[0]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_6 SendArray[1]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_5 SendArray[2]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_4 SendArray[3]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_3 SendArray[4]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_2 SendArray[5]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_1 SendArray[6]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_0 SendArray[7]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "P SendArray[8]" 
*10* Timing, mipibus; "Bus Park" 
*00* Timing, mipibus; <RPT 10>
*01* Timing, mipibus; <RPT 10>"Burn" 
*00* Timing, mipibus; <RPT 10>
$END
*00* Timing, mipibus; <STOP_IDLE>
}


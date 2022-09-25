Unison:SyntaxRevision1909.15;

Pattern PA_MIPIs_WriteNormal_1 {
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
*10* Timing, mipibus; "Mode_2 mode write(010)" 
*11* Timing, mipibus; "Mode_1" 
*10* Timing, mipibus; "Mode_0" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "Addr_4 SendArray[0]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "Addr_3 SendArray[1]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "Addr_2 SendArray[2]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "Addr_1 SendArray[3]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "Addr_0 SendArray[4]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "P SendArray[5]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_7 SendArray[6]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_6 SendArray[7]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_5 SendArray[8]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_4 SendArray[9]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_3 SendArray[10]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_2 SendArray[11]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_1 SendArray[12]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "DATA_0 SendArray[13]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref> "P SendArray[14]" 
*10* Timing, mipibus; "Bus Park" 
$END
*00* Timing, mipibus; <STOP_IDLE>
}


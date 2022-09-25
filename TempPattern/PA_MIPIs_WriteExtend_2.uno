Unison:SyntaxRevision1909.15;

Pattern PA_MIPIs_WriteExtend_2 {
Comment = "";
Type Logic;

PinList = "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin";
SubsetPins mipibus = "CLK_1_pin+DATA_1_pin";
PinUsage "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin" = FX;
AliasMap LTXC_MSDMap;
Default WaveformTable Timing;
Default Vector *0000*;

SendRef DSP_Send_Ref_1 = "DATA_1_pin";


$START
*00* Timing, mipibus;
*00* Timing, mipibus; <SELECT 0>
*00* Timing, mipibus; <RPT SendPipeline> "SSC_2 Start" 
*01* Timing, mipibus; "SSC_1" 
*00* Timing, mipibus; "SSC_0" 
*11* Timing, mipibus; "SA_3 USID(1100)" 
*11* Timing, mipibus; "SA_2" 
*11* Timing, mipibus; "SA_1" 
*10* Timing, mipibus; "SA_0" 
*10* Timing, mipibus; "Mode_3 mode Extend write" 
*10* Timing, mipibus; "Mode_2 " 
*10* Timing, mipibus; "Mode_1" 
*10* Timing, mipibus; "Mode_0" 
*10* Timing, mipibus; "BC_3 0000 => write 1byte" 
*10* Timing, mipibus; "BC_2" 
*10* Timing, mipibus; "BC_1" 
*10* Timing, mipibus; "BC_0" 
*10* Timing, mipibus; "P" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_7 SendArray[0]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_6 SendArray[1]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_5 SendArray[2]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_4 SendArray[3]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_3 SendArray[4]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_2 SendArray[5]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_1 SendArray[6]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "Addr_0 SendArray[7]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "P SendArray[8]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_7 SendArray[9]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_6 SendArray[10]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_5 SendArray[11]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_4 SendArray[12]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_3 SendArray[13]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_2 SendArray[14]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_1 SendArray[15]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "DATA_0 SendArray[16]" 
*1S* Timing, mipibus; <NEXT DSP_Send_Ref_1> "P SendArray[17]" 
*10* Timing, mipibus; "Bus Park" 
$END
*00* Timing, mipibus; <STOP_IDLE>
}


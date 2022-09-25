Unison:SyntaxRevision1909.12;
Pattern PA_MIPI_ReadExtend {
Comment = "";
Type Logic;

PinList = "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin";
PinUsage "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin" = FX;
AliasMap LTXC_MSDMap;
SubsetPins mipibus = "CLK_pin+DATA_pin";

Default WaveformTable Timing;
Default Vector *0000*;

SendRef DSP_Send_Ref = "DATA_pin";
CaptureRef Cap_Ref = "DATA_pin";


$START
*00*Timing,mipibus;
*00*Timing,mipibus; <SELECT 0>
*00*Timing,mipibus; <RPT SendPipeline> "SSC_2 Start" 
*01*Timing,mipibus; "SSC_1" 
*00*Timing,mipibus; "SSC_0" 
*11*Timing,mipibus; "SA_3 USID(1100)" 
*11*Timing,mipibus; "SA_2" 
*10*Timing,mipibus; "SA_1" 
*10*Timing,mipibus; "SA_0" 
*10*Timing,mipibus; "Mode_3 mode Extend read(0010)" 
*10*Timing,mipibus; "Mode_2 " 
*11*Timing,mipibus; "Mode_1" 
*10*Timing,mipibus; "Mode_0" 
*10*Timing,mipibus; "BC_3 0000 => write 1byte" 
*10*Timing,mipibus; "BC_2" 
*10*Timing,mipibus; "BC_1" 
*10*Timing,mipibus; "BC_0" 
*10*Timing,mipibus; "P" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_7 SendArray[0]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_6 SendArray[1]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_5 SendArray[2]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_4 SendArray[3]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_3 SendArray[4]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_2 SendArray[5]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_1 SendArray[6]" 
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "Addr_0 SendArray[7]"  
*1S*Timing,mipibus; <NEXT DSP_Send_Ref> "P SendArray[8]" 
*10*Timing,mipibus; "Bus Park" 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_7 " 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_6 " 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_5 " 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_4" 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_3" 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_2" 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_1" 
*1V*Timing,mipibus; <NEXT Cap_Ref> "DATA_0" 
*1V*Timing,mipibus; <NEXT Cap_Ref> "P" 
*10*Timing,mipibus; "Bus Park" 
$END
*00*Timing,mipibus; <STOP_IDLE>
}


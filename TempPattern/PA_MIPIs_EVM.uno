Unison:SyntaxRevision1909.15;

Pattern PA_MIPIs_EVM {
Comment = "";
Type Logic;

PinList = "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin+FX_TRIGGER_pin";
PinUsage "CLK_pin+DATA_pin+CLK_1_pin+DATA_1_pin+FX_TRIGGER_pin" = FX;
SubsetPins mipibus = "CLK_pin+DATA_pin+FX_TRIGGER_pin";
AliasMap LTXC_MSDMap;
Default WaveformTable W_MIPI_52M;
Default Vector *00000*;

$DisTri
*000* W_MIPI_52M, mipibus; "SSC_2 Start" 
*010* W_MIPI_52M, mipibus; "SSC_1" 
*000* W_MIPI_52M, mipibus; "SSC_0" 
*110* W_MIPI_52M, mipibus; "SA_3 USID(1110)" 
*110* W_MIPI_52M, mipibus; "SA_2" 
*110* W_MIPI_52M, mipibus; "SA_1" 
*100* W_MIPI_52M, mipibus; "SA_0" 
*100* W_MIPI_52M, mipibus; "Mode_2 mode write(010)" 
*110* W_MIPI_52M, mipibus; "Mode_1" 
*100* W_MIPI_52M, mipibus; "Mode_0" 
*110* W_MIPI_52M, mipibus; "Addr_4 SendArray[0]" 
*110* W_MIPI_52M, mipibus; "Addr_3 SendArray[1]" 
*110* W_MIPI_52M, mipibus; "Addr_2 SendArray[2]" 
*100* W_MIPI_52M, mipibus; "Addr_1 SendArray[3]" 
*100* W_MIPI_52M, mipibus; "Addr_0 SendArray[4]" 
*100* W_MIPI_52M, mipibus; "P SendArray[5]" 
*100* W_MIPI_52M, mipibus; "DATA_7 SendArray[6]" 
*100* W_MIPI_52M, mipibus; "DATA_6 SendArray[7]" 
*110* W_MIPI_52M, mipibus; "DATA_5 SendArray[8]" 
*110* W_MIPI_52M, mipibus; "DATA_4 SendArray[9]" 
*110* W_MIPI_52M, mipibus; "DATA_3 SendArray[10]" 
*100* W_MIPI_52M, mipibus; "DATA_2 SendArray[11]" 
*100* W_MIPI_52M, mipibus; "DATA_1 SendArray[12]" 
*100* W_MIPI_52M, mipibus; "DATA_0 SendArray[13]" 
*100* W_MIPI_52M, mipibus; "P SendArray[14]" 
*100* W_MIPI_52M, mipibus; "Bus Park"
$WLANTX
*000* W_MIPI_52M, mipibus; "SSC_2 Start" 
*010* W_MIPI_52M, mipibus; "SSC_1" 
*000* W_MIPI_52M, mipibus; "SSC_0" 
*110* W_MIPI_52M, mipibus; "SA_3 USID(1110)" 
*110* W_MIPI_52M, mipibus; "SA_2" 
*110* W_MIPI_52M, mipibus; "SA_1" 
*100* W_MIPI_52M, mipibus; "SA_0" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_7 SendArray[0]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_6 SendArray[1]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_5 SendArray[2]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_4 SendArray[3]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_3 SendArray[4]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_2 SendArray[5]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_1 SendArray[6]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "DATA_0 SendArray[7]" 
*1S0* W_MIPI_52M, mipibus; <NEXT DSP_Send_Ref> "P SendArray[8]" 
*101* W_MIPI_52M, mipibus; "Bus Park" 
*100* W_MIPI_52M, mipibus; <RPT x> 
$DisTri_2nd
*000* W_MIPI_52M, mipibus; "SSC_2 Start" 
*010* W_MIPI_52M, mipibus; "SSC_1" 
*000* W_MIPI_52M, mipibus; "SSC_0" 
*110* W_MIPI_52M, mipibus; "SA_3 USID(1110)" 
*110* W_MIPI_52M, mipibus; "SA_2" 
*110* W_MIPI_52M, mipibus; "SA_1" 
*100* W_MIPI_52M, mipibus; "SA_0" 
*100* W_MIPI_52M, mipibus; "Mode_2 mode write(010)" 
*110* W_MIPI_52M, mipibus; "Mode_1" 
*100* W_MIPI_52M, mipibus; "Mode_0" 
*110* W_MIPI_52M, mipibus; "Addr_4 SendArray[0]" 
*110* W_MIPI_52M, mipibus; "Addr_3 SendArray[1]" 
*110* W_MIPI_52M, mipibus; "Addr_2 SendArray[2]" 
*100* W_MIPI_52M, mipibus; "Addr_1 SendArray[3]" 
*100* W_MIPI_52M, mipibus; "Addr_0 SendArray[4]" 
*100* W_MIPI_52M, mipibus; "P SendArray[5]" 
*100* W_MIPI_52M, mipibus; "DATA_7 SendArray[6]" 
*100* W_MIPI_52M, mipibus; "DATA_6 SendArray[7]" 
*110* W_MIPI_52M, mipibus; "DATA_5 SendArray[8]" 
*110* W_MIPI_52M, mipibus; "DATA_4 SendArray[9]" 
*110* W_MIPI_52M, mipibus; "DATA_3 SendArray[10]" 
*100* W_MIPI_52M, mipibus; "DATA_2 SendArray[11]" 
*100* W_MIPI_52M, mipibus; "DATA_1 SendArray[12]" 
*100* W_MIPI_52M, mipibus; "DATA_0 SendArray[13]" 
*100* W_MIPI_52M, mipibus; "P SendArray[14]" 
*100* W_MIPI_52M, mipibus; "Bus Park"
$WLANOFF
*000* W_MIPI_52M, mipibus; "SSC_2 Start" 
*010* W_MIPI_52M, mipibus; "SSC_1" 
*000* W_MIPI_52M, mipibus; "SSC_0" 
*110* W_MIPI_52M, mipibus; "SA_3 USID(1110)" 
*110* W_MIPI_52M, mipibus; "SA_2" 
*110* W_MIPI_52M, mipibus; "SA_1" 
*100* W_MIPI_52M, mipibus; "SA_0" 
*110* W_MIPI_52M, mipibus; "DATA_7 SendArray[0]" 
*100* W_MIPI_52M, mipibus; "DATA_6 SendArray[1]" 
*100* W_MIPI_52M, mipibus; "DATA_5 SendArray[2]" 
*100* W_MIPI_52M, mipibus; "DATA_4 SendArray[3]" 
*100* W_MIPI_52M, mipibus; "DATA_3 SendArray[4]" 
*100* W_MIPI_52M, mipibus; "DATA_2 SendArray[5]" 
*100* W_MIPI_52M, mipibus; "DATA_1 SendArray[6]" 
*100* W_MIPI_52M, mipibus; "DATA_0 SendArray[7]" 
*100* W_MIPI_52M, mipibus; "P SendArray[8]" 
*100* W_MIPI_52M, mipibus; "Bus Park" 
$END
*000* W_MIPI_52M, mipibus; <STOP_IDLE>
}


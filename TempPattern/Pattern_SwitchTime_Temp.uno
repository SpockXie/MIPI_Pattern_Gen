Unison:SyntaxRevision1909.15;

Pattern Pattern_Temp {
Comment = "";
Type Logic;

PinList = "SW_Time_Pingroup";
PinUsage "SW_Time_Pingroup" = FX;
AliasMap LTXC_MSDMap;


$DisTri_WIFI_LAA
*000000001* W_MIPI_52M; "SSC_2 Start" 
*010100000* W_MIPI_52M; "SSC_1" 
*000000001* W_MIPI_52M; "SSC_0" 
*111100000* W_MIPI_52M; "SA_3 USID(1110)" 
*111100001* W_MIPI_52M; "SA_2" 
*111100000* W_MIPI_52M; "SA_1" 
*101000001* W_MIPI_52M; "SA_0" 
*101000000* W_MIPI_52M; "Mode_2 mode write(010)" 
*111100001* W_MIPI_52M; "Mode_1" 
*101000000* W_MIPI_52M; "Mode_0" 
*111100001* W_MIPI_52M; "Addr_4 SendArray[0]" 
*111100000* W_MIPI_52M; "Addr_3 SendArray[1]" 
*111100001* W_MIPI_52M; "Addr_2 SendArray[2]" 
*101000000* W_MIPI_52M; "Addr_1 SendArray[3]" 
*101000001* W_MIPI_52M; "Addr_0 SendArray[4]" 
*101000000* W_MIPI_52M; "P SendArray[5]" 
*101000001* W_MIPI_52M; "DATA_7 SendArray[6]" 
*101000000* W_MIPI_52M; "DATA_6 SendArray[7]" 
*111100001* W_MIPI_52M; "DATA_5 SendArray[8]" 
*111100000* W_MIPI_52M; "DATA_4 SendArray[9]" 
*111100001* W_MIPI_52M; "DATA_3 SendArray[10]" 
*101000000* W_MIPI_52M; "DATA_2 SendArray[11]" 
*101000001* W_MIPI_52M; "DATA_1 SendArray[12]" 
*101000000* W_MIPI_52M; "DATA_0 SendArray[13]" 
*101000001* W_MIPI_52M; "P SendArray[14]" 
*101000000* W_MIPI_52M; "Bus Park"
$DisExtendTri_WIFI_LAA
*000100001* W_MIPI_52M;
*000000000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001000000* W_MIPI_52M;
$MODE_WiFi_LAA_1
*000000001* W_MIPI_52M; "SSC_2 Start" 
*000100000* W_MIPI_52M; "SSC_1" 
*000000001* W_MIPI_52M; "SSC_0" 
*001100000* W_MIPI_52M; "SA_3 USID(1110)" 
*001100001* W_MIPI_52M; "SA_2" 
*001100000* W_MIPI_52M; "SA_1" 
*001000001* W_MIPI_52M; "SA_0" 
*001000000* W_MIPI_52M; "Mode_2 mode write(010)" 
*001100001* W_MIPI_52M; "Mode_1" 
*001000000* W_MIPI_52M; "Mode_0" 
*011000001* W_MIPI_52M; "Addr_4 SendArray[0]" 
*001100000* W_MIPI_52M; "Addr_3 SendArray[1]" 
*111000001* W_MIPI_52M; "Addr_2 SendArray[2]" 
*111100000* W_MIPI_52M; "Addr_1 SendArray[3]" 
*111100001* W_MIPI_52M; "Addr_0 SendArray[4]" 
*101000000* W_MIPI_52M; "P SendArray[5]" 
*1S1S00001* W_MIPI_52M; "DATA_7 SendArray[6]" 
*1S1S00000* W_MIPI_52M; "DATA_6 SendArray[7]" 
*1S1S00001* W_MIPI_52M; "DATA_5 SendArray[8]" 
*1S1S00000* W_MIPI_52M; "DATA_4 SendArray[9]" 
*1S1S00001* W_MIPI_52M; "DATA_3 SendArray[10]" 
*1S1S00000* W_MIPI_52M; "DATA_2 SendArray[11]" 
*1S1S00001* W_MIPI_52M; "DATA_1 SendArray[12]" 
*1S1S00000* W_MIPI_52M; "DATA_0 SendArray[13]" 
*1S1S00011* W_MIPI_52M; "P SendArray[14]" 
*101000000* W_MIPI_52M; "Bus Park" 
$DisTri_WIFI_LAA_2
*000000001* W_MIPI_52M; "SSC_2 Start" 
*010100000* W_MIPI_52M; "SSC_1" 
*000000001* W_MIPI_52M; "SSC_0" 
*111100000* W_MIPI_52M; "SA_3 USID(1110)" 
*111100001* W_MIPI_52M; "SA_2" 
*111100000* W_MIPI_52M; "SA_1" 
*101000001* W_MIPI_52M; "SA_0" 
*101000000* W_MIPI_52M; "Mode_2 mode write(010)" 
*111100001* W_MIPI_52M; "Mode_1" 
*101000000* W_MIPI_52M; "Mode_0" 
*111100001* W_MIPI_52M; "Addr_4 SendArray[0]" 
*111100000* W_MIPI_52M; "Addr_3 SendArray[1]" 
*111100001* W_MIPI_52M; "Addr_2 SendArray[2]" 
*101000000* W_MIPI_52M; "Addr_1 SendArray[3]" 
*101000001* W_MIPI_52M; "Addr_0 SendArray[4]" 
*101000000* W_MIPI_52M; "P SendArray[5]" 
*101000001* W_MIPI_52M; "DATA_7 SendArray[6]" 
*101000000* W_MIPI_52M; "DATA_6 SendArray[7]" 
*111100001* W_MIPI_52M; "DATA_5 SendArray[8]" 
*111100000* W_MIPI_52M; "DATA_4 SendArray[9]" 
*111100001* W_MIPI_52M; "DATA_3 SendArray[10]" 
*101000000* W_MIPI_52M; "DATA_2 SendArray[11]" 
*101000001* W_MIPI_52M; "DATA_1 SendArray[12]" 
*101000000* W_MIPI_52M; "DATA_0 SendArray[13]" 
*101000001* W_MIPI_52M; "P SendArray[14]" 
*101000000* W_MIPI_52M; "Bus Park"
$DisExtendTri_WIFI_LAA_2
*000100001* W_MIPI_52M;
*000000000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001000001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001000000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001100000* W_MIPI_52M;
*001100001* W_MIPI_52M;
*001000000* W_MIPI_52M;
$MODE_WiFi_LAA_2
*000000001* W_MIPI_52M; "SSC_2 Start" 
*000100000* W_MIPI_52M; "SSC_1" 
*000000001* W_MIPI_52M; "SSC_0" 
*001100000* W_MIPI_52M; "SA_3 USID(1110)" 
*001100001* W_MIPI_52M; "SA_2" 
*001100000* W_MIPI_52M; "SA_1" 
*001000001* W_MIPI_52M; "SA_0" 
*001000000* W_MIPI_52M; "Mode_2 mode write(010)" 
*001100001* W_MIPI_52M; "Mode_1" 
*001000000* W_MIPI_52M; "Mode_0" 
*011000001* W_MIPI_52M; "Addr_4 SendArray[0]" 
*001100000* W_MIPI_52M; "Addr_3 SendArray[1]" 
*111000001* W_MIPI_52M; "Addr_2 SendArray[2]" 
*111100000* W_MIPI_52M; "Addr_1 SendArray[3]" 
*111100001* W_MIPI_52M; "Addr_0 SendArray[4]" 
*101000000* W_MIPI_52M; "P SendArray[5]" 
*1S1S00001* W_MIPI_52M; "DATA_7 SendArray[6]" 
*1S1S00000* W_MIPI_52M; "DATA_6 SendArray[7]" 
*1S1S00001* W_MIPI_52M; "DATA_5 SendArray[8]" 
*1S1S00000* W_MIPI_52M; "DATA_4 SendArray[9]" 
*1S1S00001* W_MIPI_52M; "DATA_3 SendArray[10]" 
*1S1S00000* W_MIPI_52M; "DATA_2 SendArray[11]" 
*1S1S00001* W_MIPI_52M; "DATA_1 SendArray[12]" 
*1S1S00000* W_MIPI_52M; "DATA_0 SendArray[13]" 
*1S1S00011* W_MIPI_52M; "P SendArray[14]" 
*101000000* W_MIPI_52M; "Bus Park"
}


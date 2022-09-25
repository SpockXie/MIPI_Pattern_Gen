
from msilib.schema import Error
import sys,os
from unicodedata import name

#open temp file
class GenPat:

    def __init__(self, name):
        self.name = name
        self.temp_file = ''
        self.temp_uno_lines = ''
        self.PatType =''
        self.temp_Pat_name = ''
    def _getBitData(self, data, NumBits):
        for i in range(NumBits):
            temp = (data >> (NumBits-1-i))&1
            yield temp
    def _getBitDatalist(self, data = 0,bits=8):
        tempBitData = []
        for i in self._getBitData(data,bits):
            tempBitData.append(i)
        return tempBitData
    def openPatTemp(self, PatType =''):
        self.PatType = PatType
        PatTemplate_folder = 'C:\Data\TempPattern'
        if 'WriteDataOnly' in PatType:
            if 'LAA' not in PatType:
                if 'EVM' not in PatType:
                    file_name = '\PA_MIPIs_WriteDataOnly_1.uno'
                else:
                    file_name = '\PA_MIPIs_EVM.uno'
            else:
                file_name = '\PA_MIPIs_WriteDataOnly_2.uno'
        elif 'WriteNormal' in PatType:
            if 'LAA' not in PatType:
                file_name = '\PA_MIPIs_WriteNormal_1.uno'
            else:
                file_name = '\PA_MIPIs_WriteNormal_2.uno'
        elif 'WriteExtend' in PatType:
            if 'LAA' not in PatType:
                file_name = '\PA_MIPIs_WriteExtend_1.uno'
            else:
                file_name = '\PA_MIPIs_WriteExtend_2.uno'
        elif 'SwitchTime' in PatType: # for Switch Time pattern
            file_name = '\Pattern_SwitchTime_Temp.uno'

        # elif 'ReadExtend' in PatType:
        #     if 'LAA' not in PatType:
        #         file_name = '\PA_MIPIs_ReadExtend_1.uno'
        #     else:
        #         file_name = '\PA_MIPIs_ReadeExtend_2.uno'
        else:
            pass #TODO
        self.temp_Pat_name =  file_name.split('\\')[1].split('.uno')[0]
        self.temp_file = open(file=PatTemplate_folder  + file_name, mode='r')
        self.temp_uno_lines = self.temp_file.readlines()
    def replacePat(self, data, addr=-1):
        temp_P = 0
        Send_Count = 0
        bitIndex = 0
        bitIndex_2 = 0
        addr_temp_bits = 8
        tempBitData = self._getBitDatalist(data)
        if 'WriteNormal' in self.PatType:
            tempBitAddr = self._getBitDatalist(addr,bits=5)
            addr_temp_bits = 5
        if 'WriteExtend' in self.PatType:
            tempBitAddr = self._getBitDatalist(addr,bits=8)
            addr_temp_bits = 8
        for i,line in enumerate(self.temp_uno_lines):
            #Replace Pattern Name
            # print(self.temp_Pat_name)
            if self.temp_Pat_name in line:
                del self.temp_uno_lines[i]
                line = line.replace(self.temp_Pat_name,self.name)
                self.temp_uno_lines.insert(i, line)
            if '<RPT x>' in line: #for EVM
                del self.temp_uno_lines[i]
                if '_10' in self.name:
                    line = line.replace('x>','158200>') # 52MHz clock with 3000us RF burst
                else:
                    line = line.replace('x>','15820>') # 52MHz clock with 300us RF burst
                self.temp_uno_lines.insert(i, line)
            if addr !=-1:
                if 'WriteNormal' in self.PatType or 'WriteExtend' in self.PatType:
                    if 'S*' in line and Send_Count < addr_temp_bits +1:
                        Send_Count+=1
                        del self.temp_uno_lines[i]
                        line = line.replace('<NEXT DSP_Send_Ref>','')
                        line = line.replace('<NEXT DSP_Send_Ref_1>','')
                        if "P " not in line:
                            line = line.replace('S',str(tempBitAddr[bitIndex]))
                            # print(line)
                            self.temp_uno_lines.insert(i, line)
                            if i ==0:
                                temp_P = tempBitAddr[bitIndex]
                            else:
                                temp_P ^= tempBitAddr[bitIndex]
                            bitIndex+=1
                        else:
                            if 'WriteDataOnly' not in self.PatType:
                                temp_P =  not temp_P
                            else:
                                pass #"WriteDataOnly" 7bit for GS135 
                            if temp_P:
                                temp_P = '1'
                            else:
                                temp_P = '0'
                            line = line.replace('S',temp_P)
                            # print(line)
                            self.temp_uno_lines.insert(i, line)
            if type(temp_P) == str:
                temp_P = 0
            if 'S*' in line or 'S0*' in line or 'S1*' in line:
                del self.temp_uno_lines[i]
                line = line.replace('<NEXT DSP_Send_Ref>','')
                line = line.replace('<NEXT DSP_Send_Ref_1>','')
                if "P " not in line:
                    line = line.replace('S',str(tempBitData[bitIndex_2]))
                    
                    self.temp_uno_lines.insert(i, line)
                    if i ==0 or i-8==0:
                        temp_P = tempBitData[bitIndex_2]
                    else:
                        temp_P ^= tempBitData[bitIndex_2]
                    bitIndex_2+=1
                else:
                    if 'WriteDataOnly' not in self.PatType:
                        temp_P =  not temp_P
                    else:
                        pass #"WriteDataOnly" 7bit for GS135 
                    if temp_P:
                        temp_P = '1'
                    else:
                        temp_P = '0'
                    line = line.replace('S',temp_P)
                    self.temp_uno_lines.insert(i, line)

        temp_P = 0
        temp_P2 = 0
        bitIndex_2 = 0
        tempBitData = self._getBitDatalist(data,bits=16)
        tempBitData2 = self._getBitDatalist(data2,bits=16)
        for i,line in enumerate(self.temp_uno_lines):
            if self.temp_Pat_name in line:
                del self.temp_uno_lines[i]
                line = line.replace(self.temp_Pat_name,self.name)
                self.temp_uno_lines.insert(i, line)
            if line[0] == '*':
                 CtlPin = '000'
                 #TODO handle CtlPin for each mode
                 del self.temp_uno_lines[i]
                 line = "".join(line[0:5] + CtlPin + line[8:])
                 self.temp_uno_lines.insert(i, line)
            if 'S1S' in line or 'S0S' in line:
                del self.temp_uno_lines[i]
                if "P " not in line:
                    line = line.replace('S',str(tempBitData[bitIndex_2]),1)
                    line = line.replace('S',str(tempBitData2[bitIndex_2]),1)
                    self.temp_uno_lines.insert(i, line)

                    if bitIndex_2%8 ==0:
                        temp_P = tempBitData[bitIndex_2]
                        temp_P2 = tempBitData2[bitIndex_2]
                    else:
                        temp_P ^= tempBitData[bitIndex_2]
                        temp_P2 ^= tempBitData2[bitIndex_2]
                    bitIndex_2+=1
                else:
                    temp_P =  not temp_P
                    temp_P2 =  not temp_P2
                    # print(line,temp_P)
                    if temp_P:
                        temp_P = '1'
                    else:
                        temp_P = '0'
                    if temp_P2:
                        temp_P2 = '1'
                    else:
                        temp_P2 = '0'
                    line = line.replace('S',temp_P,1)
                    line = line.replace('S',temp_P2,1)
                    self.temp_uno_lines.insert(i, line)
    def replacePat_Sw(self, data, data2):  
        temp_P = 0
        temp_P2 = 0
        bitIndex = 0
        bitIndex2 = 0
        tempBitData = self._getBitDatalist(data,bits=16)
        tempBitData2 = self._getBitDatalist(data2,bits=16)
        countVector = 0
        afterTri = False
        print(data,tempBitData)
        print(data2,tempBitData2)
        #WiFi mode 1
        for i,line in enumerate(self.temp_uno_lines):
             #*1S1S00001*
            if len(line) > 11:
                if line[5:8] == '000': ###wctl-sctl1-sctl2
                    del self.temp_uno_lines[i]
                    
                    mode1 = self.name.split('SWT_')[1].split('-')[0]
                    if 'SAM' not in self.name.split('-')[1]:
                        mode2 = self.name.split('-')[1].split('_')[0]
                    else:##SWT_Tx10-SAM_LLL_Gain
                        mode2 = 'SAM_' + self.name.split('-')[1].split('SAM_')[1].split('_')[0]
                    countVector+=1
                    if countVector > 171:
                        afterTri = True
                    ## Wctl = 1.8V
                    if ('Bypass' == mode1 or 'LLL' == mode1) and (not afterTri):
                        line = line[0:5] + '100' + line[8:]
                    # elif ('Bypass' == mode2 or 'LLL' == mode2 or 'OFF' == mode2) and afterTri: //TODO Chack 'OFF' T622
                    elif ('Bypass' == mode2 or 'LLL' == mode2) and afterTri:
                        line = line[0:5] + '100' + line[8:]
                    ##TODO Sctl handle 
                    ## Sctl1 = 1.2V
                    elif 'SAM_LLL' == mode1 and not afterTri:
                        line = line[0:5] + '010' + line[8:]
                    # elif 'SAM_LLL' == mode2 or 'SAM_LNA' == mode2:
                    elif 'SAM_LLL' == mode2 and afterTri:
                        line = line[0:5] + '010' + line[8:]
                    ## Sctl2 = 1.2V
                    elif 'SAM_LNA' == mode1 and not afterTri:
                        line = line[0:5] + '001' + line[8:]
                    # elif 'SAM_LLL' == mode2 or 'SAM_LNA' == mode2:
                    elif 'SAM_LNA' == mode2 and afterTri:
                        line = line[0:5] + '001'+ line[8:]
                    self.temp_uno_lines.insert(i, line)
                if line[2] == 'S': ##mipi data for wifi
                    del self.temp_uno_lines[i]
                    if "P " not in line:
                        line = line[0:2] + str(tempBitData[bitIndex]) + line[3:]
                        self.temp_uno_lines.insert(i, line)

                        if bitIndex ==1 or bitIndex ==9:
                        # if bitIndex%8==0:
                            temp_P = tempBitData[bitIndex]
                        else:
                            temp_P ^= tempBitData[bitIndex]
                        # print(temp_P)
                        bitIndex+=1
                    else:
                        
                        line = line[0:2] + ('0' if temp_P else '1') + line[3:]
                        self.temp_uno_lines.insert(i, line)      
                if line[4] == 'S':##mipi data for LAA
                    del self.temp_uno_lines[i]
                    if "P " not in line:
                        line = line[0:4] + str(tempBitData2[bitIndex2]) + line[5:]
                        self.temp_uno_lines.insert(i, line)
                        if bitIndex2%8==0:
                            temp_P2 = tempBitData2[bitIndex2]
                        else:
                            temp_P2 ^= tempBitData2[bitIndex2]
                        # print(temp_P)
                        bitIndex2+=1
                    else:
                        
                        line = line[0:4] + ('0' if temp_P2 else '1') + line[5:]
                        print('LAA P out:',line)
                        self.temp_uno_lines.insert(i, line)
    def save(self):
        self.name = self.name.replace('-','_')
        fileName = f"./{self.name}.uno"
        out_uno = open(file=fileName, mode='w',newline='\n')
        out_uno.write('\n'.join(self.temp_uno_lines))
        out_uno.close


# Disable_Trigger_WiFi = GenPat('Disable_Trigger_LAA')
# Disable_Trigger_WiFi.openPatTemp('WriteNormal_LAA')
# Disable_Trigger_WiFi.replacePat(data = 0b111000,addr=0b11100)
# Disable_Trigger_WiFi.save()

# Tx1_LB_HP = GenPat('Tx1_LB_HP')
# Tx1_LB_HP.openPatTemp('WriteDataOnly')
# Tx1_LB_HP.replacePat(data = 1+128)
# Tx1_LB_HP.save()


# #WiFi
# for PatName,data in zip(["Tx1_LB_HP","Tx2_HB1_HP","Tx3_HB2_HP",
#                          "Tx4_LB_MP","Tx5_HB1_MP","Tx6_HB2_MP",
#                          "Tx7_LB_LP","Tx8_HB1_LP","Tx9_HB2_LP", 
#                          "Tx10_BT_PA","WLAN_RX1","WLAN_RX2","WLAN_RX2B"],range(1,13)):
#     tempPat = GenPat(PatName)
#     tempPat.openPatTemp('WriteDataOnly')
#     tempPat.replacePat(data = data+128)
#     tempPat.save()
# for PatName,data in zip(["BTH","WLANOFF","TempSense",],[0b10001, 0, 0b1111]):
#     tempPat = GenPat(PatName)
#     tempPat.openPatTemp('WriteDataOnly')
#     tempPat.replacePat(data = data+128)
#     tempPat.save()
# #WriteNormal
# for PatName,addr,data in zip(["Disable_Trigger_WiFi",],[0b11100,],[0b00111000]):
#     tempPat = GenPat(PatName)
#     tempPat.openPatTemp('WriteNormal')
#     tempPat.replacePat(data = data, addr=addr)
#     tempPat.save()
# #WriteExtend
# for PatName,addr,data in zip(
#     ["Extended_Trigger_WiFi","TempSense_write","TestmodeON1","TestmodeON2"],
#     [0b00101101,0b01000011,0b01110100,0b01110100],
#     [0b11111111,0b00111000,0b11111110,0b01110001]):
#     tempPat = GenPat(PatName)
#     tempPat.openPatTemp('WriteExtend')
#     tempPat.replacePat(data = data, addr=addr)
#     tempPat.save()
# #LAA
# #WriteNormal
# for PatName,addr,data in zip(
#     ["Disable_Trigger_LAA","LAAOFF","LAAHG","LAAMG","LAAMGLL","LAALG","LAALGLL"],
#     [0b11100,0b01011,0b01011,0b01011,0b01011,0b01011,0b01011],
#     [0b00111000,0b00000000,0b01000101,0b01001000,0b01011101,0b01010101,0b01100101]):
#     tempPat = GenPat(PatName)
#     tempPat.openPatTemp('WriteNormal_LAA')
#     tempPat.replacePat(data = data, addr=addr)
#     tempPat.save()
# #WriteExtend
# for PatName,addr,data in zip(
#     ["Extended_Trigger_LAA","TempSense_write_LAA","TestmodeON1_LAA","TestmodeON2_LAA"],
#     [0b00101101,0b01000011,0b01110100,0b01110100],
#     [0b11111111,0b00111000,0b11111110,0b01110001]):
#     tempPat = GenPat(PatName)
#     tempPat.openPatTemp('WriteExtend_LAA')
#     tempPat.replacePat(data = data, addr=addr)
#     tempPat.save()

#EVM
# for PatName,data in zip(["Tx1_LB_HP","Tx2_HB1_HP","Tx3_HB2_HP",
#                          "Tx4_LB_MP","Tx5_HB1_MP","Tx6_HB2_MP",
#                          "Tx7_LB_LP"],range(7)):
#     tempPat = GenPat(PatName+'_EVM')
#     tempPat.openPatTemp('WriteDataOnly_EVM')
#     tempPat.replacePat(data = data+1+128)
#     tempPat.save()
# #10 Burst
# for PatName,data in zip(["Tx1_LB_HP","Tx2_HB1_HP","Tx3_HB2_HP",
#                          "Tx4_LB_MP","Tx5_HB1_MP","Tx6_HB2_MP",
#                          "Tx7_LB_LP"],range(7)):
#     tempPat = GenPat(PatName+'_EVM_10')
#     tempPat.openPatTemp('WriteDataOnly_EVM')
#     tempPat.replacePat(data = data+1+128)
#     tempPat.save()

#Switch Time

W_indexData = {'OFF':0,'WLANOFF':0,'Sdown':0,'TxL':1,'TxH':2,'TxH1':2,'BTTX':10,'Tx10':10,'HG':11,'Bypass':11,'WLHG2':13,'LLL':13,'WLHG2_LP':13}
LAA_indexData = {'LAAOFF':0, 'LAAHG':0b1000101, 'LAHG':0b1000101, 'LAAMG':0b1001000, 'LAAMGLL':0b1011101,'LAMGLL':0b1011101, 'LAALG':0b1010101,'LALG':0b1010101, 'LAALGLL':0b1100101, 'LALGLL':0b1100101}
PatName = "T590_SWT_HG-TxL_Rise_Time"
for PatName in [
                # "T590_SWT_HG-TxL_Rise_Time", 
                # "T592_SWT_HG-TxH1_Rise_Time", 
                # "T594_SWT_HG-BTTX_Rise_Time",
                # "T596_SWT_OFF-TxL_Rise_Time",
                # "T598_SWT_OFF-TxH_Rise_Time",
                # "T600_SWT_OFF-BTTX_Rise_Time",
                # "T602_SWT_TxL-HG_Fall_Time",
                # "T604_SWT_TxH-HG_Fall_Time",
                # "T606_SWT_BTTX-HG_Fall_Time",
                # "T608_SWT_TxL-Bypass_Fall_Time",
                # "T610_SWT_TxH-Bypass_Fall_Time",
                # "T612_SWT_BTTX-Bypass_Fall_Time",
                # "T614_SWT_Bypass-HG_Rise_Time",
                # "T616_SWT_OFF-HG_Rise_Time",
                # "T618_SWT_HG-Bypass_Fall_Time",
                # "T620_SWT_HG-LLL_Fall_Time",
                # "T622_SWT_HG-OFF_Fall_Time",
                # "T624_SWT_BTTX-LLL_Fall_Time",
                # "T626_SWT_LLL-BTTX_Rise_Time",
                # "T628_SWT_SAM_LLL-TxH_Rise_Time",
                # "T630_SWT_LAAHG-LAAMG_Fall_Time",
                # "T632_SWT_LAAHG-LAALG_Fall_Time",
                # "T634_SWT_LAAHG-LAAMGLL_Fall_Time",
                # "T636_SWT_LAAHG-LAALGLL_Fall_Time",
                # "T638_SWT_LAALG-LAAHG_Rise_Time",
                # "T640_SWT_LAALG-LAAMG_Rise_Time",
                # "T642_SWT_LAALG-LAAMGLL_Rise_Time",
                # "T644_SWT_LAAMGLL-LAAHG_Rise_Time",
                # "T646_SWT_LAALGLL-LAAHG_Rise_Time",
                # "T648_SWT_OFF-SAM_LLL_Rise_Time",
                #  "T650_SWT_SAM_LLL-Tx10_Rise_Time",
                # "T652_SWT_Tx10-SAM_LLL_Rise_Time",
                #"T654_SWT_WLHG2_LP-LLL_Fall_Time",
                "T656_SWT_Sdown-SAM_LNA_Rise_Time",
                # "T658_SWT_SAM_LNA-Sdown_Fall_Time",
                # "T660_SWT_LALGLL-LAHG_Rise_Time",
                # "T662_SWT_LAHG-LALGLL_Fall_Time",
                # "T664_SWT_LAMGLL-LALG_Fall_Time",
                # "T666_SWT_LALG-LAMGLL_Rise_Time"
                ]:

    mode1 = PatName.split('SWT_')[1].split('-')[0]
    if 'SAM' not in PatName.split('-')[1]:
        mode2 = PatName.split('-')[1].split('_')[0]
    else:##SWT_Tx10-SAM_LLL_Gain
        mode2 = 'SAM_' + PatName.split('-')[1].split('SAM_')[1].split('_')[0]
    print(mode1,mode2)
    # try:   
    if 'SAM' in PatName:
        if 'SAM' in mode1: tempMode = mode2
        else: tempMode = mode1
        WLAN_MIPI1 = W_indexData[tempMode] + 128
        WLAN_MIPI2 = W_indexData[tempMode] + 128
        LAA_MIPI1 = LAA_indexData['LAAOFF']
        LAA_MIPI2 = LAA_indexData['LAAOFF']
    elif 'Sdown' in PatName:
        WLAN_MIPI1 = W_indexData['WLANOFF'] + 128
        WLAN_MIPI2 = W_indexData['WLANOFF'] + 128
        LAA_MIPI1 = LAA_indexData['LAAOFF']
        LAA_MIPI2 = LAA_indexData['LAAOFF']
    elif 'LAA' not in PatName and 'LA' not in PatName:
        WLAN_MIPI1 = W_indexData[mode1] + 128
        WLAN_MIPI2 = W_indexData[mode2] + 128
        LAA_MIPI1 = LAA_indexData['LAAOFF']
        LAA_MIPI2 = LAA_indexData['LAAOFF']

    else: #LAA
        print(LAA_indexData[mode1])
        LAA_MIPI1 = LAA_indexData[mode1]
        LAA_MIPI2 = LAA_indexData[mode2]
        WLAN_MIPI1 = W_indexData['WLANOFF'] + 128
        WLAN_MIPI2 = W_indexData['WLANOFF'] + 128
    # except KeyError as e:
    #     print(e,PatName)
    # print('WLAN: ', WLAN_MIPI1,WLAN_MIPI2)
    # print('LAA: ', LAA_MIPI1,LAA_MIPI2)


    tempPat = GenPat(PatName+'_SW')
    tempPat.openPatTemp('SwitchTime')
    # tempPat.replacePat_Sw(0x55 + (0xAA << 8), 0xAA + (0x55 << 8) )
    
    tempPat.replacePat_Sw(WLAN_MIPI2 + (WLAN_MIPI1 << 8), LAA_MIPI2 + (LAA_MIPI1 << 8) )
    tempPat.save()

function mazani


global Input BBHeader Padding BCHkbits streambezbch LDPC codewordldpc FECFRAME0 FECFRAME1 FECFRAME ModFEC
global NONXFECFRAME XFECFRAME1 XFECFRAME2 IQSCRAMBLED Iscrambledq2 Qscrambledq2 PLFRAME awgnkanal PLHeader
global PLIQ XFECFRAME1dem XFECFRAME2dem IQSCRAMBLEDdem demodPLIQ2 PLIQ2Demo2 PLIQ2Demo20 BBfRame
global demodulovanazpravabch BBfRame2 demodulacebezbch Demodulovanazprava UPL DPL
global PLIQ2 PLIQ10 PLIQ20 XFECFRAME1dem2 XFECFRAME2dem2 IQSCRAMBLEDdem20 IQSCRAMBLEDdem30
global PLIQ2Demo200 PLIQ2Demo300 codewordldpc2 FECFRAME8psk FECFRAMEqpsk BBHeader2 BCHkbits2 awgnkanal2
global demodulpad demodulpad2 Image_input obrazek pocetbituUPL hMod
global Iscrambled Qscrambled hMod20 dec22 R2 dec16200 R20 R30 sigma PLIQ2Demo20BER DemodulacepoLDPC
global Iscrambledq4 Qscrambledq4 Iscrambledq3 Qscrambledq3 
%--------------------------------------------------------------------------
%smaze promenne
%--------------------------------------------------------------------------
Input = []; codewordldpc = []; FECFRAME0 = []; FECFRAME1 = []; FECFRAME = []; Iscrambled = []; Qscrambled = [];
ModFEC = []; NONXFECFRAME = []; XFECFRAME1 = []; XFECFRAME2 = []; IQSCRAMBLED = []; Iscrambledq2 = [];
Qscrambledq2 = []; PLFRAME = []; awgnkanal = []; PLHeader = []; PLIQ = []; XFECFRAME1dem = []; XFECFRAME2dem = [];
IQSCRAMBLEDdem = []; demodPLIQ2 = []; PLIQ2Demo2 = []; PLIQ2Demo20 = []; BBfRame = []; demodulovanazpravabch = [];
BBfRame2 = []; demodulacebezbch = []; Demodulovanazprava = []; UPL = []; DPL = []; BBHeader = [];
Padding = []; BCHkbits = []; streambezbch = []; LDPC = []; PLIQ2 = []; PLIQ10 = []; PLIQ20 = []; XFECFRAME1dem2 = [];
XFECFRAME2dem2 = []; IQSCRAMBLEDdem20 = []; IQSCRAMBLEDdem30 = []; PLIQ2Demo200 = []; PLIQ2Demo300 = [];
codewordldpc2 = []; FECFRAME8psk = []; FECFRAMEqpsk = []; BBHeader2 = []; BCHkbits2 = []; awgnkanal2 = [];
demodulpad = []; demodulpad2 = []; Image_input = []; obrazek = []; pocetbituUPL = []; hMod20 = [];
dec22 = []; R2 = []; dec16200 = []; R20 = []; R30 = []; sigma = []; PLIQ2Demo20BER = [];
DemodulacepoLDPC = [];  hMod = [];
Iscrambledq4 = []; Qscrambledq4 = []; Iscrambledq3 = []; Qscrambledq3 =[];

%clear global all



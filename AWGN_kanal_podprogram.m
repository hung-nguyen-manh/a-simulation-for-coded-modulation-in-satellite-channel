function AWGN_kanal_podprogram
% Hlavni fce AWGN kanal, v teto funkci jsou definovany hlavni podprogramy
%-------------------------------------------------------------------------
%definice globálních promìnných
global PLFRAME SNRdb awgnkanal sigma DemPLHeader
global noawgnkanal2 nodemplheader onmodulator radio1 radio2 pomerUPL shlukon MAXglobal MINglobal Nramcu
%-------------------------------------------------------------------------
onmodulator = 1;
%--------------------------------------------------------------------------
%Šíøení AWGN kanálem
%==========================================================================
sigma = sqrt(10^(-SNRdb/10)); % pomocny vypocet

if radio2 == 1
    awgnkanal = awgn(PLFRAME,SNRdb,0);
elseif radio1 == 1
    for awg = 1:pomerUPL
        awgnkanal(awg,:) = awgn(PLFRAME(awg,:),SNRdb,0);
    end
end
noawgnkanal2 = 1;

%Zobrazeni PL Hlavicky pres AWGN kanal
nodemplheader = 1;
DemPLHeader = awgnkanal(1,1:90);

%{
   shlukova_chyba_max = MAXglobal;
    shlukova_chyba = (shlukova_chyba_max-shlukova_chyba_min)+1;
    awgnkanal(1:cislo,shlukova_chyba_min:shlukova_chyba_max) = ones(cislo,shlukova_chyba);
end
%}
%__________POKUS HOKUS_____________________________________________________
%16APSK - 4bity na symbol
%2/3 - 75,523020 MBit/s
%celkem posilam 64 800 bitu = 16200 + 90 = 16290 bitu
%to odpovida 215mikrosekund = 0,000215s
%pomocna matice na prolozeni jest 16200 radku a 4 sloupce
%chyba tedy bude generovana na max 16200/4 = 4050;

%---------Vystup teto fce je awgnkanal-------------------------------------
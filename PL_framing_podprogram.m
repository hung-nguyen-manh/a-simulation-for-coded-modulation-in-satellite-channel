function PL_framing_podprogram
%Funkce PL framing + disperze, podprogram
%--------------------------------------------------------------------------
%definice globalnich promennych
global PLFRAME FEC_ramec XFECFRAME1 XFECFRAME2 hMod2 noplframe celkemdat radio1 radio2 pomerUPL
global IQSCRAMBLED Iscrambled Qscrambled delka_ramce 
%global Iscrambledq4 Qscrambledq4 Iscrambledq3 Qscrambledq3
%global Iscrambledq2 Qscrambledq2
%--------------------------------------------------------------------------

if delka_ramce ==1
    plqpsk = 32400;
    pl8psk = 21600;
    pl16apsk = 16200;
    pl32apsk = 12960;
elseif delka_ramce ==2
    plqpsk = 8100;
    pl8psk = 5400;
    pl16apsk = 4050;
    pl32apsk = 3240;
else
end

Iscrambled = ones(1,plqpsk); % vytvoreni pomocnych matic pro urychleni procesu
Qscrambled = ones(1,plqpsk);
Iscrambledq2 = ones(1,pl8psk);
Qscrambledq2 = ones(1,pl8psk);
Iscrambledq3 = ones(1,pl16apsk);
Qscrambledq3 = ones(1,pl16apsk);
Iscrambledq4 = ones(1,pl32apsk);
Qscrambledq4 = ones(1,pl32apsk);

%--------------------------------------------------------------------------
%{
if FEC_ramec == 1
    p = 360;
elseif FEC_ramec ==2
    p = 240;
else
end
%Slot1 = reshape(XFECFRAME1,90,p)'; % otoceni
%[x,y] = size(Slot1);
%}
%--------------------------------------------------------------------------
%Vytvoøení PL hlavièky pro oba ramce
%==========================================================================

PLHEADER = randint(1,90,[0,1]); % PL hlavicka, zde nahrazena nahodnou posloupnosti
PLHEADERlichy = PLHEADER(1:2:90);
%lichy krok
hMod2 = modem.pskmod('M',2,'PhaseOffset',pi/4,'InputType','bit','SymbolOrder','user-defined');
PLHeaderlichy = modulate(hMod2,PLHEADERlichy);
%sudy krok
PLHEADERsudy = PLHEADER(2:2:90);
hMod3 = modem.pskmod('M',2,'PhaseOffset',-pi/4,'InputType','bit','SymbolOrder','user-defined','SymbolMapping',[1 0]);
PLHeadersudy = modulate(hMod3,PLHEADERsudy);
PLHeader = [PLHeaderlichy,PLHeadersudy];
%--------------------------------------------------------------------------
%PL FRAMING
%==========================================================================
sc = csvread('PLframing scrambling exp sekvence.dat');

if radio2 == 1
    if FEC_ramec == 1
        for plsc = 1:plqpsk
            Iscrambled(plsc) = XFECFRAME1(plsc)*real(sc(plsc)) - XFECFRAME2(plsc)*imag(sc(plsc)); %scramblovaci vzorec
            Qscrambled(plsc) = XFECFRAME1(plsc)*imag(sc(plsc)) + XFECFRAME2(plsc)*real(sc(plsc));        
        end
        IQSCRAMBLED = complex(Iscrambled, Qscrambled);% vytvoreni IQ scramblu
        
    elseif FEC_ramec == 2 
        for plsc = 1:pl8psk
            Iscrambledq2(plsc) = XFECFRAME1(plsc)*real(sc(plsc)) - XFECFRAME2(plsc)*imag(sc(plsc));
            Qscrambledq2(plsc) = XFECFRAME1(plsc)*imag(sc(plsc)) + XFECFRAME2(plsc)*real(sc(plsc));        
        end
        IQSCRAMBLED = complex(Iscrambledq2, Qscrambledq2);
    elseif FEC_ramec == 3
        for plsc = 1:pl16apsk
            Iscrambledq3(plsc) = XFECFRAME1(plsc)*real(sc(plsc)) - XFECFRAME2(plsc)*imag(sc(plsc));
            Qscrambledq3(plsc) = XFECFRAME1(plsc)*imag(sc(plsc)) + XFECFRAME2(plsc)*real(sc(plsc));        
        end
        IQSCRAMBLED = complex(Iscrambledq3, Qscrambledq3);
    elseif FEC_ramec == 4
        for plsc = 1:pl32apsk
            Iscrambledq4(plsc) = XFECFRAME1(plsc)*real(sc(plsc)) - XFECFRAME2(plsc)*imag(sc(plsc));
            Qscrambledq4(plsc) = XFECFRAME1(plsc)*imag(sc(plsc)) + XFECFRAME2(plsc)*real(sc(plsc));        
        end
        IQSCRAMBLED = complex(Iscrambledq4, Qscrambledq4);
    else
    end

    PLFRAME = [PLHeader,IQSCRAMBLED];
   
elseif radio1 == 1
       if FEC_ramec == 1
            for scm = 1:pomerUPL
            for plsc = 1:plqpsk
                Iscrambled(scm,plsc) = XFECFRAME1(scm,plsc)*real(sc(plsc)) - XFECFRAME2(scm,plsc)*imag(sc(plsc)); %scramblovaci vzorec
                Qscrambled(scm,plsc) = XFECFRAME1(scm,plsc)*imag(sc(plsc)) + XFECFRAME2(scm,plsc)*real(sc(plsc));        
            end
            IQSCRAMBLED(scm,:) = complex(Iscrambled(scm,:), Qscrambled(scm,:));% vytvoreni IQ scramblu
            PLFRAME(scm,:) = [PLHeader,IQSCRAMBLED(scm,:)];
            end
       elseif FEC_ramec == 2
            for scm = 1:pomerUPL
             for plsc = 1:pl8psk
                Iscrambledq2(scm,plsc) = XFECFRAME1(scm,plsc)*real(sc(1,plsc)) - XFECFRAME2(scm,plsc)*imag(sc(1,plsc));
                Qscrambledq2(scm,plsc) = XFECFRAME1(scm,plsc)*imag(sc(1,plsc)) + XFECFRAME2(scm,plsc)*real(sc(1,plsc));        
            end
            IQSCRAMBLED(scm,:) = complex(Iscrambledq2(scm,:), Qscrambledq2(scm,:));
            PLFRAME(scm,:) = [PLHeader,IQSCRAMBLED(scm,:)];
            end
       elseif FEC_ramec == 3
            for scm = 1:pomerUPL
            for plsc = 1:pl16apsk
                Iscrambledq3(scm,plsc) = XFECFRAME1(scm,plsc)*real(sc(plsc)) - XFECFRAME2(scm,plsc)*imag(sc(plsc));
                Qscrambledq3(scm,plsc) = XFECFRAME1(scm,plsc)*imag(sc(plsc)) + XFECFRAME2(scm,plsc)*real(sc(plsc));        
            end
            IQSCRAMBLED(scm,:) = complex(Iscrambledq3(scm,:), Qscrambledq3(scm,:));
            PLFRAME(scm,:) = [PLHeader,IQSCRAMBLED(scm,:)];
            end
       elseif FEC_ramec == 4
            for scm = 1:pomerUPL
            for plsc = 1:pl32apsk
                Iscrambledq4(scm,plsc) = XFECFRAME1(scm,plsc)*real(sc(plsc)) - XFECFRAME2(scm,plsc)*imag(sc(plsc));
                Qscrambledq4(scm,plsc) = XFECFRAME1(scm,plsc)*imag(sc(plsc)) + XFECFRAME2(scm,plsc)*real(sc(plsc));        
            end
            IQSCRAMBLED(scm,:) = complex(Iscrambledq4(scm,:), Qscrambledq4(scm,:));
            PLFRAME(scm,:) = [PLHeader,IQSCRAMBLED(scm,:)];
            end
       else
        end
end
noplframe = 1;
[celkovyradek celkemdat] = size(PLFRAME);






%---------Vystup teto fce je PLFRAME---------------------------------------


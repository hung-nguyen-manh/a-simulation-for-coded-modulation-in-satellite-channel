function Mapovani_podprogram
%Funkce Mapovani, podprogram
%--------------------------------------------------------------------------
%definice globalnich promennych
global FECFRAME FEC_ramec XFECFRAME1 XFECFRAME2 hMod NONXFECFRAME nonxfecframe
global onmapping radio1 radio2 pomerUPL qpsk psk
global delka_ramce R2 R20 R30 
%--------------------------------------------------------------------------


if delka_ramce ==1
    mapoqpsk = 32400;
    mapo8psk = 21600;
    mapo16apsk = 16200;
    mapo32apsk = 12960;
elseif delka_ramce ==2
    mapoqpsk = 8100;
    mapo8psk = 5400;
    mapo16apsk = 4050;
    mapo32apsk = 3240;
else
end



%--------------------------------------------------------------------------
%MAPOV�N� pro oba ramce
%==========================================================================
if radio2 == 1
    if FEC_ramec == 1
        %hMod = modem.pskmod('M',4,'SymbolOrder','user-defined','PhaseOffset',pi/4,'InputType','bit'); % nastaveni modulace
        hMod = modem.genqammod('Constellation', [1*exp(j*(2*pi*[0 3 1 2]/4+pi/4))], 'InputType', 'Bit');
        ModFEC = reshape(FECFRAME, 2, mapoqpsk); %upraveni toku
        NONXFECFRAME = modulate(hMod, ModFEC); %modulace
        nonxfecframe = 1;
        XFECFRAME1 = real(NONXFECFRAME);
        XFECFRAME2 = imag(NONXFECFRAME);
    elseif FEC_ramec ==2
        hMod = modem.genqammod('Constellation', [1*exp(j*(2*pi*[0 7 3 4 1 6 2 5]/8+pi/4))], 'InputType', 'Bit');
        ModFEC8 = reshape(FECFRAME,3,mapo8psk);
        NONXFECFRAME = modulate(hMod, ModFEC8);
        nonxfecframe = 1;
        XFECFRAME1 = real(NONXFECFRAME);
        XFECFRAME2 = imag(NONXFECFRAME);
    elseif FEC_ramec ==3
        hMod = modem.genqammod('Constellation', [1*exp(j*(2*pi*[0 9 3 6 11 10 4 5 1 8 2 7]/12+pi/4))...
        R2*exp(j*(2*pi*[0 3 1 2]/4+pi/4))], 'InputType', 'Bit');
        ModFec16 = reshape(FECFRAME,4,mapo16apsk);
        NONXFECFRAME = modulate(hMod, ModFec16);
        nonxfecframe = 1;
        XFECFRAME1 = real(NONXFECFRAME);
        XFECFRAME2 = imag(NONXFECFRAME);
    elseif FEC_ramec ==4
hMod = modem.genqammod('Constellation', [R20*exp(j*(2*pi*[0 1 9 8 3 2 6 7]/12+pi/4))...
         1*exp(j*(2*pi*[15 1 12 10 4 2 7 9]/16+pi/4))...
         R20*exp(j*(2*pi*[11]/12+pi/4))...
         R30*exp(j*(2*pi*[0]/4+pi/4))...
         R20*exp(j*(2*pi*[10]/12+pi/4))...
         R30*exp(j*(2*pi*[3]/4+pi/4))...
         R20*exp(j*(2*pi*[4]/12+pi/4))...
         R30*exp(j*(2*pi*[1]/4+pi/4))...
         R20*exp(j*(2*pi*[5]/12+pi/4))...
         R30*exp(j*(2*pi*[2]/4+pi/4))...
         1*exp(j*(2*pi*[14 0 13 11 5 3 6 8]/16+pi/4))], 'InputType','Bit');     
        ModFec32 = reshape(FECFRAME,5,mapo32apsk);
        NONXFECFRAME = modulate(hMod, ModFec32);
        nonxfecframe =1;
        XFECFRAME1 = real(NONXFECFRAME);
        XFECFRAME2 = imag(NONXFECFRAME);
    else
    end
elseif radio1 == 1
       if FEC_ramec == 1
               for mapo = 1:pomerUPL
                hMod = modem.genqammod('Constellation', [1*exp(j*(2*pi*[0 3 1 2]/4+pi/4))], 'InputType', 'Bit'); % nastaveni modulace
                ModFEC = reshape(FECFRAME(mapo,:), 2, mapoqpsk); %upraveni toku
                NONXFECFRAME(mapo,:) = modulate(hMod, ModFEC); %modulace
                nonxfecframe = 1;
                XFECFRAME1(mapo,:) = real(NONXFECFRAME(mapo,:));
                XFECFRAME2(mapo,:) = imag(NONXFECFRAME(mapo,:));
               end

        elseif FEC_ramec == 2
            for mapo = 1:pomerUPL
                hMod = modem.genqammod('Constellation', [1*exp(j*(2*pi*[0 7 3 4 1 6 2 5]/8+pi/4))], 'InputType', 'Bit');
                fecframe = FECFRAME(mapo,:);
                ModFEC8 = reshape(fecframe, 3, mapo8psk);
                NONXFECFRAME(mapo,:) = modulate(hMod, ModFEC8);
                nonxfecframe = 1;
                XFECFRAME1(mapo,:) = real(NONXFECFRAME(mapo,:));
                XFECFRAME2(mapo,:) = imag(NONXFECFRAME(mapo,:));
            end

       elseif FEC_ramec == 3
           for mapo = 1:pomerUPL
                hMod = modem.genqammod('Constellation', [1*exp(j*(2*pi*[0 9 3 6 11 10 4 5 1 8 2 7]/12+pi/4))...
         R2*exp(j*(2*pi*[0 3 1 2]/4+pi/4))], 'InputType', 'Bit');
                ModFEC16 = reshape(FECFRAME(mapo,:), 4, mapo16apsk);
                NONXFECFRAME(mapo,:) = modulate(hMod, ModFEC16);
                nonxfecframe = 1;
                XFECFRAME1(mapo,:) = real(NONXFECFRAME(mapo,:));
                XFECFRAME2(mapo,:) = imag(NONXFECFRAME(mapo,:));
            end

       elseif FEC_ramec == 4
            for mapo = 1:pomerUPL
        hMod = modem.genqammod('Constellation', [R20*exp(j*(2*pi*[0 1 9 8 3 2 6 7]/12+pi/4))...
         1*exp(j*(2*pi*[15 1 12 10 4 2 7 9]/16+pi/4))...
         R20*exp(j*(2*pi*[11]/12+pi/4))...
         R30*exp(j*(2*pi*[0]/4+pi/4))...
         R20*exp(j*(2*pi*[10]/12+pi/4))...
         R30*exp(j*(2*pi*[3]/4+pi/4))...
         R20*exp(j*(2*pi*[4]/12+pi/4))...
         R30*exp(j*(2*pi*[1]/4+pi/4))...
         R20*exp(j*(2*pi*[5]/12+pi/4))...
         R30*exp(j*(2*pi*[2]/4+pi/4))...
         1*exp(j*(2*pi*[14 0 13 11 5 3 6 8]/16+pi/4))], 'InputType','Bit');                
                ModFEC32 = reshape(FECFRAME(mapo,:), 5, mapo32apsk);
                NONXFECFRAME(mapo,:) = modulate(hMod, ModFEC32);
                nonxfecframe = 1;
                XFECFRAME1(mapo,:) = real(NONXFECFRAME(mapo,:));
                XFECFRAME2(mapo,:) = imag(NONXFECFRAME(mapo,:));
            end

           
       end
end
onmapping = 1;



if FEC_ramec == 1
    
[gt gy]=size(NONXFECFRAME);
qpsk = ones(4,gy);

for r = 1:gy
    if (angle(NONXFECFRAME(1,r)) < -0.5) && (angle(NONXFECFRAME(1,r)) > -1)
    qpsk(1,r) = r;
    else
        qpsk(1,r) = 0;
    end
end
for r = 1:gy
    if (angle(NONXFECFRAME(1,r)) > 0.5) && (angle(NONXFECFRAME(1,r)) < 1)
    qpsk(3,r) = r;
    else
        qpsk(3,r) = 0;
    end
end
for r = 1:gy
    if angle(NONXFECFRAME(1,r)) > 2
    qpsk(2,r) = r;
    else
        qpsk(2,r) = 0;
    end
end
for r = 1:gy
    if angle(NONXFECFRAME(1,r)) < -2
    qpsk(4,r) = r;
    else
        qpsk(4,r) = 0;
    end
end


elseif FEC_ramec == 2


[gt gy]=size(NONXFECFRAME);
psk = ones(8,gy);


for r = 1:gy

    if (angle(NONXFECFRAME(1,r)) > 0.5) && (angle(NONXFECFRAME(1,r)) < 1)
    psk(1,r) = r;
    else
        psk(1,r) = 0;
    end
    %if (angle(NONXFECFRAME(1,r)) == 0)
    if ((angle(NONXFECFRAME(1,r)) < 0) && (angle(NONXFECFRAME(1,r)) > -0.1)) || (angle(NONXFECFRAME(1,r)) == 0)
    psk(2,r) = r;
    else
        psk(2,r) = 0;
    end
  
    if angle(NONXFECFRAME(1,r)) > 3 
    psk(3,r) = r;
    else
        psk(3,r) = 0;
    end

    if angle(NONXFECFRAME(1,r)) < -2
    psk(4,r) = r;
    else
        psk(4,r) = 0;
    end
    if (angle(NONXFECFRAME(1,r)) > 1) && (angle(NONXFECFRAME(1,r)) < 1.7)
    psk(5,r) = r;
    else
        psk(5,r) = 0;
    end
    if (angle(NONXFECFRAME(1,r)) < -0.5) && (angle(NONXFECFRAME(1,r)) > -1)
    psk(6,r) = r;
    else
        psk(6,r) = 0;
    end
   if (angle(NONXFECFRAME(1,r)) > 2) && (angle(NONXFECFRAME(1,r)) < 3)
    psk(7,r) = r;
    else
        psk(7,r) = 0;
    end
    if (angle(NONXFECFRAME(1,r)) < -1) && (angle(NONXFECFRAME(1,r)) > -1.7)
    psk(8,r) = r;
    else
        psk(8,r) = 0;
    end

end
end













%---------Vystup teto fce je XFECFRAME1, XFECFRAME2, NONXFECFRAME----------



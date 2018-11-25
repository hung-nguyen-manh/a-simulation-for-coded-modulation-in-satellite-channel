function demodulace_bitoveodprokladani
% fce demodulace_Complex  -  provede deskramblovani dle complex sekvenci
%-------------------------------------------------------------------------
%definice glob�ln�ch prom�nn�ch
global LDPC Input padding01 streambezbch BERpostFEC BERkanal demodulovanazpravabch BBfRame radio1 radio2 Image_input
global pomerUPL pocetbituUPL obrazek DPL Demodulovanazprava demodulpad delka_ramce FECFRAME PLIQ2Demo20BER
global DemodulacepoLDPC BERpostLDPC BCHkbits BERpostBCH simulacesbch SNRdb kodov modulace Datova_posloupnost
%-------------------------------------------------------------------------

if delka_ramce == 1
    delkaFEC = ' 64 800 bit�';
else
    delkaFEC = ' 16 200 bit�';
end
%--------------------------------------------------------------------------
%Deprokl�d�n�
%==========================================================================
demodulpad = ones(1,padding01);
if radio2 == 1
    for bchk = 1:padding01
        if ((streambezbch(1,bchk) == 0) && (demodulovanazpravabch(1,bchk) == 0))
            demodulpad(1,bchk) = 0;
        elseif ((streambezbch(1,bchk) == 0) && (demodulovanazpravabch(1,bchk) == 1))
            demodulpad(1,bchk) = 1;
        elseif ((streambezbch(1,bchk) == 1) && (demodulovanazpravabch(1,bchk) == 0))
            demodulpad(1,bchk) = 1;
        elseif ((streambezbch(1,bchk) == 1) && (demodulovanazpravabch(1,bchk) == 1))
            demodulpad(1,bchk) = 0;
        else
        end
    end
    
%--------------------------------------------------------------------------
%Chybovost
%==========================================================================
    Demodulovanazprava = demodulpad(1,1:1504); % odebrano tolik bitu, aby se objevila modulovana zprava o delce
    % 1054 bitu
    
    % Kanalova chybovost - pocitani
    [spatnybity BERkanal]=biterr(FECFRAME,PLIQ2Demo20BER);
    % Chybovost po LDPC  
    [spatnybity3 BERpostLDPC]=biterr(LDPC,DemodulacepoLDPC);
    % Celkova chybovost    
    [spatnybity2 BERpostFEC]=biterr(Datova_posloupnost,Demodulovanazprava);
    fprintf('Konec simulace - simulace prob�hla �sp�n�\n')
    disp(['Pou�it� modulace: ' (modulace)])
    disp(['Simulace pro SNR [dB]: ' num2str(SNRdb) '   K�dov� pom�r: ' num2str(kodov) '   D�lka r�mce:' (delkaFEC)])
    disp(['Po�et �patn� opraven�ch bit� po kan�lov�m dek�dov�n� = ' num2str(spatnybity)])
    disp(['Po�et �patn� opraven�ch bit� po LDPC dekod�v�n� = ' num2str(spatnybity3)])
    if simulacesbch == 1
        % Chybovost po BCH
        [spatnybity4 BERpostBCH]=biterr(BCHkbits,demodulovanazpravabch);
        disp(['Po�et �patn� opraven�ch bit� po BCH dek�dov�n� = ' num2str(spatnybity4)])
    else
    end
    disp(['Po�et �patn� opraven�ch bit� celkem(z 952320) = ' num2str(spatnybity2)])
    fprintf('Kan�lov� chybovost BER = %10.4e\n', BERkanal)
    fprintf('Celkov� chybovost BER/LDPC = %10.4e\n',BERpostLDPC)
    if simulacesbch == 1
        fprintf('Celkov� chybovost BER/BCH = %10.4e\n', BERpostBCH)
    end
    fprintf('Celkov� chybovost BER/postFEC = %10.4e\n', BERpostFEC)%celkova chybovost

    

elseif radio1 == 1
%--------------------------------------------------------------------------
%Deprokl�d�n�
%==========================================================================
    demodulpad = ones(pomerUPL,padding01);
    Demodulovanazpravaupl = ones(pomerUPL,pocetbituUPL);
    for bit = 1:pomerUPL
        for bchk = 1:padding01
            if ((streambezbch(1,bchk) == 0) && (demodulovanazpravabch(bit,bchk) == 0))
                demodulpad(1,bchk) = 0;
            elseif ((streambezbch(1,bchk) == 0) && (demodulovanazpravabch(bit,bchk) == 1))
                demodulpad(1,bchk) = 1;
            elseif ((streambezbch(1,bchk) == 1) && (demodulovanazpravabch(bit,bchk) == 0))
                demodulpad(1,bchk) = 1;
            elseif ((streambezbch(1,bchk) == 1) && (demodulovanazpravabch(bit,bchk) == 1))
                demodulpad(1,bchk) = 0;
            else
            end
        end
        Demodulovanazpravaupl(bit,:) = demodulpad(1,1:pocetbituUPL);
    end
%--------------------------------------------------------------------------
%Chybovost + Slo�en� obr�zku pro dlouhy ramec
%==========================================================================
 if delka_ramce ==1
        Demodulovanazprava = Demodulovanazpravaupl;
        doplneni40 = Demodulovanazprava(pomerUPL,:);
        doplneni30 = doplneni40(1,1:4512);
        doplneni20 = reshape(doplneni30(1,1:4512),3,1504);
        DPL = Demodulovanazprava(1:pomerUPL-1,:);
        DPL = reshape(DPL,630,1504);
        obrazek1 = [DPL;doplneni20];
        obrazek = reshape(obrazek1,1,952032);
        obrazek(1,952033:952320) = doplneni40(1,4513:4800);
        obrazek = reshape(obrazek,768,1240);

 elseif delka_ramce ==2
%--------------------------------------------------------------------------
%Chybovost + Slo�en� obr�zku pro kratky ramec
%==========================================================================
        DPL = Demodulovanazpravaupl(1:pomerUPL-4,:);
        obrazek001(1:630,:) = reshape(DPL,630,1504);
        obrazek001(631:633,:) = Demodulovanazpravaupl(pomerUPL-3:pomerUPL-1,1:1504);
        obrazek = reshape(obrazek001,1,952032);
        obrazek(1,952033:952320) = Demodulovanazpravaupl(pomerUPL,1:288);
        obrazek = reshape(obrazek,768,1240);

 else
 end
    % Kanalova chybovost - pocitani
    [spatnybity BERkanal]=biterr(FECFRAME,PLIQ2Demo20BER);
    % Chybovost po LDPC  
    [spatnybity3 BERpostLDPC]=biterr(LDPC,DemodulacepoLDPC);
    % Celkova chybovost    
    [spatnybity2 BERpostFEC]=biterr(Image_input,obrazek);
    fprintf('Konec simulace - simulace prob�hla �sp�n�\n')
    disp(['Pou�it� modulace: ' (modulace)])
    disp(['Simulace pro SNR [dB]: ' num2str(SNRdb) '   K�dov� pom�r: ' num2str(kodov) '   D�lka r�mce:' (delkaFEC)])
    disp(['Po�et �patn� opraven�ch bit� po kan�lov�m dek�dov�n� = ' num2str(spatnybity)])
    disp(['Po�et �patn� opraven�ch bit� po LDPC dekod�v�n� = ' num2str(spatnybity3)])
    if simulacesbch == 1
        % Chybovost po BCH
        [spatnybity4 BERpostBCH]=biterr(BCHkbits,demodulovanazpravabch);
        disp(['Po�et �patn� opraven�ch bit� po BCH dek�dov�n� = ' num2str(spatnybity4)])
    else
    end
    disp(['Po�et �patn� opraven�ch bit� celkem(z 952320) = ' num2str(spatnybity2)])
    fprintf('Kan�lov� chybovost BER = %10.4e\n', BERkanal)
    fprintf('Celkov� chybovost BER/LDPC = %10.4e\n',BERpostLDPC)
    if simulacesbch == 1
        fprintf('Celkov� chybovost BER/BCH = %10.4e\n', BERpostBCH)
    end
    fprintf('Celkov� chybovost BER/postFEC = %10.4e\n', BERpostFEC)%celkova chybovost
end


%
%
%===================KONEC PROGRAMU=========================================
%
%--------------------------------------------------------------------------
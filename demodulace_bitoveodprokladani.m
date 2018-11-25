function demodulace_bitoveodprokladani
% fce demodulace_Complex  -  provede deskramblovani dle complex sekvenci
%-------------------------------------------------------------------------
%definice globálních promìnných
global LDPC Input padding01 streambezbch BERpostFEC BERkanal demodulovanazpravabch BBfRame radio1 radio2 Image_input
global pomerUPL pocetbituUPL obrazek DPL Demodulovanazprava demodulpad delka_ramce FECFRAME PLIQ2Demo20BER
global DemodulacepoLDPC BERpostLDPC BCHkbits BERpostBCH simulacesbch SNRdb kodov modulace Datova_posloupnost
%-------------------------------------------------------------------------

if delka_ramce == 1
    delkaFEC = ' 64 800 bitù';
else
    delkaFEC = ' 16 200 bitù';
end
%--------------------------------------------------------------------------
%Deprokládání
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
    fprintf('Konec simulace - simulace probìhla úspìšnì\n')
    disp(['Použitá modulace: ' (modulace)])
    disp(['Simulace pro SNR [dB]: ' num2str(SNRdb) '   Kódový pomìr: ' num2str(kodov) '   Délka rámce:' (delkaFEC)])
    disp(['Poèet špatnì opravených bitù po kanálovém dekódování = ' num2str(spatnybity)])
    disp(['Poèet špatnì opravených bitù po LDPC dekodóvání = ' num2str(spatnybity3)])
    if simulacesbch == 1
        % Chybovost po BCH
        [spatnybity4 BERpostBCH]=biterr(BCHkbits,demodulovanazpravabch);
        disp(['Poèet špatnì opravených bitù po BCH dekódování = ' num2str(spatnybity4)])
    else
    end
    disp(['Poèet špatnì opravených bitù celkem(z 952320) = ' num2str(spatnybity2)])
    fprintf('Kanálová chybovost BER = %10.4e\n', BERkanal)
    fprintf('Celková chybovost BER/LDPC = %10.4e\n',BERpostLDPC)
    if simulacesbch == 1
        fprintf('Celková chybovost BER/BCH = %10.4e\n', BERpostBCH)
    end
    fprintf('Celková chybovost BER/postFEC = %10.4e\n', BERpostFEC)%celkova chybovost

    

elseif radio1 == 1
%--------------------------------------------------------------------------
%Deprokládání
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
%Chybovost + Složení obrázku pro dlouhy ramec
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
%Chybovost + Složení obrázku pro kratky ramec
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
    fprintf('Konec simulace - simulace probìhla úspìšnì\n')
    disp(['Použitá modulace: ' (modulace)])
    disp(['Simulace pro SNR [dB]: ' num2str(SNRdb) '   Kódový pomìr: ' num2str(kodov) '   Délka rámce:' (delkaFEC)])
    disp(['Poèet špatnì opravených bitù po kanálovém dekódování = ' num2str(spatnybity)])
    disp(['Poèet špatnì opravených bitù po LDPC dekodóvání = ' num2str(spatnybity3)])
    if simulacesbch == 1
        % Chybovost po BCH
        [spatnybity4 BERpostBCH]=biterr(BCHkbits,demodulovanazpravabch);
        disp(['Poèet špatnì opravených bitù po BCH dekódování = ' num2str(spatnybity4)])
    else
    end
    disp(['Poèet špatnì opravených bitù celkem(z 952320) = ' num2str(spatnybity2)])
    fprintf('Kanálová chybovost BER = %10.4e\n', BERkanal)
    fprintf('Celková chybovost BER/LDPC = %10.4e\n',BERpostLDPC)
    if simulacesbch == 1
        fprintf('Celková chybovost BER/BCH = %10.4e\n', BERpostBCH)
    end
    fprintf('Celková chybovost BER/postFEC = %10.4e\n', BERpostFEC)%celkova chybovost
end


%
%
%===================KONEC PROGRAMU=========================================
%
%--------------------------------------------------------------------------
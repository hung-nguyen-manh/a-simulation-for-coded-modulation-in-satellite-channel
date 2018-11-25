function Simulace
% Hlavni fce Simulace, v teto funkci jsou definovany hlavni podprogramy
%-------------------------------------------------------------------------

%definice glob�ln�ch prom�nn�ch
global praveprobiha mereni SNRdb snrmin snrmax snrkrok BERpostFEC BERkanal BERpostLDPC BERpostBCH
global simulacesbch
%-------------------------------------------------------------------------
clc


if mereni == 1
    pocethodnot = (1/snrkrok)*(snrmax - snrmin + 1);
    disp(['�ekejte, dokud neskon�� simulace'])
    krok = 0;
    
    for cyklus = snrmin:snrkrok:snrmax
    mazani
    krok = krok+1;
    SNRdb = cyklus;
    disp(['Simulace pro SNR [dB]: ' num2str(SNRdb)])
    Mode_adaptation_podprogram
    Stream_adaptation_podprogram
    FEC_kodovani_podprogram
    Mapovani_podprogram
    PL_framing_podprogram
    AWGN_kanal_podprogram
    demodulace_AWGN
    demodulace_Complex
    demodulace_hlavni_odprokladac
    demodulace_ldpc
    demodulace_bitoveodprokladani
    SNRhodnoty(krok,:) = SNRdb;
    simulace_data_excel(krok,:) = BERkanal;
    simulace_data_excel2(krok,:) = BERpostLDPC;
    if simulacesbch == 1
        simulace_data_excel3(krok,:) = BERpostBCH;
    else
    end
    simulace_data_excel4(krok,:) = BERpostFEC;
    end
    disp(['Konec simulace'])
    if simulacesbch == 1
        delete('data.xls');
        d = {'SNR [dB]','BER kanal [-]','BER post/LDPC [-]','BER post/BCH [-]','BER post/FEC [-]'};
        xlswrite('data.xls', d, 1, 'A1');
        xlswrite('data.xls',SNRhodnoty,'List1','A2');
        xlswrite('data.xls',simulace_data_excel,'List1','B2');
        xlswrite('data.xls',simulace_data_excel2,'List1','C2');
        xlswrite('data.xls',simulace_data_excel3,'List1','D2');
        xlswrite('data.xls',simulace_data_excel4,'List1','E2');
    else
        delete('data.xls');
        d = {'SNR [dB]','BER kanal [-]','BER post/LDPC [-]','BER post/FEC [-]'};
        xlswrite('data.xls', d, 1, 'A1');
        xlswrite('data.xls',SNRhodnoty,'List1','A2');
        xlswrite('data.xls',simulace_data_excel,'List1','B2');
        xlswrite('data.xls',simulace_data_excel2,'List1','C2');
        xlswrite('data.xls',simulace_data_excel4,'List1','D2');
    end
elseif mereni == 0
    
mazani
praveprobiha = 'Mode adaptation'
Mode_adaptation_podprogram
praveprobiha = 'Stream adaptation'
Stream_adaptation_podprogram
praveprobiha = 'FEC k�dov�n� - podprogram m��e trvat n�kolik minut'
FEC_kodovani_podprogram
praveprobiha = 'Mapov�n� + obslu�n� podprogram'
Mapovani_podprogram
praveprobiha = 'PL Framing'
PL_framing_podprogram
praveprobiha = 'AWGN kan�l'
AWGN_kanal_podprogram
praveprobiha = 'Demodulace AWGN kan�lu'
demodulace_AWGN
praveprobiha = 'Komplexn� deskramblov�n�'
demodulace_Complex
praveprobiha = 'Demodulace a odprokl�d�n�'
demodulace_hlavni_odprokladac
praveprobiha = 'LDPC a BCH dek�dov�n� - podprogram m��e trvat 2 a v�ce minut'
demodulace_ldpc
praveprobiha = 'Bitov� odprokl�d�n�'
demodulace_bitoveodprokladani

end

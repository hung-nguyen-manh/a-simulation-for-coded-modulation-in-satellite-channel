function Mode_adaptation_podprogram
%Funkce Mode adaptation, podprogram
%--------------------------------------------------------------------------
%definice globalnich promennych
global radio1 radio2 BBHeader onbbheader Image_input FEC_ramec Input delka_ramce R2
global padding01 r beforeldpc kodov kodovy_pomer kodovypomer2 pomerUPL pocetbituUPL
global R20 R30 modulace Datova_posloupnost
%--------------------------------------------------------------------------
%Prirazeni delky paddingu dle kodoveho pomeru
%--------------------------------------------------------------------------

if FEC_ramec == 1
    modulace = 'QPSK';
    if delka_ramce == 1
    kodovypomer2 = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9','9/1'}';
    elseif delka_ramce == 2
    kodovypomer2 = {'1/4','1/3','2/5','1/2','3/5','2/3','3/4','4/5','5/6','8/9'}';    
    end
elseif FEC_ramec == 2
    modulace = '8PSK';
    if delka_ramce == 1
    kodovypomer2 = {'3/5','2/3','3/4','5/6','8/9','9/1'}';
    elseif delka_ramce == 2
    kodovypomer2 = {'3/5','2/3','3/4','5/6','8/9'}';
    end
elseif FEC_ramec == 3
    modulace = '16APSK';
    if delka_ramce == 1
    kodovypomer2 = {'2/3','3/4','4/5','5/6','8/9','9/1'}';
    elseif delka_ramce == 2
    kodovypomer2 = {'2/3','3/4','4/5','5/6','8/9'}';
    end
elseif FEC_ramec == 4
    modulace = '32APSK';
    if delka_ramce == 1
    kodovypomer2 = {'3/4','4/5','5/6','8/9','9/1'}';
    elseif delka_ramce == 2
    kodovypomer2 = {'3/4','4/5','5/6','8/9'}';
    end
else
end
kodov = kodovypomer2(kodovy_pomer); %zjisti kodovy pomer
%nutna transformace
kodov = cell2mat(kodov);%zjisti hodnotu

%--------------------------------------------------------------------------
if delka_ramce ==1
    
    if kodov == '1/4'
        padding01 = 16008;
        r = 1/4;
        beforeldpc = 16200;
    end
    if kodov == '1/3'
        padding01 = 21408;
        r = 1/3;
        beforeldpc = 21600;
    end
    if kodov == '2/5'
        padding01 = 25728;
        r = 2/5;
        beforeldpc = 25920;
    end
    if kodov == '1/2'
        padding01 = 32208;
        r = 1/2;
        beforeldpc = 32400;
    end
    if kodov == '3/5'
        padding01 = 38688;
        r = 3/5;
        beforeldpc = 38880;
    end
    if kodov == '2/3'
        padding01 = 43040;
        r = 2/3;
        beforeldpc = 43200;
        R2 = 0.3174603175;
    end
    if kodov == '3/4'
        padding01 = 48408;
        r = 3/4;
        beforeldpc = 48600;
        R2 = 0.350877193;
        R20 = 0.5388994308;
        R30 = 0.1897533207;
    end
    if kodov == '4/5'
        padding01 = 51648;
        r = 4/5;
        beforeldpc = 51840;
        R2 = 0.363636363636;
        R20 = 0.5585215605;
        R30 = 0.205338809;
    end
    if kodov == '5/6'
        padding01 = 53840;
        r = 5/6;
        beforeldpc = 54000;
        R2 = 0.3703703704;
        R20 = 0.5689655173;
        R30 = 0.2155172414;
    end
    if kodov == '8/9'
        padding01 = 57472;
        r = 8/9;
        beforeldpc = 57600;
        R2 = 0.3846153846;
        R20 = 0.5866050808;
        R30 = 0.2309468822;
    end
    
    if kodov == '9/1'
        padding01 = 58192;
        r = 9/10;
        beforeldpc = 58320;
        R2 = 0.3891050584;
        R20 = 0.5883720929;
        R30 = 0.2325581395;
    end


elseif delka_ramce ==2

    if kodov == '1/4'
        padding01 = 3072;
        r = 1/5;
        beforeldpc = 3240;
    elseif kodov == '1/3'
        padding01 = 5232;
        r = 1/3;
        beforeldpc = 5400;
    elseif kodov == '2/5'
        padding01 = 6312;
        r = 2/5;
        beforeldpc = 6480;
    elseif kodov == '1/2'
        padding01 = 7032;
        r = 4/9;
        beforeldpc = 7200;
    elseif kodov == '3/5'
        padding01 = 9552;
        r = 3/5;
        beforeldpc = 9720;
    elseif kodov == '2/3'
        padding01 = 10632;
        r = 2/3;
        beforeldpc = 10800;
        R2 = 0.3174603175;
    elseif kodov == '3/4'
        padding01 = 11712;
        r = 11/15;
        beforeldpc = 11880;
        R2 = 0.350877193;
        R20 = 0.5388994308;
        R30 = 0.1897533207;
    elseif kodov == '4/5'
        padding01 = 12432;
        r = 7/9;
        beforeldpc = 12600;
        R2 = 0.363636363636;
        R20 = 0.5585215605;
        R30 = 0.205338809;
    elseif kodov == '5/6'
        padding01 = 13152;
        r = 37/45;
        beforeldpc = 13320;
        R2 = 0.3703703704;
        R20 = 0.5689655173;
        R30 = 0.2155172414;
    elseif kodov == '8/9'
        padding01 = 14232;
        r = 8/9;
        beforeldpc = 14400;
        R2 = 0.3846153846;
        R20 = 0.5866050808;
        R30 = 0.2309468822;
    else
    end
end

%==========================================================================
%moznost volby radio, nastaveni merger/slicer u obrazku
if radio1 == 1
    Image_input = imread('obrazky/dvb-s2.bmp');
    Image_input = im2bw(Image_input, 0.9);
    obrazekvektor = reshape(Image_input,1,952320);
    obrazek02 = obrazekvektor(1,1:952032); %upravena data do poctu
    obrazek01 = obrazekvektor(1,952033:952320); %zbytek dat
    obrazek = reshape(obrazek02,633,1504); % matice po 633 radkach, po 188b sloupcich
if delka_ramce ==1    
    if kodov == '1/4'
        pomerUPL = 64;
        pocetbituUPL = 15040;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,63,15040);
        doplneni = reshape(obrazek(631:633,:),1,4512); % zbytek dat
        doplneni2 = [doplneni,obrazek01]; % zbytek dat plus prvni zbytek 
        doplneni3 = zeros(1,10240);
        doplneni4 = [doplneni2,doplneni3];
        UPL(64,:) = doplneni4;
    elseif kodov == '1/3'
        pomerUPL = 46;
        pocetbituUPL = 21056;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,45,21056); %947520
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01]; % zbytek dat plus prvni zbytek 
        doplneni3 = zeros(1,16256);
        doplneni4 = [doplneni2,doplneni3];
        UPL(46,:) = doplneni4;
    elseif kodov == '2/5'
        pomerUPL = 43;
        pocetbituUPL = 22560;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,42,22560);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,17760);
        doplneni4 = [doplneni2,doplneni3];
        UPL(43,:) = doplneni4;
    elseif kodov == '1/2'
        pomerUPL = 31;
        pocetbituUPL = 31584;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,30,31584);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,26784);
        doplneni4 = [doplneni2,doplneni3];
        UPL(31,:) = doplneni4;
    elseif kodov == '3/5'
        pomerUPL = 31;
        pocetbituUPL = 31584;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,30,31584);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,26784);
        doplneni4 = [doplneni2,doplneni3];
        UPL(31,:) = doplneni4;
    elseif kodov == '2/3'
        pomerUPL = 31;
        pocetbituUPL = 31584;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,30,31584);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,26784);
        doplneni4 = [doplneni2,doplneni3];
        UPL(31,:) = doplneni4;
    elseif kodov == '3/4'
        pomerUPL = 22;
        pocetbituUPL = 45120;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,21,45120);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,40320);
        doplneni4 = [doplneni2,doplneni3];
        UPL(22,:) = doplneni4;
    elseif kodov == '4/5'
        pomerUPL = 22;
        pocetbituUPL = 45120;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,21,45120);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,40320);
        doplneni4 = [doplneni2,doplneni3];
        UPL(22,:) = doplneni4;
    elseif kodov == '5/6'
        pomerUPL = 19;
        pocetbituUPL = 52640;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,18,52640);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,47840);
        doplneni4 = [doplneni2,doplneni3];
        UPL(19,:) = doplneni4;
    elseif kodov == '8/9'
        pomerUPL = 19;
        pocetbituUPL = 52640;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,18,52640);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,47840);
        doplneni4 = [doplneni2,doplneni3];
        UPL(19,:) = doplneni4;
    elseif kodov == '9/1'
        pomerUPL = 19;
        pocetbituUPL = 52640;
        UPL = obrazek(1:630,:);
        UPL = reshape(UPL,18,52640);
        doplneni = reshape(obrazek(631:633,:),1,4512);
        doplneni2 = [doplneni,obrazek01];
        doplneni3 = zeros(1,47840);
        doplneni4 = [doplneni2,doplneni3];
        UPL(19,:) = doplneni4;
    else
    end
       
elseif delka_ramce ==2
        if kodov == '1/4'
            pomerUPL = 634;
            pocetbituUPL = 1504;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,630,1504);
            UPL(631,:) = obrazek(631,:);
            UPL(632,:) = obrazek(632,:);
            UPL(633,:) = obrazek(633,:);
            doplneni = zeros(1,1216);
            UPL(634,:) = [obrazek01,doplneni];
    elseif kodov == '1/3'
            pomerUPL = 214;
            pocetbituUPL = 4512;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,210,4512);
            doplneni2 = zeros(1,3008);
            UPL(211,:) = [obrazek(631,:),doplneni2];
            UPL(212,:) = [obrazek(632,:),doplneni2];
            UPL(213,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,4224);
            UPL(214,:) = [obrazek01,doplneni];
    elseif kodov == '2/5'
            pomerUPL = 214;
            pocetbituUPL = 4512;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,210,4512);
            doplneni2 = zeros(1,3008);
            UPL(211,:) = [obrazek(631,:),doplneni2];
            UPL(212,:) = [obrazek(632,:),doplneni2];
            UPL(213,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,4224);
            UPL(214,:) = [obrazek01,doplneni];
    elseif kodov == '1/2'
            pomerUPL = 214;
            pocetbituUPL = 4512;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,210,4512);
            doplneni2 = zeros(1,3008);
            UPL(211,:) = [obrazek(631,:),doplneni2];
            UPL(212,:) = [obrazek(632,:),doplneni2];
            UPL(213,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,4224);
            UPL(214,:) = [obrazek01,doplneni];
    elseif kodov == '3/5'
            pomerUPL = 109;
            pocetbituUPL = 9024;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,105,9024);
            doplneni2 = zeros(1,7520);
            UPL(106,:) = [obrazek(631,:),doplneni2];
            UPL(107,:) = [obrazek(632,:),doplneni2];
            UPL(108,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,8736);
            UPL(109,:) = [obrazek01,doplneni];
    elseif kodov == '2/3'
            pomerUPL = 94;
            pocetbituUPL = 10528;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,90,10528);
            doplneni2 = zeros(1,9024);
            UPL(91,:) = [obrazek(631,:),doplneni2];
            UPL(92,:) = [obrazek(632,:),doplneni2];
            UPL(93,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,10240);
            UPL(94,:) = [obrazek01,doplneni];
    elseif kodov == '3/4'
            pomerUPL = 94;
            pocetbituUPL = 10528;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,90,10528);
            doplneni2 = zeros(1,9024);
            UPL(91,:) = [obrazek(631,:),doplneni2];
            UPL(92,:) = [obrazek(632,:),doplneni2];
            UPL(93,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,10240);
            UPL(94,:) = [obrazek01,doplneni];
    elseif kodov == '4/5'
            pomerUPL = 94;
            pocetbituUPL = 10528;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,90,10528);
            doplneni2 = zeros(1,9024);
            UPL(91,:) = [obrazek(631,:),doplneni2];
            UPL(92,:) = [obrazek(632,:),doplneni2];
            UPL(93,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,10240);
            UPL(94,:) = [obrazek01,doplneni];
    elseif kodov == '5/6'
            pomerUPL = 94;
            pocetbituUPL = 10528;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,90,10528);
            doplneni2 = zeros(1,9024);
            UPL(91,:) = [obrazek(631,:),doplneni2];
            UPL(92,:) = [obrazek(632,:),doplneni2];
            UPL(93,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,10240);
            UPL(94,:) = [obrazek01,doplneni];
    elseif kodov == '8/9'
            pomerUPL = 74;
            pocetbituUPL = 13536;
            UPL = obrazek(1:630,:);
            UPL = reshape(UPL,70,13536);
            doplneni2 = zeros(1,12032);
            UPL(71,:) = [obrazek(631,:),doplneni2];
            UPL(72,:) = [obrazek(632,:),doplneni2];
            UPL(73,:) = [obrazek(633,:),doplneni2];
            doplneni = zeros(1,13248);
            UPL(74,:) = [obrazek01,doplneni];
    else
    end
else
end
     
    %prirazeni hlavicky ke kazdemu UPL paketu
    Hlavicka = randerr(1,80,[40]);
    for hlav = 1:pomerUPL
        UPL1(hlav,:) = [UPL(hlav,:),Hlavicka];
    end
    Input = UPL1; %vsechno je tvoreno do INPUTu
    
elseif radio2 == 1 % pokud je zatrhnuta volba nahodne datove posloupnosti
     Datova_posloupnost = randerr(1,1504,[752]); %udela nahodnou datovou posloupnost 
     %tvorenou pouze nulama a jednickama ve stejnem mnozstvi
     Hlavicka = randerr(1,80,[40]); % vyplni hlavicku nahodnou posloupnosti '0' a '1' ve stejne mire
     Input = [Datova_posloupnost, Hlavicka];
end
%==========================================================================
BBHeader = Input;% vytvori hlavicku konecnou, vystup z MODE ADAPTATION
%==========================================================================
onbbheader = 1;
%==========================================================================
%---------Vystup teto fce je BBHeader--------------------------------------


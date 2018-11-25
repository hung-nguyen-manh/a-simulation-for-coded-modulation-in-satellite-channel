function FEC_kodovani_podprogram
%%Funkce FEC kodovani, podprogram
%--------------------------------------------------------------------------
%definice globalnich promennych
global r FECFRAME LDPC delkaramceldpc onbch onldpc onprokladani radio1 radio2
global pomerUPL dec22 codewordldpc FEC_ramec dec16200 delka_ramce simulacesbch prokladanion
nahradaBCH = [];
Paddingdoplneni = [];
%--------------------------------------------------------------------------
%BCH kodovani
%==========================================================================
if simulacesbch == 0
    BCHbez
else
    BCH
end
onbch = 1;
[~, delkaramceldpc] = size(LDPC);

if delka_ramce ==1

%--------------------------------------------------------------------------
%LDPC kodovani pro dlouhy ramec
%==========================================================================
%LDPC kodovani dle ramce
    H = dvbs2ldpc(r);
    %Nastaveni LDPC dekodovani
    henc = fec.ldpcenc(H);
    dec22 = fec.ldpcdec(H);
    dec22.DecisionType = 'Hard decision';
    dec22.OutputFormat = 'Information part';
    dec22.NumIterations = 50;
    dec22.DoParityChecks = 'Yes';
    
    if radio2 ==1
        codewordldpc = encode(henc,LDPC);
    elseif radio1 == 1
        for forldpc = 1:pomerUPL
            codewordldpc(forldpc,:) = encode(henc,LDPC(forldpc,:));
        end
    end
    onldpc = 1;
%--------------------------------------------------------------------------
%Bitove prokladani pro dlouhy ramec
%==========================================================================

%--------------------------------------------------------------------------
% n = 64800 bitu je rozdeleno na
% QPSK - beze zmeny
% 8PSK - 21600 radku, 3 sloupce
% 16APSK - 16200 radku, 4 sloupce
% 32APSK - 12960 radku, 5 sloupce
%--------------------------------------------------------------------------
if prokladanion == 1

    %___________PROKLADANI_________________
    if radio2 ==1
    if ((FEC_ramec == 2) || (FEC_ramec == 3) || (FEC_ramec == 4))
        if FEC_ramec == 2
            prvni = codewordldpc(1,1:21600)'; % vytvoreni sloupcu o delce 21600 radku
            druhy = codewordldpc(1,21601:43200)';
            treti = codewordldpc(1,43201:64800)';
            FECFRAME0 = [prvni,druhy,treti];% vytvoreni matice 21600x3
        end
        if FEC_ramec == 3
            prvni = codewordldpc(1,1:16200)';
            druhy = codewordldpc(1,16201:32400)';
            treti = codewordldpc(1,32401:48600)';
            ctvrty = codewordldpc(1,48601:64800)';
            FECFRAME0 = [prvni,druhy,treti,ctvrty]; % vytvoreni matice 16200x4
        end
        if FEC_ramec == 4
            prvni = codewordldpc(1,1:12960)';
            druhy = codewordldpc(1,12961:25920)';
            treti = codewordldpc(1,25921:38880)';
            ctvrty = codewordldpc(1,38881:51840)';
            paty = codewordldpc(1,51841:64800)';
            FECFRAME0 = [prvni,druhy,treti,ctvrty,paty]; % vytvoreni matice 12960x5
        end
        FECFRAME1 = FECFRAME0'; % cteni po radcich
        FECFRAME = reshape(FECFRAME1,1,64800); % vytvoreni jednoho vektoru
    else
        FECFRAME = codewordldpc; % pokud je zvolena QPSK, zustava beze zmeny
    end
    
elseif radio1 == 1
            if ((FEC_ramec == 2) || (FEC_ramec == 3) || (FEC_ramec == 4))
                if FEC_ramec == 2
                    for prokladani = 1:pomerUPL
                        prvni = codewordldpc(prokladani,1:21600)'; % vytvoreni sloupcu o delce 21600 radku
                        druhy = codewordldpc(prokladani,21601:43200)';
                        treti = codewordldpc(prokladani,43201:64800)';
                        FECFRAME1 = [prvni,druhy,treti]'; % vytvoreni matice 21600x3
                        FECFRAME(prokladani,:) = reshape(FECFRAME1,1,64800); % vytvoreni jednoho vektoru
                    end
                end
                if FEC_ramec == 3
                    for prokladani = 1:pomerUPL
                        prvni = codewordldpc(prokladani,1:16200)';
                        druhy = codewordldpc(prokladani,16201:32400)';
                        treti = codewordldpc(prokladani,32401:48600)';
                        ctvrty = codewordldpc(prokladani,48601:64800)';
                        FECFRAME1 = [prvni,druhy,treti,ctvrty]'; % vytvoreni matice 16200x4
                        FECFRAME(prokladani,:) = reshape(FECFRAME1,1,64800); % vytvoreni jednoho vektoru
                    end
                end
                if FEC_ramec == 4
                    for prokladani = 1:pomerUPL
                    prvni = codewordldpc(prokladani,1:12960)';
                    druhy = codewordldpc(prokladani,12961:25920)';
                    treti = codewordldpc(prokladani,25921:38880)';
                    ctvrty = codewordldpc(prokladani,38881:51840)';
                    paty = codewordldpc(prokladani,51841:64800)';
                    FECFRAME1 = [prvni,druhy,treti,ctvrty,paty]'; % vytvoreni matice 12960x5
                    FECFRAME(prokladani,:) = reshape(FECFRAME1,1,64800); % vytvoreni jednoho vektoru
                    end
                end
            else
                FECFRAME = codewordldpc;
            end
    end
else
    FECFRAME = codewordldpc;
end
onprokladani = 1;
%---------Vystup teto fce je FECFRAME--------------------------------------

elseif delka_ramce ==2
%--------------------------------------------------------------------------
%LDPC kodovani pro kratky ramec
%==========================================================================
%LDPC kodovani dle ramce
    H = zaloha_dvbs2ldpc(r);
    %Nastaveni LDPC dekodovani
    enc16200 = fec.ldpcenc(H);
    dec16200 = fec.ldpcdec(H);
    dec16200.DecisionType = 'Hard decision';
    dec16200.OutputFormat = 'Information part';
    dec16200.NumIterations = 50;
  
    if radio2 ==1
        codewordldpc = encode(enc16200,LDPC);
    elseif radio1 == 1
        for forldpc = 1:pomerUPL
            codewordldpc(forldpc,:) = encode(enc16200,LDPC(forldpc,:));
        end
    end
    onldpc = 1;
%--------------------------------------------------------------------------
%Bitove prokladani pro kratky ramec
%==========================================================================

%--------------------------------------------------------------------------
% n = 64800 bitu je rozdeleno na
% QPSK - beze zmeny
% 8PSK - 5400 radku, 3 sloupce
% 16APSK - 4050 radku, 4 sloupce
% 32APSK - 3240 radku, 5 sloupce
%--------------------------------------------------------------------------
if prokladanion == 1
    %______________PROKLADANI___________________
    if radio2 ==1
    if ((FEC_ramec == 2) || (FEC_ramec == 3) || (FEC_ramec == 4))
        if FEC_ramec == 2
            prvni = codewordldpc(1,1:5400)'; % vytvoreni sloupcu o delce 5400 radku
            druhy = codewordldpc(1,5401:10800)';
            treti = codewordldpc(1,10801:16200)';
            FECFRAME0 = [prvni,druhy,treti];% vytvoreni matice 5400x3
        end
        if FEC_ramec == 3
            prvni = codewordldpc(1,1:4050)';
            druhy = codewordldpc(1,4051:8100)';
            treti = codewordldpc(1,8101:12150)';
            ctvrty = codewordldpc(1,12151:16200)';
            FECFRAME0 = [prvni,druhy,treti,ctvrty]; % vytvoreni matice 4050x4
        end
        if FEC_ramec == 4
            prvni = codewordldpc(1,1:3240)';
            druhy = codewordldpc(1,3241:6480)';
            treti = codewordldpc(1,6481:9720)';
            ctvrty = codewordldpc(1,9721:12960)';
            paty = codewordldpc(1,12961:16200)';
            FECFRAME0 = [prvni,druhy,treti,ctvrty,paty]; % vytvoreni matice 3240x5
        end
        FECFRAME1 = FECFRAME0'; % cteni po radcich
        FECFRAME = reshape(FECFRAME1,1,16200); % vytvoreni jednoho vektoru
    else
        FECFRAME = codewordldpc; % pokud je zvolena QPSK, zustava beze zmeny
    end
    
elseif radio1 == 1
            if ((FEC_ramec == 2) || (FEC_ramec == 3) || (FEC_ramec == 4))
                if FEC_ramec == 2
                    for prokladani = 1:pomerUPL
                        prvni = codewordldpc(prokladani,1:5400)'; % vytvoreni sloupcu o delce 5400 radku
                        druhy = codewordldpc(prokladani,5401:10800)';
                        treti = codewordldpc(prokladani,10801:16200)';
                        FECFRAME1 = [prvni,druhy,treti]'; % vytvoreni matice 5400x3
                        FECFRAME(prokladani,:) = reshape(FECFRAME1,1,16200); % vytvoreni jednoho vektoru
                    end
                end
                if FEC_ramec == 3
                    for prokladani = 1:pomerUPL
                        prvni = codewordldpc(prokladani,1:4050)';
                        druhy = codewordldpc(prokladani,4051:8100)';
                        treti = codewordldpc(prokladani,8101:12150)';
                        ctvrty = codewordldpc(prokladani,12151:16200)';
                        FECFRAME1 = [prvni,druhy,treti,ctvrty]'; % vytvoreni matice 4050x4
                        FECFRAME(prokladani,:) = reshape(FECFRAME1,1,16200); % vytvoreni jednoho vektoru
                    end
                end
                if FEC_ramec == 4
                    for prokladani = 1:pomerUPL
                    prvni = codewordldpc(prokladani,1:3240)';
                    druhy = codewordldpc(prokladani,3241:6480)';
                    treti = codewordldpc(prokladani,6481:9720)';
                    ctvrty = codewordldpc(prokladani,9721:12960)';
                    paty = codewordldpc(prokladani,12961:16200)';
                    FECFRAME1 = [prvni,druhy,treti,ctvrty,paty]'; % vytvoreni matice 3240x5
                    FECFRAME(prokladani,:) = reshape(FECFRAME1,1,16200); % vytvoreni jednoho vektoru
                    end
                end
            else
                FECFRAME = codewordldpc;
            end
end
onprokladani = 1;
else
    FECFRAME = codewordldpc;
end
end

prvni = [];
druhy = [];
treti = [];
ctvrty = [];
paty = [];

%---------Vystup teto fce je FECFRAME--------------------------------------

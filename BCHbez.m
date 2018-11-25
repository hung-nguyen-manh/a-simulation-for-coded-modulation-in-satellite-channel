function BCHbez
%--------------------------------------------------------------------------
%Nahrazeni BCH kodovani
%==========================================================================
global BCHkbits beforeldpc LDPC onbch radio1 radio2 pomerUPL


[radky2,BCHkbitsrozmer] = size(BCHkbits);%vstupni data
nahradaBCH = BCHkbits;
if radio2 == 1 %volba dat
    pocetbitunaldpc = (beforeldpc - BCHkbitsrozmer); % pocet bitu, ktere je treba doplnit kvuli BCH
    hodnotaldpc = randint(1,pocetbitunaldpc,[0,1]); % doplneni bitu
    LDPC = [BCHkbits,hodnotaldpc];
    onbch = 1;
elseif radio1 == 1 %volba obrazku
    pocetbitunaldpc = (beforeldpc - BCHkbitsrozmer);
    hodnotaldpc = randint(1,pocetbitunaldpc,[0,1]);
    for bchkod = 1:pomerUPL
        nahradaBCH(bchkod,BCHkbitsrozmer+1:beforeldpc) = hodnotaldpc;
        %Paddingdoplneni(bchkod,:) = hodnotaldpc;
        %nahradaBCH(bchkod,BCHkbitsrozmer+1:beforeldpc) = Paddingdoplneni(bchkod,:);
    end
    LDPC = nahradaBCH;
end
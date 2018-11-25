function Stream_adaptation_podprogram
%%Funkce Mode adaptation, podprogram
%--------------------------------------------------------------------------
%definice globalnich promennych
global BBHeader BCHkbits Padding
global onscrambling onpadding padding01 streambezbch radio1 radio2 delkapadding pomerUPL delkaramcebch
%--------------------------------------------------------------------------
[sirka delkaBBHeader] = size(BBHeader);
%Padding
if radio2 == 1 %volba nahodnych dat
    pocetbitunapadding = (padding01 - delkaBBHeader); % pocet bitu, ktere je treba doplnit
    hodnotapaddingu = zeros(1,pocetbitunapadding); % doplneni bitu
    Padding = [BBHeader,hodnotapaddingu]; % pridani paddingu k hlavicce
    onpadding = 1;
%Scrambling
    m = dlmread('zkouska.txt'); % nacte datovy soubor/scrambler
    streambezbch = m(1,1:padding01);% vybere pouze 1 vektor delky 16008
    BCHkbits = xor(streambezbch, Padding);% provede operaci xor
    delkapadding = pocetbitunapadding;
    delkaramcebch = padding01;

elseif radio1 == 1 %volba obrazku 1240x768
%Padding
    [xUPL yUPL] = size(BBHeader);
    pocetbitunapadding = (padding01 - yUPL);
    hodnotapaddingu = zeros(1,pocetbitunapadding);
%Scrambling
    m = dlmread('zkouska.txt');
    streambezbch = m(1,1:padding01);
    for pad = 1:pomerUPL
        BBHeader2 = [BBHeader(pad,:),hodnotapaddingu];
        BCHkbits(pad,:) = xor(BBHeader2,streambezbch);
    end
    delkapadding = pocetbitunapadding;
    delkaramcebch = padding01;
end
onscrambling = 1;
onpadding = 1;
BBHeader2 = [];

%---------Vystup teto fce je BCHkbits--------------------------------------

    
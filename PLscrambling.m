% fce PLSCRAMBLING
%
%
%--------------------------------------------------------------------------
clc
mxsekvence = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
mysekvence = ones(1,18); % vytvoreni dvou sekvenci
kniha = ones(1,262142);
kniha2 = ones(1,262142);
kniha3 = ones(1,262142);
kniha4 = ones(1,66419);
exponent = ones(1,66419); % vytvoreni pomocnych matic pro podstatne urychleni procesu
%CQj = ones(1,66419);

for pl = 1:262124
    A = circshift(mxsekvence,[1 pl]);
    kniha(1,pl+17) = mod((A(7) + A(1)),2);
    B = circshift(mysekvence,[1 pl]);
    kniha2(1,pl+17) = mod((B(10) + B(7) + B(5) + B(1)),2); % rotace a soucty
end
kniha(1,1:17) = mxsekvence(1,1:17); % doplneni o sekvenci do knihy, kniha dve nemusi
for pl2 = 1:262142
    kniha3(1,pl2) = mod((mod(kniha(1,pl2),262143)) + kniha2(1,pl2),2); % Golden kod
end

for pl3 = 1:66419
    kniha4(pl3) = 2*mod(kniha3(pl3+131072),2) + kniha3(pl3); % RN vypocet
    exponent(pl3) = exp(i*pi/2*kniha4(pl3)); % nahrazeni exponentem
end
%dlmwrite('PLSCRAMBLING.txt', kniha4, 'delimiter', '\t', ...
         %'precision', 6)
%type PLSCRAMBLING.txt
%dlmwrite('PLSCRAMBLING_EXP.txt', exponent, 'delimiter', '\t', ...
%         'precision', 6)
csvwrite('PLframing scrambling.dat',kniha4);
csvwrite('PLframing scrambling exp sekvence.dat',exponent); % ulozeni do souboru

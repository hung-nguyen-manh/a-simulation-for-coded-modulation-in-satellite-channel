clc
sequence = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];
fcexor=ones(1,15);
knihy = ones(1,58192);
for j=1:58192
    [a,b] = size(sequence);
    for i=1:b
        B = circshift(sequence,[1 i]);
        fcexor(i)=xor(B(14),B(15));
    end
    sequence = circshift(fcexor,[1 1]);
    knihy(j)=sequence(1);
end
velkyramec = knihy;
dlmwrite('zkouska.txt', velkyramec, 'delimiter', '\t', ...
         'precision', 6)
%csvwrite('BCH scramblovaci ramec.dat',velkyramec)


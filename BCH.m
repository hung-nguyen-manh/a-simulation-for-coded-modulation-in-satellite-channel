%BCH
%-------------------------------------------------------------------------
%zkusebni verze BCH
%-------------------------------------------------------------------------
global beforeldpc padding01 kodov BCHkbits LDPC pomerUPL radio1 radio2 delka_ramce

T8dlouhy = [1 0 1 0 1 0 0 1 0 0 0 1 1 0 1 1 1 1 0 1 0 0 1 1 0 0 0 1 1 1 0 1 1 1 0 1 ...
            1 1 0 0 1 1 0 1 1 0 1 0 1 0 0 1 1 1 1 0 1 1 0 0 1 1 1 1 1 1 0 1 0 0 0 0 ...
            0 1 0 1 0 0 1 0 1 1 0 1 1 0 0 1 1 1 1 0 1 1 1 1 0 1 1 1 0 1 1 0 1 1 1 0 ...
            0 0 1 0 0 1 0 0 1 1 1 0 1 1 0 0 0 0 1 0 1];
T10dlouhy = [1 0 1 1 0 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 1 1 0 0 1 1 1 0 1 1 0 1 1 1 1 ...
             1 1 1 0 0 0 0 1 0 1 0 1 0 0 0 1 1 0 0 1 1 0 0 0 1 1 1 1 1 0 1 1 0 1 0 1 ...
             0 0 1 1 1 1 0 0 0 0 1 0 1 0 1 1 1 0 0 0 0 0 0 1 1 1 1 1 0 1 1 1 1 1 1 0 ...
             1 0 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 1 1 1 0 0 0 1 0 1 1 1 0 1 ...
             1 0 1 1 0 0 1 0 1 1 0 0 1 0 0 0 1];
         
T12dlouhy = [1 0 1 0 0 1 1 1 0 0 0 1 0 0 1 1 0 0 0 0 0 1 1 1 0 1 0 0 0 0 0 1 1 1 0 0 0 ...
            0 1 0 0 0 1 0 1 1 1 0 0 0 1 0 1 0 0 0 1 0 0 0 1 1 1 0 0 0 1 0 1 0 0 0 0 1 ...
            1 0 0 1 1 1 1 0 0 1 0 1 1 0 0 1 1 0 1 1 0 0 0 1 1 0 1 1 1 0 0 0 0 1 1 0 1 ...
            0 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 0 1 1 0 1 0 0 0 1 1 1 1 0 0 ...
            0 0 1 0 1 1 1 1 1 0 1 1 1 0 1 1 0 0 1 1 0 0 0 0 0 0 0 1 0 0 1 0 1 0 1 0 1 ...
            1 1 1 0 0 1 1 1];        

T12kratky = [1 0 0 1 0 0 0 0 0 1 0 1 1 1 0 1 1 1 0 1 0 0 1 0 1 0 1 0 0 1 0 0 1 0 1 0 ...
             1 0 1 1 0 0 1 1 0 1 0 1 1 1 0 1 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 ...
             0 1 0 1 1 1 1 1 1 0 0 1 1 0 1 0 0 0 1 0 1 1 1 0 1 0 1 1 1 1 0 1 0 1 1 0 ...
             1 1 1 0 0 0 1 1 1 1 0 0 1 1 1 1 0 1 0 1 0 1 1 1 0 0 0 1 1 0 0 1 1 0 0 1 ...
             1 0 0 0 0 1 1 0 0 0 1 0 1 0 1 1 0 0 0 0 0 1 1 0 1];

%--------------------------------------------------------------------------

KoderBCH = comm.BCHEncoder;
KoderBCH.CodewordLength=beforeldpc;
KoderBCH.MessageLength=padding01;
KoderBCH.PrimitivePolynomialSource='Property';
KoderBCH.PrimitivePolynomial=de2bi(65581,'left-msb');																																																																																																																																																																															
KoderBCH.GeneratorPolynomialSource='Property';
if delka_ramce == 1
    if kodov =='1/4' | kodov =='1/3' | kodov =='2/5' | kodov =='1/2' | kodov =='3/5' | kodov =='3/4' | kodov =='4/5'
        KoderBCH.GeneratorPolynomial=T12dlouhy;
    elseif kodov =='2/3' | kodov =='5/6'
        KoderBCH.GeneratorPolynomial=T10dlouhy;
    else
        KoderBCH.GeneratorPolynomial=T8dlouhy;
    end;
   
   if radio2 == 1
        LDPC = step(KoderBCH,BCHkbits');
        LDPC = LDPC';
    elseif radio1 == 1
        for BCHkod = 1:pomerUPL
        LDPC2 = step(KoderBCH,BCHkbits(BCHkod,:)');
        LDPC(BCHkod,:) = LDPC2';
        end
    else
    end
elseif delka_ramce == 2
    KoderBCH.PrimitivePolynomial=de2bi(16427,'left-msb');	
    KoderBCH.GeneratorPolynomial=T12kratky;
    if radio2 == 1
        %LDPC = ones(3240,1);
        LDPC = step(KoderBCH,BCHkbits');
        LDPC = LDPC';
    elseif radio1 == 1
        for BCHkod = 1:pomerUPL
        LDPC2 = step(KoderBCH,BCHkbits(BCHkod,:)');
        LDPC(BCHkod,:) = LDPC2';
        end
    else
    end
end


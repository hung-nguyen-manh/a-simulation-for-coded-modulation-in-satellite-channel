%BCH2
%-------------------------------------------------------------------------
%zkusebni verze BCH
%-------------------------------------------------------------------------
global beforeldpc padding01 kodov DemodulacepoLDPC demodulovanazpravabch0 pomerUPL radio1 radio2 LDPC

demodulovanazpravabch0 = [];
DekodovatData2 = [];

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
         
DekoderBCH = comm.BCHDecoder;
DekoderBCH.CodewordLength=beforeldpc;
DekoderBCH.MessageLength=padding01;
DekoderBCH.PrimitivePolynomialSource='Property';
DekoderBCH.PrimitivePolynomial=de2bi(65581,'left-msb');
DekoderBCH.GeneratorPolynomialSource='Property';

if delka_ramce == 1
    
    if kodov =='1/4' | kodov =='1/3' | kodov =='2/5' | kodov =='1/2' | kodov =='3/5' | kodov =='3/4' | kodov =='4/5'
        KoderBCH.GeneratorPolynomial=T12dlouhy;
    elseif kodov =='2/3' | kodov =='5/6'
        KoderBCH.GeneratorPolynomial=T10dlouhy;
    else
        KoderBCH.GeneratorPolynomial=T8dlouhy;
    end;

    if radio2 == 1
        DekodovatData=step(DekoderBCH,DemodulacepoLDPC');
        demodulovanazpravabch0 = DekodovatData';
    elseif radio1 == 1
        for BCHdekodfor = 1:pomerUPL
            DekodovatData2 = step(DekoderBCH,DemodulacepoLDPC(BCHdekodfor,:)');
            demodulovanazpravabch0(BCHdekodfor,:) = DekodovatData2';
        end
    else
    end
elseif delka_ramce == 2
    DekoderBCH.PrimitivePolynomial=de2bi(16427,'left-msb');	
    DekoderBCH.GeneratorPolynomial=T12kratky;
    if radio2 == 1
        DekodovatData=step(DekoderBCH,DemodulacepoLDPC');
        demodulovanazpravabch0 = DekodovatData';
    elseif radio1 == 1
        for BCHdekodfor = 1:pomerUPL
            DekodovatData2 = step(DekoderBCH,DemodulacepoLDPC(BCHdekodfor,:)');
            demodulovanazpravabch0(BCHdekodfor,:) = DekodovatData2';
        end
    else
    end
end
%--------------------------------------------------------------------------
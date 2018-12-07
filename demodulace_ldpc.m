function demodulace_ldpc
% fce demodulace_Complex  -  provede deskramblovani dle complex sekvenci
%-------------------------------------------------------------------------
%definice glob�ln�ch prom�nn�ch
global PLIQ2Demo20 demodulovanazpravabch BBfRame radio1 radio2 padding01 demodulovanazpravabch0 
global pomerUPL dec22  delka_ramce dec16200 beforeldpc DemodulacepoLDPC simulacesbch
%--------------------------------------------------------------------------

demodulovanazpravabch = [];
if delka_ramce ==1
%--------------------------------------------------------------------------
%Demodulace LDPC k�dov�n� pro dlouhy ramec
%==========================================================================
if radio2 == 1
    BBfRame = decode(dec22, PLIQ2Demo20);
    DemodulacepoLDPC = BBfRame(1,1:beforeldpc);
elseif radio1 == 1
    for ldpcdek = 1:pomerUPL
        BBfRame = decode(dec22, PLIQ2Demo20(ldpcdek,:));
        DemodulacepoLDPC(ldpcdek,:) = BBfRame(1,1:beforeldpc);
    end
end
%---------Vystup teto fce je demodulovanazpravabch-------------------------
elseif delka_ramce==2
%--------------------------------------------------------------------------
%Demodulace LDPC k�dov�n� pro kratky ramec
%==========================================================================

if radio2 == 1
    BBfRame = decode(dec16200, PLIQ2Demo20);
    DemodulacepoLDPC = BBfRame(1,1:beforeldpc);
elseif radio1 == 1
    for ldpcdek = 1:pomerUPL
        BBfRame = decode(dec16200, PLIQ2Demo20(ldpcdek,:));
        DemodulacepoLDPC(ldpcdek,:) = BBfRame(1,1:beforeldpc);
    end
end
end

if simulacesbch == 0
    if radio2 == 1
        demodulovanazpravabch = DemodulacepoLDPC(1,1:padding01);
    elseif radio1 == 1
        for bezbch = 1:pomerUPL
            demodulovanazpravabch(bezbch,:) = DemodulacepoLDPC(bezbch,1:padding01);
        end
    end
elseif simulacesbch == 1
    BCHdekod
    demodulovanazpravabch = demodulovanazpravabch0;
end
%---------Vystup teto fce je demodulovanazpravabch-------------------------
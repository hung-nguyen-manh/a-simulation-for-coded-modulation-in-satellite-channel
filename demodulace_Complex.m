function demodulace_Complex
% fce demodulace_Complex  -  provede deskramblovani dle complex sekvenci
%-------------------------------------------------------------------------
%definice globálních promìnných
global awgnkanal FEC_ramec IQSCRAMBLEDdem radio1 radio2 pomerUPL PLIQ XFECFRAME1dem XFECFRAME2dem
global delka_ramce 
%-------------------------------------------------------------------------


if delka_ramce ==1
    demopliqqpsk = 32400;
    demopliq8psk = 21600;
    demopliq16apsk = 16200;
    demopliq32apsk = 12960;
elseif delka_ramce ==2
    demopliqqpsk = 8100;
    demopliq8psk = 5400;
    demopliq16apsk = 4050;
    demopliq32apsk = 3240;
else
end
%--------------------------------------------------------------------------
%Demodulace, PL Framing demodulování
%==========================================================================
sc1 = csvread('PLframing scrambling.dat');
sc = csvread('PLframing scrambling exp sekvence.dat');
if radio2 == 1
    if FEC_ramec == 1
        PLIQ = awgnkanal(1,91:demopliqqpsk+90);
        for pliq = 1:demopliqqpsk
            if sc1(pliq) == 0
                XFECFRAME1dem(pliq) = real(PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(PLIQ(pliq));
            elseif sc1(pliq) == 1
                XFECFRAME1dem(pliq) = imag(PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(-PLIQ(pliq));
            elseif sc1(pliq) == 2
                XFECFRAME1dem(pliq) = real(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(-PLIQ(pliq));
            elseif sc1(pliq) == 3
                XFECFRAME1dem(pliq) = imag(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(+PLIQ(pliq));
            end
        end
        
    elseif FEC_ramec == 2
        PLIQ = awgnkanal(1,91:demopliq8psk+90);
        for pliq = 1:demopliq8psk
            if sc1(pliq) == 0
                XFECFRAME1dem(pliq) = real(PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(PLIQ(pliq));
            elseif sc1(pliq) == 1
                XFECFRAME1dem(pliq) = imag(PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(-PLIQ(pliq));
            elseif sc1(pliq) == 2
                XFECFRAME1dem(pliq) = real(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(-PLIQ(pliq));
            elseif sc1(pliq) == 3
                XFECFRAME1dem(pliq) = imag(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(+PLIQ(pliq));
            end
        end
    elseif FEC_ramec == 3
        PLIQ = awgnkanal(1,91:demopliq16apsk+90);
        for pliq = 1:demopliq16apsk
            if sc1(pliq) == 0
                XFECFRAME1dem(pliq) = real(PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(PLIQ(pliq));
            elseif sc1(pliq) == 1
                XFECFRAME1dem(pliq) = imag(PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(-PLIQ(pliq));
            elseif sc1(pliq) == 2
                XFECFRAME1dem(pliq) = real(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(-PLIQ(pliq));
            elseif sc1(pliq) == 3
                XFECFRAME1dem(pliq) = imag(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(+PLIQ(pliq));
            end
        end
    elseif FEC_ramec == 4
        PLIQ = awgnkanal(1,91:demopliq32apsk+90);
        for pliq = 1:demopliq32apsk
            if sc1(pliq) == 0
                XFECFRAME1dem(pliq) = real(PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(PLIQ(pliq));
            elseif sc1(pliq) == 1
                XFECFRAME1dem(pliq) = imag(PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(-PLIQ(pliq));
            elseif sc1(pliq) == 2
                XFECFRAME1dem(pliq) = real(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = imag(-PLIQ(pliq));
            elseif sc1(pliq) == 3
                XFECFRAME1dem(pliq) = imag(-PLIQ(pliq));
                XFECFRAME2dem(pliq) = real(+PLIQ(pliq));
            end
        end
    else
    end
    
    IQSCRAMBLEDdem = complex(XFECFRAME1dem, XFECFRAME2dem);
    
elseif radio1 == 1
        if FEC_ramec == 1
            for descm = 1:pomerUPL
                PLIQ = awgnkanal(descm,91:demopliqqpsk+90); 
                for pliq = 1:demopliqqpsk
                if sc1(pliq) == 0
                    XFECFRAME1dem(1,pliq) = real(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(PLIQ(1,pliq));
                elseif sc1(pliq) == 1
                    XFECFRAME1dem(1,pliq) = imag(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(-PLIQ(1,pliq));
                elseif sc1(pliq) == 2
                    XFECFRAME1dem(1,pliq) = real(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(-PLIQ(1,pliq));
                elseif sc1(pliq) == 3
                    XFECFRAME1dem(1,pliq) = imag(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(+PLIQ(1,pliq));
                end
                end
            IQSCRAMBLEDdem(descm,:) = complex(XFECFRAME1dem(1,:), XFECFRAME2dem(1,:));
            end
            
        elseif FEC_ramec == 2
            
            for descm = 1:pomerUPL
                PLIQ = awgnkanal(descm,91:demopliq8psk+90);
            for pliq = 1:demopliq8psk
                if sc1(pliq) == 0
                    XFECFRAME1dem(1,pliq) = real(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(PLIQ(1,pliq));
                elseif sc1(pliq) == 1
                    XFECFRAME1dem(1,pliq) = imag(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(-PLIQ(1,pliq));
                elseif sc1(pliq) == 2
                    XFECFRAME1dem(1,pliq) = real(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(-PLIQ(1,pliq));
                elseif sc1(pliq) == 3
                    XFECFRAME1dem(1,pliq) = imag(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(+PLIQ(1,pliq));
                end
            end
            IQSCRAMBLEDdem(descm,:) = complex(XFECFRAME1dem(1,:), XFECFRAME2dem(1,:));
            end
            

        elseif FEC_ramec == 3
            for descm = 1:pomerUPL
            PLIQ = awgnkanal(descm,91:demopliq16apsk+90);
            for pliq = 1:demopliq16apsk
                if sc1(pliq) == 0
                    XFECFRAME1dem(1,pliq) = real(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(PLIQ(1,pliq));
                elseif sc1(pliq) == 1
                    XFECFRAME1dem(1,pliq) = imag(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(-PLIQ(1,pliq));
                elseif sc1(pliq) == 2
                    XFECFRAME1dem(1,pliq) = real(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(-PLIQ(1,pliq));
                elseif sc1(pliq) == 3
                    XFECFRAME1dem(1,pliq) = imag(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(+PLIQ(1,pliq));
                end
            end
            IQSCRAMBLEDdem(descm,:) = complex(XFECFRAME1dem(1,:), XFECFRAME2dem(1,:));
            PLIQ = [];
            end

        elseif FEC_ramec == 4
            for descm = 1:pomerUPL
            PLIQ = awgnkanal(descm,91:demopliq32apsk+90);
            for pliq = 1:demopliq32apsk
                if sc1(pliq) == 0
                    XFECFRAME1dem(1,pliq) = real(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(PLIQ(1,pliq));
                elseif sc1(pliq) == 1
                    XFECFRAME1dem(1,pliq) = imag(PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(-PLIQ(1,pliq));
                elseif sc1(pliq) == 2
                    XFECFRAME1dem(1,pliq) = real(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = imag(-PLIQ(1,pliq));
                elseif sc1(pliq) == 3
                    XFECFRAME1dem(1,pliq) = imag(-PLIQ(1,pliq));
                    XFECFRAME2dem(1,pliq) = real(+PLIQ(1,pliq));
                end
            end
            IQSCRAMBLEDdem(descm,:) = complex(XFECFRAME1dem(1,:), XFECFRAME2dem(1,:));
            end
        else
        end
end
%--------------------------------------------------------------------------

%---------Vystup teto fce je IQSCRAMBLEDdem--------------------------------

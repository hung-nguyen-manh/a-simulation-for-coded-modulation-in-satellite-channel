function demodulace_hlavni_odprokladac
% fce demodulace_Complex  -  provede deskramblovani dle complex sekvenci
%-------------------------------------------------------------------------
%definice globálních promìnných
global sigma hMod FEC_ramec PLIQ2Demo20 IQSCRAMBLEDdem radio1 radio2 pomerUPL
global delka_ramce PLIQ2Demo20BER prokladanion
%-------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Demapování a souèasné odprokládání
%==========================================================================

if delka_ramce ==1
    delkavektoru = 64800;
elseif delka_ramce ==2
    delkavektoru = 16200;
else
end
demodPLIQ2 = [];
demodPLIQ2BER = [];

if radio2 == 1
    if FEC_ramec == 1
        demodPLIQ2 = modem.genqamdemod(hMod,'DecisionType','approximate llr','NoiseVariance',sigma^2);
        PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem);
        PLIQ2Demo20 = reshape(PLIQ2Demo2,1,delkavektoru);
        %kanalova chybovost
        demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
        PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem);
        PLIQ2Demo20BER = reshape(PLIQ2Demo2BER,1,delkavektoru);
    elseif FEC_ramec == 2
        demodPLIQ2 = modem.genqamdemod(hMod,'DecisionType','approximate llr','NoiseVariance',sigma^2);
        if prokladanion == 1
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem)';
        else
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem);
        end
        PLIQ2Demo20 = reshape(PLIQ2Demo2,1,delkavektoru); % bitove odprokladani
        %kanalova chybovost
        demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
        PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem);
        PLIQ2Demo20BER = reshape(PLIQ2Demo2BER,1,delkavektoru);
    elseif FEC_ramec == 3
        demodPLIQ2 = modem.genqamdemod(hMod,'DecisionType','approximate llr','NoiseVariance',sigma^2);
        if prokladanion == 1
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem)';
        else
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem);
        end
        PLIQ2Demo20 = reshape(PLIQ2Demo2,1,delkavektoru);
        %kanalova chybovost
        demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
        PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem);
        PLIQ2Demo20BER = reshape(PLIQ2Demo2BER,1,delkavektoru);
    elseif FEC_ramec == 4
        demodPLIQ2 = modem.genqamdemod(hMod,'DecisionType','approximate llr','NoiseVariance',sigma^2);
        if prokladanion == 1
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem)';
        else
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem);
        end
        PLIQ2Demo20 = reshape(PLIQ2Demo2,1,delkavektoru);
        %kanalova chybovost
        demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
        PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem);
        PLIQ2Demo20BER = reshape(PLIQ2Demo2BER,1,delkavektoru);
    end
    
elseif radio1 == 1
        if FEC_ramec == 1
            for odpro = 1:pomerUPL
            demodPLIQ2 = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','approximate llr','NoiseVariance',sigma^2);
            PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:));
            PLIQ2Demo20(odpro,:) = reshape(PLIQ2Demo2,1,delkavektoru);
            %kanalova chybovost BER
            demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
            PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem(odpro,:));
            PLIQ2Demo20BER(odpro,:) = reshape(PLIQ2Demo2BER,1,delkavektoru);
            end

        elseif FEC_ramec == 2
            for odpro = 1:pomerUPL
            demodPLIQ2 = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','approximate llr','NoiseVariance',sigma^2);
            if prokladanion == 1
                PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:))';
            else
                PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:));
            end
            PLIQ2Demo20(odpro,:) = reshape(PLIQ2Demo2,1,delkavektoru); % bitove odprokladani
            %kanalova chybovost BER
            demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
            PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem(odpro,:));
            PLIQ2Demo20BER(odpro,:) = reshape(PLIQ2Demo2BER,1,delkavektoru);
            
            end

        elseif FEC_ramec == 3
            for odpro = 1:pomerUPL
            demodPLIQ2 = modem.genqamdemod(hMod,'DecisionType','approximate llr','NoiseVariance',sigma^2);
            if prokladanion == 1
                PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:))';
            else
                PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:));
            end
            PLIQ2Demo20(odpro,:) = reshape(PLIQ2Demo2,1,delkavektoru); % bitove odprokladani
            %kanalova chybovost BER
            demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
            PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem(odpro,:));
            PLIQ2Demo20BER(odpro,:) = reshape(PLIQ2Demo2BER,1,delkavektoru);
            end

        elseif FEC_ramec == 4
            for odpro = 1:pomerUPL
            demodPLIQ2 = modem.genqamdemod(hMod,'DecisionType','approximate llr','NoiseVariance',sigma^2);
            if prokladanion == 1
                PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:))';
            else
                PLIQ2Demo2 = demodulate(demodPLIQ2, IQSCRAMBLEDdem(odpro,:));
            end
            PLIQ2Demo20(odpro,:) = reshape(PLIQ2Demo2,1,delkavektoru); % bitove odprokladani
            %kanalova chybovost BER
            demodPLIQ2BER = modem.genqamdemod(hMod,'OutputType','bit','DecisionType','hard decision','NoiseVariance',sigma^2);
            PLIQ2Demo2BER = demodulate(demodPLIQ2BER, IQSCRAMBLEDdem(odpro,:));
            PLIQ2Demo20BER(odpro,:) = reshape(PLIQ2Demo2BER,1,delkavektoru);
            end
        end
end

%---------Vystup teto fce je PLIQ2Demo20-----------------------------------
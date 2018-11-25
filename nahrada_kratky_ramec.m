function nahrada_kratky_ramec
% podoba FEC
%
%
clear all

H = zaloha_dvbs2ldpc(3/4);
enc = fec.ldpcenc(H)
dec = fec.ldpcdec(H);
msg = randint(1,henc.NumInfoBits,2);
dec.DecisionType = 'Hard decision';
dec.OutputFormat = 'Information part';
dec.NumIterations = 50;
codewordldpc = encode(enc,msg);
SNRdB = 10;
sigma = sqrt(10^(-SNRdB/10));
receivedsig = awgn(codewordldpc, SNRdB, 0);
decodedmsg = decode(dec,receivedsig)
num2str(nnz(msg-decodedmsg))



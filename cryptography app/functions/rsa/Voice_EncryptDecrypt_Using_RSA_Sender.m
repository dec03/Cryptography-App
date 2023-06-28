function Voice_EncryptDecrypt_Using_RSA_Sender
clc
clear
close all

%% 0. Variable
% common sampling freq. for voice
fs = 8000; 

% two prime numbers (you can modify it) (example, 13, 23)
p = input("Enter Prime number: ");     
q = input("Enter second Prime number: ");


%% I. Recording
rec = audiorecorder;
rec_length = input("RECORDING TIME: ");
msg1 = msgbox(sprintf('recording for %d second', rec_length));
recordblocking(rec,rec_length);
delete(msg1);
msg2 = msgbox('recording done');

%% II. Get data from recorded voice
y = getaudiodata(rec,'uint8');
yp = getaudiodata(rec);
original = double(y);
figure(1);
plot(y); title('original voice');

% write original voice data to xlsx
cd("..")
cd("..")
cd("output_files")
xlswrite('RSA_original_voice.xlsx',original);
cd("..")
cd("./functions/rsa")

%% III. Playing original voice
% if you want to play the original voice
% type this code below in command window
prompt1 = input("Play original? (Y/N): ", "s");
if prompt1 == "Y"
    sound(yp,fs)
end

%% IV. Generating Key
[eval,nval,dval] = generateKey(p,q);
%fprintf('public exponent,   e = %d \n',eval);
%fprintf('modulus,           n = %d \n',nval);
%fprintf('private exponent,  d = %d \n\n',dval);
fprintf('public key (e,n),  (%d,%d)\n',eval,nval);
fprintf('private key (d,n), (%d,%d)\n\n',dval,nval);

%% V. Encrypting
% voice encrypted using public key (e,n)
encrypted = encrypt(original,eval,nval);
figure(2);
plot(encrypted); title('encrypted voice');
% write encrypted voice data to xlsx
cd("..")
cd("..")
cd("output_files")
xlswrite('RSA_encrypted_voice.xlsx',encrypted);
cd("..")
cd("./functions/rsa")

%% VI. Playing encrypted voice
enc = uint8(encrypted);
encp = audioplayer(enc,8000);
% if you want to play the encrypted voice
% type this code below in command window
prompt2 = input("Play Encrypted? (Y/N): ", "s");
if prompt2 == "Y"
    play(encp)
end
pause(8)
cd("..")
cd("..")
end
function Voice_EncryptDecrypt_Using_RSA_Receiver
clc
clear
close all

%% 0. Variable
% common sampling freq. for voice
fs = 8000; 

% private key (d,n), 
% use (d,n) generated at sender program, (53,299)
% if you use different key,
% then the voice can't be decrypted
d = input("IN FIRST PRIVATE KEY VALUE: ");     
n = input("IN SECOND PRIVATE KEY VALUE: ");

%% I. Upload encrypted voice data
% select 'RSA_encrypted_voice.xlsx'
cd("..")
cd("..")
cd("output_files")
en = uigetfile('*.xlsx');
encrypted = xlsread(en);
cd("..")
cd("./functions/rsa")
z = uint8(encrypted);
figure(1);
plot(encrypted); 
title('encrypted voice');

%% II. Playing encrypted voice
k = audioplayer(z,fs);
% if you want to play the encrypted voice
% type this code below in command window
prompt1 = input("Play Encrypted? (Y/N): ", "s");
if prompt1 == "Y"
    play(k)
end

%% III. Decrypting 
decrypted = decrypt(encrypted,d,n);
figure(2);
plot(decrypted);
title('decrypted voice');
dec = uint8(decrypted);
cd("..")
cd("..")
cd("output_files")
xlswrite('RSA_decrypted_voice.xlsx',dec);
cd("..")
cd("./functions/rsa")

%% IV. Playing decrypted voice
decp = audioplayer(dec,fs);
% if you want to play the decrypted voice
% type this code below in command window
prompt2 = input("Play Decrypted? (Y/N): ", "s");
if prompt2 == "Y"
    play(decp)
end
pause(8)
cd("..")
cd("..")
end
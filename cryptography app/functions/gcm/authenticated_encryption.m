function authenticated_encryption
clc
    %keygen
    %inspiration from: https://uk.mathworks.com/matlabcentral/answers/614558-how-do-i-create-random-hex-characters
    stream = RandStream("philox4x32_10","Seed","shuffle");
    key = dec2hex(randi(stream,15,1,64))';
    iv = dec2hex(randi(stream,15,1,24))';
    
    prompt1 = input('1. Text File\n2. Binary File\nIN: ', 's');
    
    switch prompt1
        %encrypts text file with tag for authentication
        case '1'
            %user input
            fileInput= input("IN TEXT FILE: ", "s");
            %gets data from file
            cd("..")
            cd("..")
            cd("input_files")
            file_m = fopen(fileInput);
            file_m_c = char(fread(file_m));
            fclose(file_m);
            %
            aad= 'additional unencrypted instructions';
            %carries out encryption and tagging of the plaintext text
            cd("..")
            cd("./functions/gcm")
            [C,T]=GCM_AE(key,iv,file_m_c,aad);   
            display(T)
            display(key)
            display(iv)
            %writes encrypted version
            cd("..")
            cd("..")
            cd("output_files")
            enc_filename = strcat("authenc_enc_", fileInput)
            fileID = fopen(enc_filename,'w');
            fwrite(fileID, C, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
        %encrypts binary file with tag for authentication
        case '2'
            %user input
            fileInput= input("IN BINARY FILE: ", "s");
            %gets data from file and converts from double to char
            cd("..")
            cd("..")
            cd("input_files")
            file_m = fopen(fileInput);
            file_m_c = char(fread(file_m));
            fclose(file_m);
            %
            aad= 'additional unencrypted instructions';
            %carries out encryption and tagging of the plaintext text
            cd("..")
            cd("./functions/gcm")
            [C,T]=GCM_AE(key,iv,file_m_c,aad);
            display(T)
            display(key)
            display(iv)
            %writes encrypted version
            cd("..")
            cd("..")
            cd("output_files")
            enc_filename = strcat("authenc_enc_", fileInput)
            fileID = fopen(enc_filename,'w');
            fwrite(fileID, C, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
    end
end
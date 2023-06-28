function authenticated_decryption    
clc
    prompt1 = input('1. Text File\n2. Binary File\nIN: ', 's');
    
    switch prompt1
        %decrypts text file with tag for authentication
        case '1'
            %user input
            fileInput = input("IN TEXT FILE: ", "s");
            aad= 'additional unencrypted instructions';
            key = input("IN KEY: ", "s");
            iv = input("IN IV: ", "s");
            T = input("IN T(tag): ", "s");
            %gets data from file
            cd("..")
            cd("..")
            cd("output_files")
            file_m = fopen(fileInput);
            C = char(fread(file_m));
            fclose(file_m);
            %carries out decryption and validation
            cd("..")
            cd("./functions/gcm")
            [P,A]=GCM_AD(key,iv,C,aad,T);
            %outputs if file was altered (1=no, 0=yes)
            disp("Altered Status (1:Unaltered|0:Altered): ")
            disp(A)
            %writes encrypted version
            cd("..")
            cd("..")
            cd("output_files")
            dec_filename = strcat("authenc_dec_", fileInput)
            fileID = fopen(dec_filename,'w');
            fwrite(fileID, P, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
        %encrypts binary file with tag for authentication
        case '2'
            %user input
            fileInput= input("IN BINARY FILE: ", "s");
            key = input("IN KEY: ", "s");
            iv = input("IN IV: ", "s");
            T = input("IN T(tag): ", "s");
            %gets data from file and converts from double to char
            cd("..")
            cd("..")
            cd("output_files")
            file_m = fopen(fileInput);
            C = char(fread(file_m));
            fclose(file_m);
            %
            aad= 'additional unencrypted instructions';
            %carries out decryption and validation
            cd("..")
            cd("./functions/gcm")
            [P,A]=GCM_AD(key,iv,C,aad,T);
            %outputs if file was altered (1=no, 0=yes)
            disp("Message Unaltered Status: ")
            disp(A)
            %converts binary file that in char into double
            %(original data type)
            P = double(P);
            %writes encrypted version
            cd("..")
            cd("..")
            cd("output_files")
            dec_filename = strcat("authenc_dec_", fileInput)
            fileID = fopen(dec_filename,'w');
            fwrite(fileID, P, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
        end
end
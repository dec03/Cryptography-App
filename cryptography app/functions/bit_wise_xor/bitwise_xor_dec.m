%the encrypted file does not have the same content as the cipher variable.
function bitwise_xor_dec
clc
    %userinput
    prompt1 = input('1. Binary File\n2. Text File\nIN: ', 's');
    switch prompt1
        case "1"
            %the string to decode
            str = input("IN FILE: ", "s");
            %key input
            key = input("IN KEY: ", "s");
            key = str2num(key);
            %opens file
            cd("..")
            cd("..")
            cd("output_files")
            file_m = fopen(str);
            %reads file as int8 and converts to char
            file_m_c = fread(file_m);
            fclose(file_m);
            %reshapes the single column vector into rows of 8-bit binary in
            %char format
            file_m_c = reshape(file_m_c,8,[])';
            %decrypt
            cd("..")
            cd("./functions/bit_wise_xor")
            decipher = decmessage(file_m_c, key, 'binary');
            %new file name
            dec_filename = strcat("dec_xor_", str)
            %writes decrypted file
            cd("..")
            cd("..")
            cd("output_files")
            fileID = fopen(dec_filename,'w');
            fwrite(fileID, decipher, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
        case "2"
            %the string to decode
            str = input("IN FILE: ", "s");
            %key input
            key = input("IN KEY: ", "s");
            key = str2num(key);
            %opens file
            cd("..")
            cd("..")
            cd("output_files")
            file_m = fopen(str);
            %reads file as int8 and converts to char
            file_m_c = char(fread(file_m, Inf, 'uint8'));
            fclose(file_m);
            %reshapes the single column vector into rows of 8-bit binary in
            %char format
            file_m_c = reshape(file_m_c,8,[])';
            %decrypt
            cd("..")
            cd("./functions/bit_wise_xor")
            decipher = decmessage(file_m_c, key, 'text');
            %new file name
            dec_filename = strcat("dec_xor_", str)
            %writes decrypted file
            cd("..")
            cd("..")
            cd("output_files")
            fileID = fopen(dec_filename,'w');
            fwrite(fileID, decipher, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
    end
function des_decrypt
    clc
    %userinput
    prompt1 = input('1. Message\n2. Text File\nIN:  ', 's');

    switch prompt1
        case '1'
            userin = input("IN MESSAGE: ","s");
            key = input("IN KEY: ", "s");
            %decrypts message
            d_m = DES(d_m, key, "DEC");
        case '2'
            %takes file input and key
            userin = input("IN FILE: ","s");
            key = input("IN KEY: ", "s");
            %converts key into double matrix
            key = reshape(key,1,[]);
            key = reshape(key,8,8).';
            key = double(key) - 48;

            %opens and reads file
            cd("..")
            cd("..")
            cd("output_files\")
            file_m_c = fileread(userin);
            %decrypts file
            cd("..")
            cd("./functions/des/")
            d_m = DES(file_m_c, key, "DEC");
            %writes decrypted file
            cd("..")
            cd("..")
            cd("output_files\")
            dec_filename = strcat("dec_des_", userin)
            fileID = fopen(dec_filename,'w');
            fwrite(fileID, d_m, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
    end 
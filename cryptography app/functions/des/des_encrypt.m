function des_encrypt
    clc
    %userinput
    prompt1 = input('1. Message\n2. Text File\nIN: ', 's');

    switch prompt1
        case '1'
            userin = input("IN: ","s");
            %generate key
            key = keygen
            %ecrypts message
            e_m = DES(userin, key, 'ENC')
        case '2'
            userin = input("IN TEXT FILE: ","s");
            %generate key
            key = keygen;
            key_out = sprintf("%d", reshape(key',1,[]))
            %opens and reads file
            cd("..")
            cd("..")
            cd("input_files\")
            file_m = fopen(userin);
            file_m_c = char(fread(file_m));
            fclose(file_m);
            %encrypts file
            cd("..")
            cd("./functions/des")
            e_m = DES(file_m_c, key, 'ENC');
            %writes encrypted file
            cd("..")
            cd("..")
            cd("output_files\")
            enc_filename = strcat("enc_des_", userin)
            fileID = fopen(enc_filename,'w');
            fwrite(fileID, e_m, "uint8");
            fclose(fileID);
            cd("..")
            pause(8)
    end 
function RC4_decrypt
%userinput
    prompt1 = input('1. Message\n2. File\n ', 's');

    switch prompt1
        case '1'
            %takes input
            userin = input("IN: ","s");
            %takes key input
            key = input("IN KEY: ", "s");
            %encrypts message
            d_m = char(bitxor(uint8(PRGA(KSA(key), size(userin,2))),uint8(char(userin))))
        case '2'
            %takes file input
            userin = input("IN FILE: ","s");
            %takes key input
            key = input("IN KEY: ", "s");
            %opens and reads file
            cd("..")
            cd("..")
            cd("output_files")            
            file_m = fopen(userin);
            file_m_c = char(fread(file_m));
            fclose(file_m);

            %decrypts file file
            cd("..")
            cd("./functions/rc4")
            d_m = char(bitxor(uint8(PRGA(KSA(key), size(file_m_c,2))),uint8(char(file_m_c))));

            %writes decrypted file
            cd("..")
            cd("..")
            cd("output_files")
            dec_filename = strcat("dec_rc4_", userin)
            fileID = fopen(dec_filename,'w');
            fwrite(fileID, d_m, "uint8");
            fclose(fileID);    
            cd("..")
            pause(8)
    end
end


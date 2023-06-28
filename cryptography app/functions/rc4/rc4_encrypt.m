function RC4_encrypt
    %userinput
    prompt1 = input('1. Message\n2. File\n ', 's');

    switch prompt1
        case '1'
            userin = input("IN: ","s");
            %generates key
            stream = RandStream("philox4x32_10","Seed","shuffle");
            key = char(randi(stream,[42 127],1,length(userin)))
            %encrypts message
            e_m = char(bitxor(uint8(PRGA(KSA(key), size(userin,2))),uint8(char(userin))))
        case '2'
            userin = input("IN FILE: ","s");
            %generate key
            stream = RandStream("philox4x32_10","Seed","shuffle");
            key = char(randi(stream,[42 127],1,length(userin)))
            cd("..")
            cd("..")
            cd("input_files")
            %opens and reads file
            file_m = fopen(userin);
            file_m_c = char(fread(file_m));
            fclose(file_m);
            cd("..")
            cd("./functions/rc4")
            %encrypts file
            e_m = char(bitxor(uint8(PRGA(KSA(key), size(file_m_c,2))),uint8(char(file_m_c))));

            %writes encrypted file
            cd("..")
            cd("..")
            cd("output_files")
            enc_filename = strcat("enc_rc4_", userin)
            fileID = fopen(enc_filename,'w');
            fwrite(fileID, e_m, "uint8");
            fclose(fileID);
            pause(8)
            cd("..")
end

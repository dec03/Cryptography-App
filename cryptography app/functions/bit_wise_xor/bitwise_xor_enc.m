function bitwise_xor_enc
    clc
    %userinput
    prompt1 = input('1. Binary File\n2. Text File\nIN: ', 's');
    switch prompt1
        case "1"
           % the string to encode
            str = input("IN FILE: ", "s");
            %keygen
            stream = RandStream("philox4x32_10","Seed","shuffle");
            key = rand(stream,1,8) > 0.3
            %opens and reads file
            cd("..")
            cd("..")
            cd("input_files")
            file_m = fopen(str);
            %convert to char
            file_m_c = char(fread(file_m, "uint8"));
            fclose(file_m);
            %encrypt
            cd("..")
            cd("./functions/bit_wise_xor")
            cipher = encmessage(file_m_c, key, 'binary');
            %new file name
            cd("..")
            cd("..")
            cd("output_files")
            enc_filename = strcat("enc_xor_", str)
            fileID = fopen(enc_filename,'w');
            %write to new file the encrypted content
            for x = 1:size(cipher,1)
                fwrite(fileID, cipher(x,:), "uint8");
            end
            %close file
            fclose(fileID);
            pause(8)
            cd("..")
        case "2"
            % the string to encode
            str = input("IN FILE: ", "s");
            %keygen
            stream = RandStream("philox4x32_10","Seed","shuffle");
            key = rand(stream,1,8) > 0.3
            %opens and reads file
            cd("..")
            cd("..")
            cd("input_files")
            file_m = fopen(str);
            file_m_c = char(fread(file_m));
            fclose(file_m);
            %encrypt
            cd("..")
            cd("./functions/bit_wise_xor")
            cipher = encmessage(file_m_c, key, 'text');
            %new file name
            cd("..")
            cd("..")
            cd("output_files")
            enc_filename = strcat("enc_xor_", str)
            fileID = fopen(enc_filename,'w');
            %write to new file the encrypted content as uint8 format
            for x = 1:size(cipher,1)
                fwrite(fileID, cipher(x,:), "uint8");
            end
            %close file
            fclose(fileID);
            cd("..")
            pause(8)
    end

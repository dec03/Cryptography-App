function otp_enc
clc
    %input
    userinput = input("IN TEXT FILE: ", "s");
    %reads file from input file
    cd("..")
    cd("..")
    cd("input_files")
    file = double(fileread(userinput));
    %random key
    s = RandStream("mlfg6331_64","Seed","shuffle");
    key = [randi(s,26,1,length(file))];
    key(file==32) = 0;
    key_out = sprintf('%g,', key(:))
    %ciphers
    cipher = key+file;
    cipher = char(cipher);

    %writes enc file
    cd("..")
    cd("output_files")
    fileID = fopen(strcat("cotp_enc_",userinput),'w');
    fwrite(fileID, cipher, "uint8");
    fclose(fileID);
    display(strcat("Encrypted File: ", strcat("cotp_enc_",userinput)))
    cd("..")
    pause(10)
end
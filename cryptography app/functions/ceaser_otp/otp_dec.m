function otp_dec
    clc
    %input
    userinput = input("IN TEXT FILE: ", "s");
    %reads file
    cd("..")
    cd("..")
    cd("output_files")
    file = double(fileread(userinput));
    %takes key
    key = input("IN KEY: ", "s");  
    key = sscanf(key, '%g,');
    key = double(key)';


    %ciphers
    cipher = file-key;
    cipher = char(cipher);

    %writes enc file
    fileID = fopen(strcat("cotp_dec_",userinput),'w');
    fwrite(fileID, cipher, "uint8");
    fclose(fileID);
    display(strcat("Decrypted File: ", strcat("cotp_dec_",userinput)))
    cd("..")
    pause(10)
end
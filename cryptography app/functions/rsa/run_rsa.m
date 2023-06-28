function run_rsa
    clc
    %prints options and takes input
    fprintf("1: Voice Encrypt RSA\n2: Voice Decrypt RSA\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            Voice_EncryptDecrypt_Using_RSA_Sender()
        case "2"
            Voice_EncryptDecrypt_Using_RSA_Receiver()
        %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            run_rsa()
    end
end
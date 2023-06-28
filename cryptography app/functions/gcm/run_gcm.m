function run_gcm
    clc
    %prints options and takes input
    fprintf("1: Encrypt GCM\n2: Decrypt GCM\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            authenticated_encryption()
        case "2"
            authenticated_decryption()
        %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            run_gcm()
    end
end
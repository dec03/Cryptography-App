function run_rc4
    clc
    %prints options and takes input
    fprintf("1: Encrypt RC4\n2: Decrypt RC4\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            rc4_encrypt()
        case "2"
            rc4_decrypt()
        %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            run_rc4()
    end
end
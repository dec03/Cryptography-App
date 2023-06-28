function run_des
    clc
    %prints options and takes input
    fprintf("1: Encrypt DES\n2: Decrypt DES\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            des_encrypt()
        case "2"
            des_decrypt()
        %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            run_des()
    end
end
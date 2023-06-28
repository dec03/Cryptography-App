function run_xor
    clc
    %prints options and takes input
    fprintf("1: Encrypt BitWise\n2: Decrypt BitWise\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            bitwise_xor_enc()
        case "2"
            bitwise_xor_dec()
        %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            run_xor()
    end
end
function run_cipher
    clc
    %prints options and takes input
    fprintf("1: Cipher\n2: Reverse Cipher\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            cipher()
        case "2"
            reverse_cipher()
            %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            run_cipher()
    end
end
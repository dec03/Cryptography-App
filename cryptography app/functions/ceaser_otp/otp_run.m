function otp_run
    clc
    %prints options and takes input
    fprintf("1: Encrypt OTP\n2: Decrypt OTP\n\n");
    prompt1 = input("IN: ", "s");
    %switch case
    switch prompt1
        case "1"
            otp_enc()
        case "2"
            otp_dec()
            %if input invalid, start again
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            otp_run()
    end
end
%status of metrics (1=enable,0=disable)
status = 0;
while true
    clc
    %introduction
    fprintf('Welcome to the Cryptography App\n\nTo navigate, use numbers unless told otherwise\n\n')
    %outputs list of functions
    functions = ["Ceaser","Ceaser-OTP","BitWise-Cipher","DES (Block Cipher)","RC4 (Stream Cipher)","Hash","HMAC (Keyed Hash)", "GCM (Authenticated Encryption)","RSA","Enable/Disable Metrics"];
    for i = 1:length(functions)
        fprintf("%d: %s\n", i, functions(i))
    end
    %navigate input from user
    navigate = input("\nIN: ","s");
    %navigation menu (if metrics are enabled, it will output the time in a graph, if
    %not, it won't)
    switch navigate
        case "1"
            cd('./functions/caeser')
            %times code
            profile on
            %function
            run_cipher
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "2"
            cd("./functions/ceaser_otp")
            %times code
            profile on
            %function
            otp_run
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "3"
            cd("./functions/bit_wise_xor")
            %times code
            profile on
            %function
            run_xor
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "4"
            cd("./functions/des/")
            %times code
            profile on
            %function
            run_des
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "5"
            cd("./functions/rc4/")
            %times code
            profile on
            %function
            run_rc4
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "6"
            cd("./functions/password_hash/")
            %times code
            profile on
            %function
            run_hash_alg
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "7"
            cd("./functions/keyed_hash/")
            %times code
            profile on
            %function
            hmac_run
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "8"
            cd("./functions/gcm")
            %times code
            profile on
            %function
            run_gcm
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "9"
            %times code
            profile on
            cd("./functions/rsa")
            %function
            run_rsa
            %stops time
            profile off
            if status == 1
                clc
                fprintf("Generating Report....")
                pause(5)
                profile report
            end
        case "10"
            if status==0
                status = 1;
                clc
                fprintf("METRICS ENABLED")
                pause(3)
            else
                status = 0;
                clc
                fprintf("METRICS DISABLED")
                pause(3)
            end
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
    end
end
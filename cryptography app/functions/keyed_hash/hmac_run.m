function hmac_run
    clc
    %input from user to say text file or binary file
    prompt1 = input('1. Binary File\n2. Text File\nIN: ', 's');
    %outputs hashing methods and takes input
    fprintf("\nHASHING METHODS: \n")
    methods = ["SHA-1","SHA-256","SHA-384","SHA-512"];
    for i = 1:length(methods)
        fprintf("%d: %s\n", i, methods(i))
    end
    %input
    method_c = input('\nIN METHOD (write full name): ', 's');
    %switch case
    switch prompt1
        case '1'
            file_m_c = input('IN BINARY FILE: ', 's');
            %keygen
            %gets data from file
            cd("..")
            cd("..")
            cd("input_files")
            file_m = fopen(file_m_c);
            file_m_c = char(fread(file_m))';
            fclose(file_m);
            cd("..")
            cd("./functions/keyed_hash")
            %prompt user to either use their key that was generated/given or generate a key.
            prompt2 = input("INPUT KEY? (Y/N): ", "s");
            switch prompt2
                case "Y"
                    key = input("IN KEY: ", "s");
                case "N"
                    %keygen if user wants key generated
                    stream = RandStream("philox4x32_10","Seed","shuffle");
                    key = char(randi(stream,[42 127],1,length(file_m_c)))
                otherwise
                    fprintf("\nInvalid Input")
                    pause(2)
                    hmac_run()
            end
            %output hash
            keyed_hash = HMAC(key,file_m_c,method_c)
            pause(8)
            cd("..")
            cd("..")
        case '2'
            file_m_c = input('IN TEXT FILE: ', 's');
            %gets data from file
            cd("..")
            cd("..")
            cd("input_files")
            file_m = fopen(file_m_c);
            file_m_c = char(fread(file_m))';
            fclose(file_m);
            %prompt user to either use their key that was generated/given or generate a key.
            prompt2 = input("INPUT KEY? (Y/N): ", "s");
            switch prompt2
                case "Y"
                    key = input("IN KEY: ", "s");
                case "N"
                    %keygen if user wants key generated
                    stream = RandStream("philox4x32_10","Seed","shuffle");
                    key = char(randi(stream,[42 127],1,length(file_m_c)))
                otherwise
                    fprintf("\nInvalid Input")
                    pause(2)
                    hmac_run()
            end
            %output hash
            cd("..")
            cd("./functions/keyed_hash")
            keyed_hash = HMAC(key,file_m_c,method_c)
            cd("..")
            cd("..")
            pause(8)
        otherwise
            fprintf("\nInvalid Input")
            pause(2)
            hmac_run()
    end
end
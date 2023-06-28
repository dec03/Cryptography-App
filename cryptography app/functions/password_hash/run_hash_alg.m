function run_hash_alg
    clc
    %takes in the input from user
    user_input = input("IN PASSWORD/FILENAME: ", "s");
    %user chooses hashing algorithm to use
    disp("HASHING METHODS:")
    methods=["MD2","MD5","SHA-1","SHA-256","SHA-384","SHA-512"];
    for i = 1:length(methods)
        fprintf("%d: %s\n", i, methods(i))
    end
    method = input("\nIN METHOD (write full name): ", "s");
    if ismember(method,methods) == false
        clc
        fprintf("Invalid Input")
        pause(2)
        run_hash_alg
    end
    %outputs hash
    hash = Listing83(user_input,method)
    pause(8)
    cd("..")
    cd("..")
end 

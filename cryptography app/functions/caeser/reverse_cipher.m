function reverse_cipher
    clc
    max = 122;
    min = 97;
    %takes user input for text and shift
    string = input("\nEnter string: ", "s");
    shift = input("\nEnter Shift: ");
    %converts into ascii values
    string = double(string);
    %shifts the text, encrypting it
    caeser_d = string-shift;
    %go through each letter's ascii value
    for x = 1:length(caeser_d)
        if caeser_d(x) < min
            %get the modular of the max ascii value
            get_mod = mod(caeser_d(x),min-1);
            %if it is < 97, it will start at the max ascii and subtract the
            %remainder
            caeser_d(x) = max - get_mod;
        elseif caeser_d(x) > max
            %if its > a then make it white space
            caeser_d(x) = 32;
        else
            continue
        end
    end   
    caeser_d = char(caeser_d)
    cd("..")
    cd("..")
    pause(5)
end
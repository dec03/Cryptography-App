function cipher
    clc
    max = 122;
    min = 97;
    %takes user input for text and shift
    string = input("\nEnter string: ", "s");
    shift = input("\nEnter Shift: ");
    %converts into ascii values
    string = double(string);
    %shifts the text, encrypting it
    caeser_e = string+shift;
    %go through each letter's ascii value
    for x = 1:length(caeser_e)
        if caeser_e(x) > max
            %get the modular of the max ascii value
            get_mod = mod(caeser_e(x),max+1);
            %if it is > 122, it will start at the min ascii and add the
            %remainder
            caeser_e(x) = min + get_mod;
        elseif caeser_e(x) < min
            %if its < a then make it white space
            caeser_e(x) = 32;
        else
            continue
        end
    end  
    caeser_e = char(caeser_e)
    cd("..")
    cd("..")
    pause(5)
end
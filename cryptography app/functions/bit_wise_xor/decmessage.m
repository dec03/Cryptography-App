%decrypts message
function decipher = decmessage(cipher, bitarr, type)
    
    switch type
        case 'text'
        %this gets the binary value of XOR bitarr and the cipher
        %it then turns it into ascii then into 
        %.' is used to transpose the array from vertical to horizontal
        decipher = char(bin2dec(char((bitxor(logical(cipher-'0'),bitarr)) + 48))).';
        case 'binary'
        %gets the content of the read file (encrypted binary file is stored
        %as binary) then xor with key, then convert into number data type,
        %then convert into string data type, then convert the binary string
        %back into a double data type.
        decipher = bin2dec(num2str(double(bitxor(cipher,bitarr))));
    end
end
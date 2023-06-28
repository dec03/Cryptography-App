%encrypts message
function cipher = encmessage(str, bitarr, type)
    switch type
        case 'text'
        %dec2bin(unicode2native(str),length(bitarr)) converts the string to
        %ascii, then from ascii to binary the length of the key
        %this gets the binary value of XOR bitarr and the message to get the
        %cipher
        cipher = char((bitxor(logical(dec2bin(unicode2native(str),length(bitarr))-'0'),bitarr)) + 48);
        case 'binary'
        %convert from decimal to binary 8 bit length, then turn into binary format, then do xor with the key
        cipher = bitxor((logical(dec2bin(str,8) - '0')),bitarr);
end


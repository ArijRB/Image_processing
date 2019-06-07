function [ val ] = cardinal_sine( x )
    val = 1;
    if(x~=0)
        val = sin(x)/x;
    end
end
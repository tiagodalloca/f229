function y=f(x,t)
    if x - v*t >= -l/2 & x - v*t <= l/2 then
        y=A*cos((%pi)/l * (x - v*t))
    else
        y = 0
    end
endfunction

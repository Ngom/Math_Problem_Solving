function [h,x]= meshe(a,b,N)
    h = (b-a)/N;
    for i=1:N+1
        x(i) = a +(i-1);
    end
endfunction

function [y]=f(x)
    y = x^3-3*x^2+2;
endfunction

function [E,Iapp] = trapezoid(a,b,N,Iex)
    [h,x] = meshe(a,b,N);
    Iapp = 0;
    for k=1:N
        Iapp = Iapp + (f(x(k)) + f(x(k+1)));
    end
    Iapp = (Iapp*h)/2
    E = abs(Iex - Iapp);
endfunction

function [E,Iapp] = Simpson(a,b,N,Iex)
    [h,x] = meshe(a,b,N);
    Iapp = 0;
    for k=1:N
        Iapp = Iapp + (f(x(k)) + f(x(k+1)) + 4*f((x(k)+x(k+1))/2));
    end
    Iapp = (Iapp*h)/6
    E = abs(Iex - Iapp);
endfunction

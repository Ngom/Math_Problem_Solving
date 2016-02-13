function[IS,ES]=simpson(a,b,Iex,Nmax)
    for N=1:Nmax
        [h,x]=meshe(a,b,N)
        IS=0
        for k=1:N
            IS = IS +(h/6)*(f(x(k))+4*f((x(k)+x(k+1))/2)+f(x(k+1)));
        end
        ES(N)=abs(Iex-IS);
    end
    plot(ES)
endfunction
    a=0
    b=4
    Iex=184
    Nmax=100

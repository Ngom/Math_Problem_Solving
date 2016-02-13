// fonction test du code (exepmle d'évaluation) et paramétres
function y=f(x)
  y=x^2 - 2;
endfunction
function y=df(x)
  y=2*x;
endfunction

K=30
eps=10^-8
y0 = 0.5

a=0

b=3

// Code scilab de la méthode de Newton 

function[x,k]=Newton(f,df,a,b,y0,eps,K)
    
    k=1
    y=y0
     while(abs(f(y))>eps & k<K )
        k=k+1
        y=y-f(y)/df(y)
    end
    x=y
endfunction

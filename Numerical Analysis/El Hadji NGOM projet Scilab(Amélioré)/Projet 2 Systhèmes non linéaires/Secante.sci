// fonction test du code (exepmle d'évaluation) et paramétres

function y=f(x)
  y=x^2-2;
endfunction

eps=10^-8
 K=1000
 k=0
 x0 = 0.5
 x1 = 1
    a=0
    b=3
// Methode des Secantes

function[z,k]=Secante(f,a,b,x0,x1,eps,K)
    x=x0
    y=x1
     while (abs(f(x))>eps & k<K)
        x= x - f(x)*((x-y)/(f(x)-f(y)))
        k=k+1
    end
   z=x 
endfunction

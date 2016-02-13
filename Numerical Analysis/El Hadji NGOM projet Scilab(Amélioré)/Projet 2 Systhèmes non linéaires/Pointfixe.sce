// fonction test du code (exepmle d'évaluation) et paramétres
function y=f(x)
  y=x^2 - 2;
endfunction
eps=10^-2

a=1

b=2

x0 = 0.5
niter = 7 // Approximation par excés apres 7 itération 

// Methode du point fixe

function[x]=Pointfixe(a,b,x0,eps,niter)
    x(1)=x0;
    for i=1:K,
      x(i+1) = f(x(i))
      if abs(f(x(i))+x(i+1))<eps then
          x = x(i+1)
          
      end
     end
endfunction



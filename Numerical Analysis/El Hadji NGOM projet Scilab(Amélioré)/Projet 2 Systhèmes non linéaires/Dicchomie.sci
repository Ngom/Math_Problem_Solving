// fonction test du code (exepmle d'évaluation) et paramétres
function y=f(x)
  y=x^2 - 2;
endfunction
eps=10^-8

a=0

b=3

// Methode de Dichotomie

function [x,n]=dicho(f,a,b,eps)
  if (f(a)*f(b)>0) then
    disp("Il ne semble pas y avoir de zero dans l''intervalle.");
    return;
  end
n=0
  while ((abs(b-a))>eps)
    if (f(a)*f((a+b)/2)>0) then
      a = (a+b)/2;
    else
      b = (a+b)/2;
    end
    n=n+1
  end
  x = (a+b)/2;
endfunction

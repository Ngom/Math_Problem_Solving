A = [1 2;-3 -1]
b = [3;-4]



function [x]=Gausssanspivot(A,b)

// résout le système Ax=b par

[m,n]=size(A);o=length(b);
if m~=n | o~=n then, error('probleme de dimensions'), end;
// initialisation
zero=1.e-16;
for k=1:n-1
   u=A(k,k:n);pivot=A(k,k);i0=k
   if abs(pivot)<zero then, error('stop : pivot nul'), end;
   for j=k+1:n
      s=A(j,k)/pivot;
      v=A(j,k:n);
      A(j,k:n)=v-s*u;
      b(j)=b(j)-s*b(k);
   end;
end;

// A=A_n est une matrice triangulaire supérieure
// on résout A_nx=b_n par remontée ci dessous

if abs(A(n,n))>=zero then 
    x(n)=b(n)/A(n,n);
else
    error('matrice non inversible')
end;
for i=n-1:-1:1
   x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end;
endfunction

function[x]=GaussSansPivot(A,b,n)
U=[A,b];

for k=1:(n-1), 
  p=U(k,k);
  if p==0 then disp( 'la méthode de Gauss sans pivot n''est pas possible'); 
    abort;
  end
   for i=(k+1):n,
     coeff=U(i,k)/p;
     U=combinaisonLigne(i,k,-coeff,U);
   end
end
x=remontee(U(:,1:n),U(:,n+1),n);
endfunction;

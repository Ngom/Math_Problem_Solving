A = [2 1 -1;1 1 1;-1 1 6]

function A=CHOLESKY(A)
// 
[m,n]=size(A);
if m~=n then, error('la matrice n''est pas carree'), end;
zero=1.e-10;
if norm(A-A','inf')>zero then, error('matrice non symetrique'), end;
for j=1:n
   for k=1:j-1
      A(j,j)=A(j,j)-A(j,k)*A(j,k);
   end;
   if A(j,j)< zero then, error('matrice non positive '), end;
   if abs(A(j,j))< zero then, error('matrice non définie'), end;
   A(j,j)=sqrt(A(j,j));
   for i=j+1:n
      for k=1:j-1
         A(i,j)=A(i,j)-A(j,k)*A(i,k);
      end;
      A(i,j)=A(i,j)/A(j,j);
   end;
end;
endfunction

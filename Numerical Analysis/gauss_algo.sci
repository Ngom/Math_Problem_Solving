A = [1 2;-3 -1]
b = [3;-4]

function[A,b,k,x]=gauss_algo(A,b)
    n=size(A,'c')
    k=1
    for k=1:n-1
        for i=k+1:n
            b(i)=b(i)-(A(i,k)/A(k,k))*b(k)
            for j=k+1:n
                A(i,j)=A(i,j)-(A(i,k)/A(k,k))*A(k,j)
            end
            for j=1:k
                A(i,j)=0
            end
        end
     end
 // résolution de la triangulaire
 
 if abs(A(n,n))>0 then 
    x(n)=b(n)/A(n,n);
else
    error('matrice non inversible')
end;
for i=n-1:-1:1
   x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end;
     
endfunction
    

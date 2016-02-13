function[x]= descente(A,b)
    n=size(A)
    i=1:n
    j=1:n
    A=A(i,j)
    x(1)=b(1)/A(1,1)   
for k=2:n
    s=0
    for j=1:k-1
        s=s+A(k,j)*x(j)
    end
    x(k)=(b(k)-s)/A(k,k)
end
endfunction

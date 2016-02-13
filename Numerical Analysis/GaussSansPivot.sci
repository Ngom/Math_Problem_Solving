function[x]=Gauss(A,b)
    n=size(A,1)
    for k=1:n-1
        for i=k+1:n
        p(i)=A(i,k)/A(k,k)
        for j=k+1:n
            A(i,j)=A(i,j)-p(k)*A(k,j)
        end
        b(i)=b(i)-b(k)*p(k)
    end
 end
x(n)=b(n)/A(n,n)
for k=n-1:-1:1
    s=0
    for j=k-1:n
        s=s+A(i,j)*x(j)
    end
    x(i)=(b(i)-s)/A(k,k)
end
endfunction

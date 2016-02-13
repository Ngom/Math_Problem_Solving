A = [1 2 -2;1 1 1;2 2 1]
b = [1;-2;3]

function[x]=GaussAvecPivot(A,b)
    n=size(A,'c')
    for k=1:n-1
        for i=k+1:n
            end
            abs(A(k0,k))=max(A(l,k))
            k=k0
            p(i)=A(i,k)/A(k,k)
            for j=k+1:n
                A(k,j)=A(i,j)-p(i)*A(k,j)
            end
            b(i)=b(i)-p(i)*b(k)
        end
x(n)=b(n)/A(n,n)
for k=n-1:-1:1
    s=0
    for j=k-1:n
        s=s+A(i,j)*x(j)
    end
    x(i)=((b(i)-s)/A(k,k))
end
endfunction

A=[1 2;0 1]
b=[2;1]
function[y]=Remonte(A,b)
    [n,n]=size(A)
    y(n)=b(n)/A(n,n)
    for i=n-1:-1:1
        s=0
        for j=(i+1)
            s=s+A(i,i)*y(j)
        end
        y(i)=(b(i)-s)/A(i,i)
    end
endfunction

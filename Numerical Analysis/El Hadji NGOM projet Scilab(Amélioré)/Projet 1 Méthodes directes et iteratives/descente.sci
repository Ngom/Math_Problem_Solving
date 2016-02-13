A=[1 0;2 1]
b=[1;3]
function[x]=Descente(A,b)
    n=size(A,'c')
    x(1)=b(1)/A(1,1)
    for i=2:n
        s=0
        for j=1:(i-1)
            s=s+A(i,j)*x(j)
        end
        x(i)=(b(i)-s)/A(i,i)
    end
endfunction   

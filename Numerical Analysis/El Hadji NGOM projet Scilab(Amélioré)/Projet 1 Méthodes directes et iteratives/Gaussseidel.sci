A = [2 1 -2;1 2 1;2 1 6]
b = [2;3;1]
x0=zeros(b)
tol=10^-8
iterMax = 100

// Code de Gauss-Seidel

function[x,iter]=Gaussseidel(A,b,tol,iterMax,x0)
    iter=0

    n=size(A,'c')
    r=norm(A*x0-b)
    while (r>tol & iter<iterMax)
        iter=iter+1
        x=x0
        for i=1:n
            s=0
            for j=1:i-1
                s=s+A(i,j)*x(j)
            end
            for j=i+1:n
                s=s+A(i,j)*x(j)
            end
            x(i)=(b(i)-s)/A(i,j)
        end
    end
endfunction

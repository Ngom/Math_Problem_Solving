function[Radius]=test(A)
    D=diag(diag(A));
    E=diag(diag(A))-tril(A);
    F=diag(diag(A))-triu(A);
    J=inv(D)*(E+F),
    if (max(abs(spec(J)))>=1) then
        disp('Jacobi method do not converge !!')
        Radius=max(abs(spec(J)))
    end
endfunction

function [x]= Jacobi(A,b,eps,x)
[n m] = size (A); // size of the matrix A
if n<>m then
    disp('this is not a squared matrix');
end

Itmax=1000.; //maximum number of iterations
iteration=0;
converg=0;

while (converg==0)
    for i=1:n
        s=0
        for j=1:n
            if i<>j then
                s=s+A(i,j)*x(j);
            end
        end
        y(i)=(1/A(i,i))*(b(i)-s);
    end
    abso = abs(x(1)-y(1));
    for i=2:n
        if abso<abs(x(i)-y(i)) then
            abso=abs(x(i)-y(i));
        end
    end
    iteration=iteration + 1;
    if((iteration==Itmax)|(abso<eps))  then
        converg=1;
    end
    x=y;
end
endfunction

function[x,iter]=Gauss_seidel(A,b,tol,iterMax,x0)
    iter=0
    [n,m]=size(A)
    r=norm(b-A*x0)
    while (r > tol & iter < iterMax)
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
            x(i)=(b(i)-s)/A(i,i)
        end
    end
endfunction

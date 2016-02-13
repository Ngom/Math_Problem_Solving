A = [1 2 -2;1 1 1;2 2 1]
b = [1;5;-4]
eps = 10^-8
x = [1;-2;7]
// test de convergence de Jacobi
function[]=test(A)
   
    D=diag(diag(A));
    E=diag(diag(A))-tril(A);
    F=diag(diag(A))-triu(A);
    J=inv(D)*(E+F),
    if (max(abs(spec(J)))>=1) then
       disp('Jacobi method do not converge !!')
    else
       disp(max(abs(spec(J))), 'Rayon spectral vaut:')
    end
endfunction


// Code de la methode de Jacobi
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

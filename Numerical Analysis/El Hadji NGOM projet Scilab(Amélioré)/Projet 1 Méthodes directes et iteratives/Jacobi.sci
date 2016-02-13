A = [1 2 -2;1 1 1;2 2 1]
b = [1;-2;3]
tol = 10^-8
x0=zeros(b)
iterMax = 100

function[x,iter]=Jacobi(A,b,tol,iterMax,x0)
 
 n=size(A,'c')
  r=norm(A*x0-b)
  iter=0
  while (r>tol & iter<iterMax)   
      iter=iter+1
      x=x0
      for i=1:n
          s=0
          for j=1:n-1
              s=s+A(i,j)*x(j)
          end
          for j=i+1:n
              s=s+A(i,j)*x(j)
          end
          x(i)=(b(i)-s)/A(i,i)
      end
end
endfunction

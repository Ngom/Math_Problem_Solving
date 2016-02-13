function [x]=descente(A,b,n)
x(1)=b(1)/A(1,1);
for k=2:n,
s=0;
for i=1:(k-1),
s=s+A(k,i)*x(i);
end
x(k)=(b(k)-s)/A(k,k);
end
endfunction
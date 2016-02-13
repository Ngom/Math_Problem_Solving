function[h,x]=meshe(a,b,N)
    h = (b-a)/N
    for i=1:N+1
        x(i) = a +(i-1)*h
    end
endfunction

function[y]=f(x,t)
    y=0
endfunction

function[y]=U0(x)
    y=sin(%pi*x)
endfunction
a=0;
b=1;
Ti=0;
Tf=1;
alfa =0, beta=0;
N=10, M=5;
[h,x]=meshe(a,b,N);
[k,t]=meshe(Ti,Tf,M);
A=zeros(N-1,M-1);

for i=1:N-1
    A(i,i)=(1/k+2/h^2);
end
for i=1:N-2
    A(i,i+1)=(-1/h^2);
    A(i+1,i)=(-1/h^2);
end

U=zeros(N+1,M+1)
for j=1:M+1
    U(1,j)=alfa;
    U(N+1,j)=beta;
end

for i=1:N+1
    U(i,1)=U0(x(i))
end

for j=2:M+2
    B(1)=f(x(2),t(j))+(1/k)*U(2,j-1)+(1/h^2)*U(1,j);
    B(N-1)=f(x(N),t(j))+(1/k)*U(N,j-1)+(1/h^)*U(N+1,j);
    for i=2:N-2
        B(i)=f(x(i+1),t(j))+(1/k)*U(i+1;j-1)
    end
    V=inv(A)*B
    for i=2:N
        U(i,j)=V(i-1)
    end
end

for j=1:M+1
    plot(U(:,j))
    xpause('yes')
    plot(x,U(:j))
end




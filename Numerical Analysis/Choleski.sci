function[L]=Choleski(A)
    [n,n]=size(A)
for i=1:n
    s(i)=0
    for k=1:i-1
        s(i)=s(i)+A(i,k)
    end
        L(i,i)=sqrt(A(i,i)-s(i))
        for j=i+1:n
            s=0
            for k=1:i-1
                s=s+A(i,k)*A(j,k)
            end
         L(i,j)=(A(i,j)-s)/L(i,i)
         end
     end
endfunction

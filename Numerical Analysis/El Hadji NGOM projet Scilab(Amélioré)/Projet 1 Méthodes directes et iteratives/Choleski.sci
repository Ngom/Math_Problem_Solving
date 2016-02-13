A = [2 1 -1;1 1 1;-1 1 6]

// factorisation de Cholesky

function[]=Choleski(A)

n=size(A,'c');
L=zeros(n,n);
// -----------------------------------------------------
L(1,1)=sqrt(A(1,1));
for i=1:(n-1)
    for k=1:(n-i)
        L(i+k,i)=(A(i+k,i)-sum(L(i+k,1:i-1).*L(i,1:i-1)))/L(i,i);
    end
    L(i+1,i+1)=sqrt(L(i+1,i+1)-sum(L(i+1,1:i).^2));
end
// affichage de la matrice triangulaire inférieure B
disp('matrice L :');
disp(L');

// vérification que le produit B*B' redonne A
disp('matrice A :');
disp(L*L');
endfunction

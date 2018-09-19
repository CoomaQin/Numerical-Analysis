function U = gram_schmidt2(V)
%modified    

s = size(V);
U = zeros(s(1),s(2));
    
U(:,1) = V(:,1)/norm(V(:,1));
    
for k = 2:s(2)
    vec = V(:,k);
    dot_p = sum(U(:,1:k-1).*vec);
    dot_p = dot_p./sum(U(:,1:k-1).*U(:,1:k-1));
    vec_m = dot_p.*U(:,1:k-1); 
    vec = vec - sum(vec_m,2);
    U = U + sparse(1:s(1),k,vec/norm(vec),s(1),s(2));
end
 
end
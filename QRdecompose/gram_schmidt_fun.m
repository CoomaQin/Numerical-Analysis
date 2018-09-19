function U = gram_schmidt_fun(V)
    
%input matrix V contains vectors V(:,k), k=1:size(V,2)
%output matrix U contains the orthogonalized vectors U(:,k), k=1:size(V,2)
    
    
%stabilized gram-schmidt
s = size(V);
U = sparse(s(1),s(2));
    
U(:,1) = V(:,1)/norm(V(:,1));
    
for k = 2:s(2)
    vec = V(:,k);
    dot_p = sum(bsxfun(@times,U(:,1:k-1),vec),1);
    dot_p = dot_p./sum(bsxfun(@times,U(:,1:k-1),U(:,1:k-1)));
    vec_m = bsxfun(@times,dot_p,U(:,1:k-1)); 
    vec = vec - sum(vec_m,2);
    U = U + sparse(1:s(1),k,vec/norm(vec),s(1),s(2));
end
 
end
%     For n = 2,3,..., generate the Hilber matrix of order n, and also
%     generate the n-vector b = Hx, where x is the n-vector with all of its 
%     components equal to 1. Use a library routine for Gaussian elimination
%     to solve Hx = b, obtaining an approximate solution x_approx. Compute
%     the infinity norm of the residual r = b - Hx_approx and of the error
%     dx =  x_approx - x, where x is the vector of all ones. How large can
%     you take n before the error is 100%. Also use a condition estimator to
%     obtain cond(H) for each value of n. Try to charactarize the condition 
%     number as a function of n. As n varies, how does the number of correct
%     digits in the components of the computed solution relate to the condition
%     number of the matrix?
m = 33
for n = 2:m
    n
    H = hilb(n);
    conds(n) = cond(H);
    b = H*ones(n,1);
    try
        L = chol(H, 'lower');
        x_approx = L'\(L\b);
    catch
        try
            x_approx = H\b;
        catch
            m = n-1
            break;
        end
    end
    residuals(n) = norm(b - H*x_approx,Inf);
    dx = norm(x_approx - ones(n,1),Inf);
    rel_errs(n) = dx;
end

plot(conds)
title('条件数')
xlabel('n');
figure;
plot(log10(rel_errs));
title('解分量的有效位数');
xlabel('n');
figure;
title('残差');
plot(log10(residuals));
xlabel('n');
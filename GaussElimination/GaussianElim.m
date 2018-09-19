% GaussianElimination Solve linear system using Gaussian elimination.
%     pivotFlag==0    - use no pivot
%     pivotFlag==1    - (default) use the maximum in the column as pivot
%     pivotFlag==2    - use the maximnu in the sub-matrix as pivo
function X = GaussianElim(A, B, pivotFlag)
    n=size(A,1);
        X=zeros(size(B));
    AB=[A B];
    if pivotFlag==2
        columnPermute=1:n;
    end
    % elimination
    for c=1:n-1
        if(pivotFlag==1) % partial pivoting
            [~, idx]=max(abs(AB(c:end,c)));
            idx=idx+c-1;
            AB([idx,c],c:end)=AB([c,idx],c:end);
        elseif(pivotFlag==2) % complete pivoting
            [m,idx1]=max(abs(AB(c:end,c:n)));
            [~,idx2]=max(m);
            idx1=idx1(idx2)+c-1;
            idx2=idx2+c-1;
            AB([idx1,c],c:end)=AB([c,idx1],c:end);
            AB(:,[idx2, c])=AB(:,[c,idx2]);
            columnPermute([idx2, c])=columnPermute([c,idx2]);
        end
        if(AB(c,c)==0)
            if(pivotFlag)
                error('The matrix is singular');
            else
                error('0 pivot found.');
            end
        end
        AB(c+1:end,c:end)=AB(c+1:end,c:end)-(AB(c+1:end,c)/AB(c,c))*AB(c,c:end);
    end
    
    % substitution
    X(n,:)=AB(n,n+1:end)/AB(n,n);
    for i = n-1:-1:1
        X(i,:)=(AB(i,n+1:end)-AB(i,i+1:n)*X(i+1:n, :))/AB(i,i);
    end
    
    if(pivotFlag==2) 
        % If complete pivoting is used the order of x may be changed.
        X(columnPermute,:)=X;
    end
   
end

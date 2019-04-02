function [lambda,X] = Eigen_TopL(A,d)
% A: N x N symmetric sparse adjacency matrix
% d: preset dimension
% return top-L eigen-decomposition of A containing at least d positive eigenvalues
if ~ issymmetric(A)
    error('The matrix is not symmetric!');
end
L = d + 10;          
while 1         % can be improved to reduce redundant calculation if L <= 2d not hold
    L = L + d;
    [X,lambda] = eigs(A,L);
    lambda = diag(lambda);
    if (sum(lambda > 0) >= d)
        break;
    end
end
% only select top-L
[~,temp_index] = sort(abs(lambda),'descend');  
lambda = lambda(temp_index);
temp_max = find(cumsum(lambda > 0) >= d);
lambda = lambda(1:temp_max(1));
temp_index = temp_index(1:temp_max(1));
X = X(:,temp_index);
end
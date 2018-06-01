function [U,V] = Shift_Embedding(lambda,X,order,coef,d)
% lambda,X: top-L eigen-decomposition 
% order: a number indicating the order
% coef: a vector of length order, indicating the weights for each order
% d: preset embedding dimension
% return: content/context embedding vectors
lambda_H = Eigen_Reweighting(lambda,order,coef);      % High-order transform
[~,temp_index] = sort(abs(lambda_H),'descend');       % select top-d
temp_index = temp_index(1:d);
lambda_H = lambda_H(temp_index);
U = X(:,temp_index) * diag(sqrt(abs(lambda_H)));      % Calculate embedding
V = X(:,temp_index) * diag(sqrt(abs(lambda_H)) .* sign(lambda_H));

end